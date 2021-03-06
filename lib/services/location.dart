import 'package:geolocator/geolocator.dart';

class location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      // print(longitude);
    } catch (e) {
      print(e);
    }
  }
}
