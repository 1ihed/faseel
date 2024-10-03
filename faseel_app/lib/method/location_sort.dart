import 'package:faseel/global/global.dart';
import 'package:faseel/main.dart';
import 'package:faseel/model/location_model.dart';
import 'package:geolocator/geolocator.dart';

class LocationSort {
  
 List<LocationModel>locationSort(){
    List<LocationModel> nearestLocation=[];
for (var element in marker) {
  double distance = Geolocator.distanceBetween(
              current.latitude,
              current.longitude,
              element.position.latitude,
              element.position.longitude,
            );
  nearestLocation.add(LocationModel(distance: distance,title: element.infoWindow.title,latitude: element.position.latitude,longitude: element.position.longitude));
}
nearestLocation.sort((a,b)=>a.distance!.compareTo(b.distance!));
return nearestLocation;
  }
}