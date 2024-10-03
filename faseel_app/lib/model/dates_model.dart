class DatesModel {
  String? dates;
  String? culture;
  String? origin;
  String? usage;
  String? image;
  String? imagec;

  DatesModel({this.imagec, this.dates, this.culture, this.origin, this.usage, this.image});

  DatesModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'];
    culture = json['culture'];
    origin = json['origin'];
    usage = json['usage'];
    image = json['image'];
    imagec = json['imagec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dates'] = dates;
    data['culture'] = culture;
    data['origin'] = origin;
    data['usage'] = usage;
    data['image'] = image;
    return data;
  }
}
