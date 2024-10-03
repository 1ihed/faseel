import 'dart:async';
import 'package:faseel/global/global.dart';
import 'package:faseel/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    _goToTheLake();
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition cameraUp = CameraPosition(
      target: LatLng(current.latitude, current.longitude), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          initialCameraPosition: cameraUp,
          markers: marker,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }

  _goToTheLake() async {
    CameraPosition cameraUp = CameraPosition(
        target: LatLng(current.latitude, current.longitude), zoom: 14);
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(cameraUp));
    setState(() {});
  }
}
