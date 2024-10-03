import 'package:faseel/global/global.dart';
import 'package:faseel/model/dates_model.dart';

class DatesSort {
  static List<DatesModel> datesSort() {
    List<DatesModel> data = [];
    for (var element in dates) {
      data.add(DatesModel(
          dates: element["dates"],
          culture: element["culture"],
          image: element["image"],
          origin: element["origin"],
          usage: element["usage"]));
    }
    return data;
  }
}
