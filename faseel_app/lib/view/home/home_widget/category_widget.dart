import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/view/stores/stores_screen.dart';
import 'package:flutter/material.dart';
import 'package:faseel/contents/colors.dart';
import 'package:faseel/extensions/navigator.dart';
import 'package:faseel/method/show_sheet.dart';
import 'package:faseel/view/favorite/favorite_screen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        categoryShep(
            icon: Icons.qr_code_scanner,
            title: tr("scan"),
            onPressed: () {
              ShowSheet.showSheet(context);
            }),
        categoryShep(
            icon: Icons.store,
            title: tr("stores"),
            onPressed: () => context.push(view: const StoresScreen())),
        categoryShep(
            icon: Icons.trending_up, title: tr("popular"), onPressed: () {}),
        categoryShep(
          icon: Icons.favorite_border,
          title: tr("menu.favorite"),
          onPressed: () => context.push(view: FavoriteScreen()),
        )
      ],
    );
  }

  Widget categoryShep(
      {required IconData icon,
      required String title,
      required void Function()? onPressed}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: ColorsApp.ovile),
          child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: ColorsApp.background,
                size: 30,
              )),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: ColorsApp.text),
        )
      ],
    );
  }
}
