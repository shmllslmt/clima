import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  //TODO: Step 29 - Create a final locationWeather property
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //TODO: Step 35 - Create a weatherModel object

  //TODO: Step 31 - Override the initState(), try and print the locationWeather property (widget.locationWeather)
  //TODO: Step 33 - In the initState(), pass the widget.locationWeather to the updateUI() method

  //TODO: Step 32 - Create a updateUI() method that receives a dynamic weatherData property. Extract the temp, weather id and city name value into here
  //TODO: Step 36 - In the updateUI() method, call the getWeatherIcon and getWeatherMessage to get appropriate values to be displayed
  //TODO: Step 37 - Wrap the code in the updateUI() method in the setState() method
  //TODO: Step 40 - What if weatherData is null? What happens then? Update the properties accordingly

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
                      //TODO: Step 39 - Call the getLocationWeather() method and updateUI() methods
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Step 41 - Go to the CityScreen using the Navigator.push()
                      //TODO: Step 44 - A dynamic property will receive the output of Navigator.push()
                      //TODO: Step 45 - If the dynamic property isn't null, get weather data based on the cityName, then updateUI()
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
                      //TODO: Step 34 - Replace the text with temp property
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

// double temp = weatherData['main']['temp'];
// int condition = weatherData['weather'][0]['id'];
// String city_name = weatherData['name'];
//
// print('Temp: $temp');
// print('Condition: $condition');
// print('City Name: $city_name');