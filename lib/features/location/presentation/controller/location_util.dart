import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/custom_log.dart';
import '../../../app_common/custom_dialog.dart';
import '../../data/models/latlong_model.dart';
import '../dialogs/no_location_dialog.dart';

class LocationUtil {
  static final LocationUtil _singleton = LocationUtil._internal();

  factory LocationUtil() => _singleton;

  LocationUtil._internal();



  static Future<LatLong?> getCurrentLocation(BuildContext context) async {
    try {
      bool isPermissionGranted = await handleLocationPermission(context);

      if(isPermissionGranted){
        Position pos = await Geolocator.getCurrentPosition();

        Log.p("Current Location");
        Log.p("userLat ${pos.latitude}");
        Log.p("userLong ${pos.longitude}");

        return LatLong(lat: pos.latitude, long: pos.longitude);
      }

      return null;

    } catch (e) {
      Log.p("Problem with get Current Location $e");
      rethrow;
    }
  }


  static Future<bool> handleLocationPermission(BuildContext context) async {
    // Check permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Request permission if denied
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission still denied
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission permanently denied
      return false;
    }

    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Request the user to enable location services
      if(context.mounted){
        CustomDialog.show(
            context,
            view: const NoLocationDialog()
        );
      }
      return false;
    }

    // Return true if location services are enabled
    return serviceEnabled;
  }

}
