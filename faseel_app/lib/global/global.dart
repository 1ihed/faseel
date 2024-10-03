import 'package:faseel/model/dates_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

var dates = [
  {
    "dates": "ajwa",
    "culture": "ajwaC",
    "origin": "ajwaO",
    "usage": "ajwaU",
    "image": "assets/dates/ajwa.jpeg",
    "imagec": "assets/dates/ajwaC.jpeg"
  },
  {
    "dates": "galaxy",
    "culture": "galaxyC",
    "origin": "galaxyO",
    "usage": "galaxyU",
    "image": "assets/dates/galaxy.jpeg",
    "imagec": "assets/dates/galaxyC.jpeg",
  },
  {
    "dates": "medjool",
    "culture": "medjoolC",
    "origin": "medjoolO",
    "usage": "medjoolU",
    "image": "assets/dates/majdool.jpeg",
    "imageC": "assets/dates/majdoolC.jpeg"
  },
  {
    "dates": "Meneifi",
    "culture": "MeneifiC",
    "origin": "MeneifiO",
    "usage": "MeneifiU",
    "image": "assets/dates/meneifi.jpeg",
    "imagec": "assets/dates/meneifiC.jpeg",
  },
  {
    "dates": "NabtatAli",
    "culture": "NabtatAliC",
    "origin": "NabtatAliO",
    "usage": "NabtatAliU",
    "image": "assets/dates/nabtat.jpeg",
    "imagec": "assets/dates/nabtatC.jpeg",
  },
  {
    "dates": "Rutab",
    "culture": "RutabC",
    "origin": "RutabO",
    "usage": "RutabU",
    "image": "assets/dates/rutab.jpeg",
    "imagec": "assets/dates/rutabC.jpeg"
  },
  {
    "dates": "Shaishe",
    "culture": "ShaisheC",
    "origin": "ShaisheO",
    "usage": "ShaisheU",
    "image": "assets/dates/shaishe.jpeg",
    "imagec": "assets/dates/shaisheC.jpeg"
  },
  {
    "dates": "Sokari",
    "culture": "SokariC",
    "origin": "SokariO",
    "usage": "SokariU",
    "image": "assets/dates/sokari.jpeg",
    "imagec": "assets/dates/sokari.jpeg"
  },
  {
    "dates": "Sugaey",
    "culture": "SugaeyC",
    "origin": "SugaeyO",
    "usage": "SugaeyU",
    "image": "assets/dates/sugaey.jpeg",
    "imagec": "assets/dates/sugaey.jpeg"
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
