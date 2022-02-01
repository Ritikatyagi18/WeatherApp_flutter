import 'package:flutter/material.dart';
import 'package:weather/services/air_quality.dart';
import 'package:weather/widgets/pollutant_card.dart';

class Home extends StatefulWidget {
  static String id = 'home';
  final locationAQI;
  final CITY;
  Home({this.locationAQI,this.CITY});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  AirPollutionModel airPollutionModel=AirPollutionModel();
  int aqi = 0;
  int co = 0;
  int no = 0;
  int no2 = 0;
  int o3 = 0;
  int so2 = 0;
  int pm2_5 = 0;
  int pm10 = 0;
  int nh3 = 0;
  String message = 'Unable to get air quality';
  String city = 'Error';
  void updateUI(aqiData, cityName){
    aqi= aqiData['list'][0]['main']['aqi'];
    co = aqiData['list'][0]['components']['co'].toInt();
    no =
        aqiData['list'][0]['components']['no'].toInt();
    no2 =
        aqiData['list'][0]['components']['no2'].toInt();
    o3 =
        aqiData['list'][0]['components']['o3'].toInt();
    so2 =
        aqiData['list'][0]['components']['so2'].toInt();
    pm2_5 =
        aqiData['list'][0]['components']['pm2_5'].toInt();
    pm10 =
        aqiData['list'][0]['components']['pm10'].toInt();
    nh3 =
        aqiData['list'][0]['components']['nh3'].toInt();
    message=airPollutionModel.getMessage(aqi);
    city=cityName;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationAQI, widget.CITY);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                city,
                style: TextStyle(
                  letterSpacing: -1,
                  fontSize: 35.0,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
             Center(
              child: Text('$aqi',
                style: TextStyle(
                  letterSpacing: -1,
                  fontSize: 17.0,
                ),
              ),
            ),
            const Center(
              child: Text(
                '1',
                style: TextStyle(
                  letterSpacing: -1,
                  fontSize: 70.0,
                ),
              ),
            ),
            Center(
              child: Text(
                message,
                style: TextStyle(
                  letterSpacing: -1,
                  fontSize: 17.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PollutantCard(
                  concentration: co,
                  firstName: 'Carbon',
                  lastName: 'Monoxide',
                  color: const Color(0XFFDAEEF8),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                PollutantCard(
                  concentration: no,
                  firstName: 'Nitrogen',
                  lastName: 'Oxide',
                  color: const Color(0XFFDAEEF8),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PollutantCard(
                  concentration: no2,
                  firstName: 'Nitrogen',
                  lastName: 'Dioxide',
                  color: const Color(0XFFC7E9FA),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                PollutantCard(
                  concentration: o3,
                  firstName: 'Ozone',
                  lastName: '',
                  color: const Color(0XFFC7E9FA),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PollutantCard(
                  concentration: so2,
                  firstName: 'Sulphur',
                  lastName: 'Dioxide',
                  color: const Color(0XFFA9DEF8),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                PollutantCard(
                  concentration: pm2_5,
                  firstName: 'Particulate Matter',
                  lastName: '2.5',
                  color: const Color(0XFFA9DEF8),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PollutantCard(
                  concentration: pm10,
                  firstName: 'Particulate Matter',
                  lastName: '10',
                  color: const Color(0XFF70C9F4),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                PollutantCard(
                  concentration: nh3,
                  firstName: 'Ammonia',
                  lastName: '',
                  color: const Color(0XFF70C9F4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
