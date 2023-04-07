import 'package:http/http.dart';
import 'dart:convert';



//Create a class NetworkHelper
class NetworkHelper {
  //It has a String property named url
  String url;

  NetworkHelper({required this.url});

  //Create an async getData() method based on the getData() method in the LoadingScreen. This method returns jSON decoded data
  Future getData() async {
    //Use our very own latitude and longitude value
    Response response = await get(Uri.parse(url));

    //Print the response body if the statusCode is equal to 200, else, print the statusCode
    if (response.statusCode == 200) {
      //Use jsonDecode to unpack the response body data (temp, weather condition, city name)
      print(response.body);

      return jsonDecode(response.body);

    } else
      print(response.statusCode);
  }
}


