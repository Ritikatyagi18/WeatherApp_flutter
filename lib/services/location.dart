import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

// api key 8083dc42691bac1c34a34817f1726895
class Location{
  double latitude =0.0;
  double longitude =0.0;
  String cityName='';
  Future<void> getCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      final coordinates = new Coordinates(latitude, longitude);
      var address = await Geocoder.local.findAddressesFromCoordinates(
          coordinates);
      cityName = address.first.locality;

     /* print(latitude);
      print(longitude);
      print(cityName);*/
    }
    catch(e)
    {
      print(e);
    }


  }

}