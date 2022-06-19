import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double lognitude;

  void getLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      lognitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
