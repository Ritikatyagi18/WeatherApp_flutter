import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';


const apiKey = '8083dc42691bac1c34a34817f1726895';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/air_pollution';

class AirPollutionModel  {
    Future <dynamic> getLocationAQI() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url = '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var aqiData = await networkHelper.getData();
    return aqiData;


  }
  Future<String> getCityName() async{
      Location location = Location();
      await location.getCurrentLocation();
      return location.cityName;
  }



}
