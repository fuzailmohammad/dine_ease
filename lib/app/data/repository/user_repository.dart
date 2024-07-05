import 'package:dine_ease/app/data/models/dto/user.dart' as user_dto;
import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/base/base_controller.dart';
import 'package:dine_ease/utils/helper/exception_handler.dart';
import 'package:dine_ease/utils/storage/storage_utils.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository extends BaseController {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<bool> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return false;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final firebase_auth.AuthCredential credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      firebase_auth.UserCredential userCredential = await _auth.signInWithCredential(credential);
      _storeUser(userCredential.user);
      return true;
    } catch (error) {
      HandleError.handleError(error.toString());
      return false;
    }
  }

  Future<bool> loginWithFacebook() async {
    try {
      final LoginResult result = await _facebookAuth.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final firebase_auth.AuthCredential credential = firebase_auth.FacebookAuthProvider.credential(accessToken.tokenString);
        firebase_auth.UserCredential userCredential = await _auth.signInWithCredential(credential);
        _storeUser(userCredential.user);
        return true;
      } else {
        HandleError.handleError(ErrorMessages.retry);
        return false;
      }
    } catch (error) {
      HandleError.handleError(error.toString());
      return false;
    }
  }

  Future<bool> loginWithEmail(String email, String password) async {
    try {
      firebase_auth.UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _storeUser(userCredential.user);
      return true;
    } catch (error) {
      HandleError.handleError(error.toString());
      return false;
    }
  }

  void _storeUser(firebase_auth.User? user) {
    if (user != null) {
      Storage.setUser(user_dto.User.fromFirebaseUser(user));
    }
  }

  Future<void> logout() async {
    firebase_auth.User? user = _auth.currentUser;
    if (user != null &&
        user.providerData
            .any((element) => element.providerId == 'google.com')) {
      await _googleSignIn.signOut();
    }
    if (user != null &&
        user.providerData
            .any((element) => element.providerId == 'facebook.com')) {
      await _facebookAuth.logOut();
    }
    await _auth.signOut();
    Storage.clearUser();
  }
}
