import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // void extraFucntionPracticed(){
  //
  //   //
  //   // //Future Delayed Function
  //   // void timer(){
  //   //   //Process which is getting delayed for some time
  //   //   Future.delayed(Duration(seconds: 5),(){
  //   //     print("Process Executed after 5 Seconds.............................................");
  //   //   });
  //   //
  //   //   print("Doing Next Work without waiting for the delayed to complete...........................");
  //   // }
  //   late String username;
  //   Future<void> getData() async
  //   {
  //
  //     await Future.delayed(Duration(seconds:6),(){
  //       username = "Abhay";
  //     });
  //     print("Can i do another stuff");
  //   }
  //
  //   void showData() async
  //   {
  //     print("In the showData.....");
  //     await getData();
  //     print("$username");
  //   }
  // }
  int counter = 1;

  // void getData() async {
  //   http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=d23c902d4d5d4c2af575c06d4a6a8c99'));
  //
  //   Map data = jsonDecode(response.body);
  //   Map tempData = data['main'];
  //   double temp = tempData['temp'];
  //   print(temp);
  // }

  // Future<void> getData() async {
  //   try {
  //
  //
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = jsonDecode(response.body);
  //       // Assuming 'main' is a key in the JSON response
  //       Map<String, dynamic> tempData = data['main'];
  //       double temp = tempData['temp'];
  //       print(temp);
  //     } else {
  //       print('Failed to load data. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state is called......................");
    // startApp();
    // timer();
    // showData();
    // getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Dispose State is called............................");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = new TextEditingController();


    Map weather_info = ModalRoute.of(context)!.settings.arguments as Map;

    //Accessing all the Values from loading.dart
    String location = weather_info["value_location"];
    String liveIcon = weather_info["value_liveIcon"];
    String weatherName = weather_info["value_weatherName"];
    String temperature = weather_info["value_temp"];
    String humidity = weather_info["value_humidity"];
    String windSpeed = weather_info["value_windspeed"];
    String weatherDescription = weather_info["value_weatherDescription"];
    String country = weather_info["value_country"];

    return Scaffold(
        resizeToAvoidBottomInset: false,

        //Simple way to change the app bar color:
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blueGrey,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueGrey, Colors.blueAccent])),
              child: Column(
                children: <Widget>[
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(20)),
                      child:
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              if((searchController.text).replaceAll(' ', '') == ''){
                                print("Blank Text");
                              }
                              else{
                                Navigator.pushReplacementNamed(context, '/loading',arguments: {

                                  "searchText":searchController.text});
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                              child: const Icon(
                                Icons.search_rounded,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        Expanded(
                              child: TextField(
                                controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search City Here...",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ))
                        ],
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          //container 1
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                margin: EdgeInsets.fromLTRB(2, 2, 0, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Icon(WeatherIcons.rain)
                                      Image.network(
                                          "https://openweathermap.org/img/wn/$liveIcon@2x.png"),
                                      Text(
                                        "$weatherName in $location",
                                        style: TextStyle(
                                            fontFamily: 'Splash',
                                            fontSize: 20,
                                            color: Colors.white),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(4, 2, 0, 0),
                                child: Row(
                                    children: [Icon(WeatherIcons.thermometer)]),
                              ),
                              Container(
                                  padding: EdgeInsets.all(25),
                                  child: Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "$temperature",
                                          style: TextStyle(fontSize: 80),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Text(
                                          "c",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontStyle: FontStyle.italic),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    //Niche Wala Main container
                    child: Column(
                      children: [
                        Row(
                          //
                          children: [
                            Expanded(
                              child: Container(
                                // Wind
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(4, 2, 0, 0),
                                      child: Row(children: [
                                        Icon(WeatherIcons.strong_wind)
                                      ]),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "$windSpeed",
                                              style: TextStyle(fontSize: 30),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "km/h",
                                              style: TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                //humidity
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.fromLTRB(5, 10, 10, 0),

                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(4, 2, 0, 0),
                                      child: Row(children: [
                                        Icon(WeatherIcons.humidity)
                                      ]),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "$humidity",
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //Row 1 of main container
                          children: [
                            Expanded(
                              child: Container(
                                //Weather Description
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(4, 2, 0, 0),
                                      child: Row(children: [
                                        Icon(
                                          Icons.description,
                                        )
                                      ]),
                                    ),
                                    Container(
                                        height: 60,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "$weatherDescription",
                                              style: (TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'splash')),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(4, 2, 0, 0),
                                      child: Row(
                                          children: [Icon(Icons.location_pin)]),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "$country",
                                              style: TextStyle(
                                                  fontFamily: 'splash',
                                                  fontSize: 20),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 110, 10, 0),
                      padding: const EdgeInsets.all(10),
                      child: const Column(
                        children: [
                          Text(
                            "Made by Abhay",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Data provided by Open Weather Api",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ))
                ],
              )),
        ));
  }
}
