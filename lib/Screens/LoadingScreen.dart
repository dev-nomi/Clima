import 'package:flutter/material.dart';
import 'package:clima/Services/Location.dart';
import 'package:http/http.dart' as http;
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }
  void getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();
    lat=location.latitude;
    lon=location.longitude;
    print('$lat,$lon');

  }
  void getData()async{
    http.Response res = await http.get('https://api.openweathermap.org/data/2.5'
        '/weather?lat=${lat.toString()}&lon=${lon.toString()}&appid=d974dadae0dd2c46a3e664815d4aa458');
    print(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}