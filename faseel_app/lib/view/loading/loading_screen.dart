import 'package:flutter/material.dart';
import 'package:faseel/contents/colors.dart';
import 'package:faseel/extensions/navigator.dart';
import 'package:faseel/main.dart';
import 'package:faseel/method/location.dart';
import 'package:geolocator/geolocator.dart';

import '../navi_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() {
    Future.delayed(const Duration(seconds: 4), () async {
      checkPermission = await Geolocator.checkPermission();
      await LocationCurrent.locationCurrent();
      context.pushAndRemoveUntil(view: NaviScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.ovile,
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
