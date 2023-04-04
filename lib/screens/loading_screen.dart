import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//TODO: Step 12 - Add the http package dependency and import the http.dart file
//TODO: Step 16 - Import dart:convert

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //TODO: Step 18 - Create two double variables: latitude and longitude
  //Create a getLocation() method that will get the current location of the device
  void getLocation() async {
    //Wrap in a try and catch block in the case that the device location cannot be retrieved
    try {
      LocationPermission locationPermission = await Geolocator
          .requestPermission();

      if (LocationPermission.whileInUse == locationPermission ||
          LocationPermission.always == locationPermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);

        //Print the current location of the device
        print(position);
      }
    } catch(e) {
      print(e);
    }
  }



  //Instead of having to click a button to print the current location of the device, print the current location straightaway when LoadingScreen appears
  @override
  void initState() {
    super.initState();
    getLocation();
  }



  //TODO: Step 7 - Move the code in the getLocation() method into the location.dart file
  //TODO: Step 11 - In the getLocation() method, create a Location object, call the getCurrentLocation() method and print the latitude and longitude value

  //TODO: Step 23 - Combine the getLocation() and getData() method, create a NetworkHelper object in the method, call the getData() method
  //TODO: Step 24 - Go to LocationScreen using Navigator.push()
  //TODO: Step 28 - Pass the weatherData property to LocationScreen

  //TODO: Step 13 - Create a getData() method that will make an API call to openweathermap using the http get method
  //TODO: Step 19 - Instead of using sample latitude and longitude, use our very own latitude and longitude value
  //TODO: Step 14 - Try and print the response body and statusCode
  //TODO: Step 15 - Print the response body if the statusCode is equal to 200, else, print the statusCode
  //TODO: Step 17 - Use jsonDecode to unpack the response body data (temp, weather id, city name)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //TODO: Step 25 - Add the flutter spinkit dependency, then add the SpinKitDoubleBounce widget as the child of the Center widget
        //TODO: Step 26 - Change the color to white, and size to 100
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
