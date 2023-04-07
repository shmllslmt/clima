import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Create a getLocationData() method that will get the current location of the device
  Future<void> getLocationData() async {
    //Wrap in a try and catch block in the case that the device location cannot be retrieved
    try {
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather();

      //Go to LocationScreen using Navigator.push()
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          // Pass the weatherData value to the LocationScreen
          locationWeather: weatherData,
        );
      }));
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
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
