import 'package:faseel/model/dates_model.dart';
import 'package:flutter/widgets.dart';
import 'package:faseel/extensions/navigator.dart';
import 'package:faseel/global/global.dart';
import 'package:faseel/view/details/details.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key, required this.data});
  final List<DatesModel> data;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          history.add(data[index]);
          context.push(
              view: DetailsScreen(
            title: data[index].dates??"",
            image: data[index].image!,
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data[index].image!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8, crossAxisCount: 1, childAspectRatio: 0.8),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
    );
  }
}
