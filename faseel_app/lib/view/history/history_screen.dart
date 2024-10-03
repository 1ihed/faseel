import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/global/global.dart';
import 'package:flutter/material.dart';
import 'package:faseel/view/home/home_widget/recommend_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("menu.history".tr())),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          if (history.isNotEmpty)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: history.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  crossAxisCount: 2,
                  childAspectRatio: 16 / 12),
              itemBuilder: (context, index) {
                return RecommendWidget.recomendShape(
                  context,
                  history.reversed.toList()[index],
                );
              },
            )
        ],
      ),
    );
  }
}
