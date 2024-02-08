import 'dart:convert';

import 'package:http/http.dart' as http;

class worker {
  late String location;
  late String weatherName;
  late String temp;
  late String humidity;
  late String windSpeed;
  late String weatherDescription;
  late String liveIcon;
  late String country;

  //Constructor to get location.
  worker({required this.location}) {
    location = this.location;
  }

  Future<void> loadData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=d23c902d4d5d4c2af575c06d4a6a8c99"));
      Map data = jsonDecode(response.body);
      print(data);

      Map main = data["main"];


      //Accessing Temperature:
      temp = (main['temp'] - 273.15).toStringAsFixed(2);

      //Accessing Humidity:
      humidity = main['humidity'].toString();

      //Accessing Wind Speed:
      Map wind = data["wind"];
      windSpeed = (wind['speed'] / 0.27777777777777777777777777777778)
          .toStringAsFixed(2);

      //Accessing Description:
      List weather = data['weather'];
      Map weatherFullDetails = weather[0];
      weatherName = weatherFullDetails["main"];
      weatherDescription = weatherFullDetails["description"];

      //Accessing liveIcon
      liveIcon = (weatherFullDetails["icon"]).toString();

      //Accessing Countary
      Map _country = data['sys'];
      country = (_country['country']).toString();



    } catch (e) {
      location = "NA";
      liveIcon = "10d";
      weatherName = "NA";
      temp = "NA";
      humidity = "NA";
      windSpeed = "NA";
      weatherDescription = "NA";
      country = "NA";
    }
  }
}
