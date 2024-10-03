part of 'google_map_bloc.dart';

abstract class GoogleMapState {}

final class GoogleMapInitial extends GoogleMapState {}

class StartMapState extends GoogleMapState {
  final Position position;
  final CameraPosition cameraUp;
  final CameraPosition kGooglePlex;

  StartMapState(
      {required this.position,
      required this.cameraUp,
      required this.kGooglePlex});
}
