import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../main.dart';

class LocationCurrent {
 Position get  locatin=> current ;
 static locationCurrent() async {
  switch (checkPermission) {
    case LocationPermission.denied:
    case LocationPermission.deniedForever:
      await Geolocator.requestPermission();
      try {
        const LocationSettings locationSettings = LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 20,
        );
        StreamSubscription<Position> positionStream =
            Geolocator.getPositionStream(locationSettings: locationSettings)
                .listen((Position? position) {
          current = position!;
        });
      } catch (e) {
        return;
      }
      break;
    case LocationPermission.whileInUse:
    case LocationPermission.always:
    case LocationPermission.unableToDetermine:
      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 20,
      );
      StreamSubscription<Position> positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position? position) {
        current = position!;
      });
      break;
  }
}

}