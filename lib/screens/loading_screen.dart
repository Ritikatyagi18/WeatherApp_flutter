

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/home.dart';
import 'package:weather/services/air_quality.dart';


class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';


  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}


class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
   // Location().getCurrentLocation();
    getLocationData();
  }
  void getLocationData() async{
    AirPollutionModel airPollutionModel= AirPollutionModel();
    var aqiData = await airPollutionModel.getLocationAQI();
    String cityName = await airPollutionModel.getCityName();

    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(
        locationAQI: aqiData,
        CITY: cityName,
    )
    ));



  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Color(0XFF70C9F4),
          size: 100.0,
        ),
      ),
    );
  }
}