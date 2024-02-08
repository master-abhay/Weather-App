import 'package:app_weather/WORKER/worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String location;
  late String weatherName;
  late String temp;
  late String humidity;
  late String windSpeed;
  late String weatherDescription;
  late String liveIcon;
  late String country;

  void startApp(location) async {
    worker instance = worker(location: "$location");
    await instance.loadData();
    location = instance.location;
    liveIcon = instance.liveIcon;
    weatherName = instance.weatherName;
    temp = instance.temp;
    humidity = instance.humidity;
    windSpeed = instance.windSpeed;
    weatherDescription = instance.weatherDescription;
    country = instance.country;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "value_location": location,
        "value_liveIcon": liveIcon,
        "value_weatherName": weatherName,
        "value_temp": temp,
        "value_humidity": humidity,
        "value_windspeed": windSpeed,
        "value_weatherDescription": weatherDescription,
        "value_country":country
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Loading Activity initState is Running.....................");
    // startApp();
    startApp("London");
  }

  @override
  Widget build(BuildContext context) {



      Map searchText = ModalRoute.of(context)!.settings.arguments as Map;
      String text_Search = searchText['searchText'];
      if(text_Search.isNotEmpty ?? false){
        location = text_Search;

      }startApp(location);






    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/splash.png",
            height: 250,
            width: 250,
          ),
          Text(
            "Know Your Weather",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'Splash'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Made by Abhay",
            style: TextStyle(color: Colors.yellowAccent),
          ),
          SizedBox(
            height: 5,
          ),
          SpinKitWave(
            color: Colors.white,
            size: 40.0,
          ),
        ],
      )),
    );
  }
}
