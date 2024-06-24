import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../di/AppModule.dart';
import 'ClientInfoCubit.dart';

class CustomerMapScreen extends StatefulWidget {
  const CustomerMapScreen({super.key});

  @override
  State<CustomerMapScreen> createState() => _CustomerMapScreenState();
}

class _CustomerMapScreenState extends State<CustomerMapScreen> {
  GoogleMapController? mapController;
  final clientInfoCubit = getIt<ClientInfoCubit>();

  Position? currentLocation;

  @override
  void initState() {
    super.initState();
    checkPermission();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLocation?.latitude ?? 0.0,
              currentLocation?.longitude ?? 0.0,
            ),
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            onTap: _onMapTapped,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                currentLocation?.latitude ?? 0.0,
                currentLocation?.longitude ?? 0.0,
              ),
              zoom: 15,
            ),
            myLocationEnabled: true,
          ),
          if (currentLocation != null)
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                "Current Location: ${currentLocation!.latitude}, ${currentLocation!.longitude}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Future<LocationPermission> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  void _onMapTapped(LatLng latLng) {
    getAddressFromLatLng(latLng);

  }

  Future<void> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latLng.latitude, latLng.longitude);
      Placemark place = placemarks[0];
      print("Address: ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}");
      clientInfoCubit.saveAddress(place.street, place.locality, place.administrativeArea, place.country);
      clientInfoCubit.saveLateLng(latLng.latitude, latLng.longitude);
    } catch (e) {
      print("Error getting address: $e");
    }
  }
}
