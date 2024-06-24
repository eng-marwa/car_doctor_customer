import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission() async {
  print('android.permission.');
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text(
    //         'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text(
    //         'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

// Future<void> getCurrentPosition() async {
//   final hasPermission = await handleLocationPermission();
//   if (!hasPermission) return;
//   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//       .then((Position position) {
//     setState(() => _currentPosition = position);
//     _getAddressFromLatLng(_currentPosition!);
//   }).catchError((e) {
//     debugPrint(e);
//   });
// }
//
// Future<void> getAddressFromLatLng(Position _currentPosition) async {
//   await placemarkFromCoordinates(
//       _currentPosition!.latitude, _currentPosition!.longitude)
//       .then((List<Placemark> placemarks) {
//     Placemark place = placemarks[0];
//     setState(() {
//       _currentAddress =
//       '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//     });
//     print(_currentAddress);
//   }).catchError((e) {
//     debugPrint(e);
//   });
// }