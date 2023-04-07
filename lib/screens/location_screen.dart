import 'package:clima_flutter/screens/city_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  //Create a final locationWeather property
  final locationWeather;

  LocationScreen({required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temp;
  String? weatherIcon;
  String? weatherMessage;
  String? city_name;
  //Create a weatherModel object
  WeatherModel weatherModel = WeatherModel();

  // Override the initState(), try and print the locationWeather property (widget.locationWeather)
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  //Create a updateUI() method that receives a dynamic weatherData property.
  void updateUI(var weatherData) {
    setState(() {
      //What if weatherData is null? What happens then?
      if(weatherData == null) {
        temp = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to retrieve information';
        city_name = 'any city';

        return;
      }
      double temperature = weatherData['main']['temp'];
      temp = temperature.toInt();
      //Call the getWeatherIcon and getWeatherMessage to get appropriate values to be displayed
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition!);
      weatherMessage = weatherModel.getMessage(temp!);
      city_name = weatherData['name'];
    });
  }

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
                      //Call the getLocationWeather() method and updateUI() methods
                      var weatherData = weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      //Go to the CityScreen using the Navigator.push()
                      var typedCity = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));

                      //If the dynamic property isn't null, get weather data based on the cityName, then updateUI()
                      if(typedCity != null) {
                        var weatherData = await weatherModel.getCityWeather(typedCity);
                        updateUI(weatherData);
                      }
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
                      temp.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon ?? '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $city_name!",
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
