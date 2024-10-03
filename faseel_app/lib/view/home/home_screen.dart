import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/contents/colors.dart';
import 'package:faseel/extensions/size_extentions.dart';
import 'package:faseel/method/dates_sort.dart';
import 'package:flutter/material.dart';
import 'package:faseel/view/home/home_widget/category_widget.dart';
import 'package:faseel/view/home/home_widget/popular_widget.dart';
import 'package:faseel/view/home/home_widget/recommend_widget.dart';
import 'home_widget/cam_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeBar(context),
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              titleBar('category', icon: null),
              const CategoryWidget(),
              titleBar('popularD', icon: Icons.menu),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: context.getHeightM(multiply: 0.2),
                child: PopularWidget(
                  data: DatesSort.datesSort(),
                ),
              ),
              titleBar('recommend', icon: null),
              SizedBox(
                width: context.getWidthM(),
                child: RecommendWidget(
                  data: DatesSort.datesSort(),
                ),
              ),
            ]),
      ),
    );
  }

  AppBar homeBar(BuildContext context) {
    return AppBar(
        leading: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Image.asset(
              "assets/logo1.png",
              color: ColorsApp.background,
            )),
        actions: [
          welcomeUser(),
          imageProfile(),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(100))),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(context.getHeightM(multiply: 0.1)),
          child: const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: CamWidget()),
        ));
  }

  Widget titleBar(String title, {required IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tr(title).toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorsApp.text,
              )),
          if (icon != null) Icon(icon, size: 30, color: ColorsApp.text)
        ],
      ),
    );
  }

  Widget imageProfile() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundImage: AssetImage("assets/s.jpg"),
        radius: 25,
      ),
    );
  }

  Widget welcomeUser() {
    return Row(
      children: [
        Text(
          'Welcome'.tr(),
          style: const TextStyle(fontSize: 20),
        ),
        const Text('Jumana',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
      ],
    );
  }
}
