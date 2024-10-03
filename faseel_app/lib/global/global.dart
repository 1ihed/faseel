import 'package:faseel/model/dates_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

var dates = [
  {
    "dates": "ajwa",
    "culture": "ajwaC",
    "origin": "ajwaO",
    "usage": "ajwaU",
    "image": "assets/ss.jpg"
  },
  {
    "dates": "galaxy",
    "culture": "galaxyC",
    "origin": "galaxyO",
    "usage": "galaxyU",
    "image": "assets/galaxy.jpeg"
  },
  {
    "dates": "medjool",
    "culture": "medjoolC",
    "origin": "medjoolO",
    "usage": "medjoolU",
    "image": "assets/mejdool.jpeg"
  },
  {
    "dates": "Meneifi",
    "culture": "MeneifiC",
    "origin": "MeneifiO",
    "usage": "MeneifiU",
    "image": "assets/ss.jpg"
  },
  {
    "dates": "NabtatAli",
    "culture": "NabtatAliC",
    "origin": "NabtatAliO",
    "usage": "NabtatAliU",
    "image": "assets/as.jpg"
  },
  {
    "dates": "Rutab",
    "culture": "RutabC",
    "origin": "RutabO",
    "usage": "RutabU",
    "image": "assets/to.jpg"
  },
  {
    "dates": "Shaishe",
    "culture": "ShaisheC",
    "origin": "ShaisheO",
    "usage": "ShaisheU",
    "image": "assets/as.jpg"
  },
  {
    "dates": "Sokari",
    "culture": "SokariC",
    "origin": "SokariO",
    "usage": "SokariU",
    "image": "assets/ss.jpg"
  },
  {
    "dates": "Sugaey",
    "culture": "SugaeyC",
    "origin": "SugaeyO",
    "usage": "SugaeyU",
    "image": "assets/to.jpg"
  },
];

List<Map<String, String>> favorite = [];
List<String> autofillHints = ["Dates Ajua", "Dates Khlas", "Dates safoua"];
List<DatesModel> history = [];

Set<Marker> marker = <Marker>{
  const Marker(
      markerId: MarkerId('1'),
      infoWindow: InfoWindow(title: "محمد للتمور"),
      position: LatLng(24.423492, 39.638455)),
  const Marker(
      markerId: MarkerId('2'),
      infoWindow: InfoWindow(title: "إهداء للتمور"),
      position: LatLng(24.419868, 39.621728)),
  const Marker(
      markerId: MarkerId('3'),
      infoWindow: InfoWindow(title: "إسراء للتمور"),
      position: LatLng(24.424248, 39.634304)),
  const Marker(
      markerId: MarkerId('4'),
      infoWindow: InfoWindow(title: "جواهر للتمور"),
      position: LatLng(24.420765, 39.635637)),
  const Marker(
      markerId: MarkerId('5'),
      infoWindow: InfoWindow(title: "بلاد المسرة للتمور"),
      position: LatLng(24.421873, 39.627350))
};
