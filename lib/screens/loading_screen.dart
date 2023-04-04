import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart';
//TODO: Step 16 - Import dart:convert

const String apiKey = '93228ccfc3f4697fe4ff3c5014d01d20';

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
      //Create a Location object
      Location location = Location();
      //Call the getCurrentLocation() method
      await location.getCurrentLocation();

      //Print the latitude and longitude value
      print(location.latitude);
      print(location.longitude);
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


  //TODO: Step 23 - Combine the getLocation() and getData() method, create a NetworkHelper object in the method, call the getData() method
  //TODO: Step 24 - Go to LocationScreen using Navigator.push()
  //TODO: Step 28 - Pass the weatherData property to LocationScreen

  //Create a getData() method that will make an API call to openweathermap using the http get method
  void getData() async {
      var response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$apiKey'));

      //Print the response body if the statusCode is equal to 200, else, print the statusCode
      if(response.statusCode == 200) {
        print(response.body);
      } else
        print(response.statusCode);
  }
  //TODO: Step 19 - Instead of using sample latitude and longitude, use our very own latitude and longitude value

  //TODO: Step 17 - Use jsonDecode to unpack the response body data (temp, weather id, city name)

  @override
  Widget build(BuildContext context) {
    getData();
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
