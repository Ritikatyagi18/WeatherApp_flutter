import 'package:weather/services/location.dart';
import 'package:weather/services/networking_temp.dart';


const apiKey = '8083dc42691bac1c34a34817f1726895';
const openWeatherMapURL2 = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel  {
  Future <dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url = '$openWeatherMapURL2?lat=${location.latitude}&lon=${location
        .longitude}&units=metric&appid=$apiKey';
    NetworkHelper_temp networkHelper = NetworkHelper_temp(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  }