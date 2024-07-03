import 'package:dine_ease/app/data/models/dto/response.dart';
import 'package:dine_ease/app/data/models/dto/user.dart';
import 'package:dine_ease/app/data/models/request/auth_request.dart';
import 'package:dine_ease/app/data/models/response/user_response.dart';
import 'package:dine_ease/app/data/values/urls.dart';
import 'package:dine_ease/base/base_repository.dart';
import 'package:dine_ease/utils/helper/exception_handler.dart';

class UserRepository extends BaseRepository {
  Future<RepoResponse<User>> signUp(SignUpRequest data) async {
    final response =
        await controller.post(path: URLs.signUp, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: UserResponse.fromJson(response).data);
  }
}
