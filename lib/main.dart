
import 'package:flutter/material.dart';
import 'package:app_weather/Activity/loading.dart';
import 'package:app_weather/Activity/home.dart';
import 'package:app_weather/Activity/location.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) =>  Loading(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/home': (context) =>  Home(),
      '/loading':(context) => Loading()
    },
    debugShowCheckedModeBanner: false,
  ),
  );
}
