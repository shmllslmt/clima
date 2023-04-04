import 'package:geolocator/geolocator.dart';

//Create a Location class
class Location {
  //It has two String properties latitude and longitude
  double? latitude;
  double? longitude;

  //It has a getCurrentLocation() method that get the current position of the device
  Future<void> getCurrentLocation() async {
    //This request the permission to access the location services of the device
    LocationPermission locationPermission = await Geolocator
        .requestPermission();

    if (LocationPermission.whileInUse == locationPermission ||
        LocationPermission.always == locationPermission) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    }
  }
}
