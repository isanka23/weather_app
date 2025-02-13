import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationService {
  Future<String> getCityNameFromCurrentLocation() async {
    //get the perisson from the user to access the location
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //get the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position.latitude);
    print(position.longitude);

    //convert the location in to list of placemarks
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //get the city name from the placemarks
    String cityName = placeMarks[0].locality!;
    print(cityName);

    return cityName;
  }
}
