class LocationModel {
  String? title;
  double? latitude;
  double? longitude;
  double? distance;
  LocationModel({this.title, this.latitude, this.longitude,this.distance});

  LocationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
