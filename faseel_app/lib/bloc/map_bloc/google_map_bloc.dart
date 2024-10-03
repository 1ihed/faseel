import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faseel/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  late Position position;
  GoogleMapBloc() : super(GoogleMapInitial()) {
    on<StartMapEvent>((event, emit) async {
      await ocationCurrnet();

      final cameraUp = CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 16);
      CameraPosition kGooglePlex = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.4746,
      );
      emit(StartMapState(
          position: position, cameraUp: cameraUp, kGooglePlex: kGooglePlex));
    });
  }
  ocationCurrnet() async {
    if (checkPermission != LocationPermission.always ||
        checkPermission != LocationPermission.whileInUse) {
      await Geolocator.requestPermission();
    }
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }
}
