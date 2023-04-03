import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  //TODO: Step 27 - Create a final locationWeather property
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //TODO: Step 33 - Create a weatherModel object
  //TODO: Step 29 - Override the initState(), try and print the locationWeather property (widget.locationWeather)
  //TODO: Step 31 - Pass the widget.locationWeather to the updateUI() method

  //TODO: Step 30 - Create a updateUI() method that receives a dynamic weatherData property. It extract the temp, weather id and city name value into three appropriate properties
  //TODO: Step 34 - Call the getWeatherIcon and getWeatherMessage to get the appropriate value to be displayed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      //TODO: Step 35 - Call the getWeatherData method and update UI
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Step 36 - Go to the CityScreen using the Navigator.push()
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      //TODO: Step 32 - Replace the text with temp property
                      '32°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
