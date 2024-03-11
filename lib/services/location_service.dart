import 'package:kf_ocs/utils/log_utils.dart';
import 'package:location/location.dart';

class LocationService{

  Location location = Location();
  late LocationData locData;

  Future<void> initialize() async {
    bool serviceEnabled;
    PermissionStatus permission;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<double?> getLatitude() async {
      locData = await location.getLocation();
      return locData.latitude;
  }

  Future<double?> getLongitude() async {
      locData = await location.getLocation();
      return locData.longitude;
  }

}