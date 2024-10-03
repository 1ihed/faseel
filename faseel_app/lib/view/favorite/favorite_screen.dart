import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:faseel/global/global.dart';

import '../../contents/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('menu.favorite'.tr())),
      body: SafeArea(
          child: GridView.builder(
              padding: const EdgeInsets.all(8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: favorite.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(favorite[index]['image']!)),
                      color: ColorsApp.bottomBar.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.text,
                          fontSize: 20),
                      title: Text(
                        favorite[index]['title']!,
                        overflow: TextOverflow.fade,
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            favorite.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )),
                    ),
                  ),
                );
              })),
    );
  }
}
