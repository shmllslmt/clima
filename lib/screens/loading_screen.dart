import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';

const String apiKey = '93228ccfc3f4697fe4ff3c5014d01d20';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Create two double variables that will hold the latitude and longitude values
  double? latitude;
  double? longitude;

  //Create a getLocationData() method that will get the current location of the device
  Future<void> getLocationData() async {
    //Wrap in a try and catch block in the case that the device location cannot be retrieved
    try {
      //Create a Location object
      Location location = Location();
      //Call the getCurrentLocation() method
      await location.getCurrentLocation();

      latitude = location.latitude;
      longitude = location.longitude;

      //Create a NetworkHelper object, then call its getData() method
      NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();

      //Go to LocationScreen using Navigator.push()
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen();
      }));
      //TODO: Step 30 - Pass the weatherData property to LocationScreen
      //Print the latitude and longitude value
      print(latitude);
      print(longitude);
    } catch(e) {
      print(e);
    }
  }

  //Instead of having to click a button to print the current location of the device, print the current location straightaway when LoadingScreen appears
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //TODO: Step 27 - Add the flutter spinkit dependency, then add the SpinKitDoubleBounce widget as the child of the Center widget
        //TODO: Step 28 - Change the color to white, and size to 100
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
