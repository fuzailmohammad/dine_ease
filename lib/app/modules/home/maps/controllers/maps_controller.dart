import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapsController extends GetxController {
  final LatLng center = const LatLng(51.5, -0.09);

  var currentLocation = const LatLng(0, 0).obs;

  late Location location;

  @override
  void onInit() {
    super.onInit();
    _initializeMap();
    _requestPermission();
  }

  void _initializeMap() {
    location = Location();

    location.onLocationChanged.listen((LocationData locationData) {
      currentLocation.value = LatLng(
        locationData.latitude ?? 0,
        locationData.longitude ?? 0,
      );
    });
    refresh();
  }

  Future<void> _requestPermission() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();
    currentLocation.value = LatLng(
      locationData.latitude ?? 0,
      locationData.longitude ?? 0,
    );
  }
}
