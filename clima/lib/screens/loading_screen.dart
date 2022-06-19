import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // final String apikey = 'b99fd0d07afb58dc732f63996444a94d';
  final String apikey = 'e72ca729af228beabd5d20e3b7749713';
  double latitude;
  double lognitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getData() async {
    http.Response response;
    Future<Location> fetchLocation() async {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/3.0/onecall?lat=${latitude}&lon=${lognitude}&exclude={part}&appid=${apikey}'));

      print(response.body);

    }
    fetchLocation();
  }

  // http.Response response = await http.get(Uri.parse(
  //     'https://api.openweathermap.org/data/3.0/onecall?lat=${latitude}&lon=${lognitude}&exclude={part}&appid=${apikey}'));

  // var decodedData = jsonDecode(data);
  // double temperature = decodedData['main']['temp'];
  // int condition = decodedData['weather'][0]['id'];
  // String cityName = decodedData['name'];
  // print(temperature);
  // print(condition);
  // print(cityName);

  void getLocation() async {

    Location l = Location();
    await l.getLocation();
    latitude = l.latitude;
    lognitude = l.lognitude;
    print(latitude);
    print(lognitude);

    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
