import 'package:faseel/model/dates_model.dart';
import 'package:flutter/material.dart';
import 'package:faseel/global/global.dart';
import 'package:faseel/view/details/details.dart';

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({
    super.key,
    required this.data,
  });
  final List<DatesModel> data;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        data.sort((a, b) => a.dates!.length.compareTo(b.dates!.length));
        return recomendShape(context, data[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: 1),
      shrinkWrap: true,
    );
  }

  static InkWell recomendShape(BuildContext context, DatesModel product) {
    return InkWell(
      onTap: () {
        history.add(product);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(
            title: product.dates!,
            image: product.image!,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(product.image!), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
