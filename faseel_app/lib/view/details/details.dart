import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/contents/colors.dart';
import 'package:flutter/material.dart';
import 'package:faseel/extensions/size_extentions.dart';
import 'package:faseel/global/global.dart';
import 'package:faseel/view/map/map_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isSelectedlocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              var isFind = favorite.where((e) => e.containsValue(widget.image));
              isFind.isNotEmpty
                  ? favorite.removeWhere(
                      (element) => element.containsValue(widget.image),
                    )
                  : favorite
                      .add({"image": widget.image, "title": widget.title});
              setState(() {});
            },
            icon: favorite.where((e) => e.containsValue(widget.image)).isEmpty
                ? const Icon(Icons.favorite_border)
                : const Icon(Icons.favorite, color: Colors.red),
          ),
          const SizedBox(
            width: 8,
          )
        ],
        backgroundColor: ColorsApp.bottomBar,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: context.getHeightM(),
            width: context.getWidthM(),
          ),
          Column(
            children: [
              Container(
                color: Colors.red,
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: context.getWidthM(),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: context.getHeightM(multiply: 0.6),
              width: context.getWidthM(),
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: ColorsApp.background,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              child: ListView(
                  physics: isSelectedlocation
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  children: [
                    Text(
                      'product.${widget.title}.${widget.title}'.tr(),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.text),
                      textAlign: TextAlign.center,
                    ),
                    ListTile(
                      title: Text('dates.varieties'.tr()),
                      titleTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.text),
                      subtitleTextStyle:
                          TextStyle(fontSize: 18, color: ColorsApp.text),
                      subtitle:
                          Text("product.${widget.title}.${widget.title}C").tr(),
                    ),
                    ListTile(
                      title: Text('dates.origins'.tr()),
                      titleTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.text),
                      subtitleTextStyle:
                          TextStyle(fontSize: 18, color: ColorsApp.text),
                      subtitle:
                          Text("product.${widget.title}.${widget.title}O").tr(),
                    ),
                    ListTile(
                      title: Text('dates.usage'.tr()),
                      titleTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.text),
                      subtitleTextStyle:
                          TextStyle(fontSize: 18, color: ColorsApp.text),
                      subtitle:
                          Text("product.${widget.title}.${widget.title}U").tr(),
                    ),
                    GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          isSelectedlocation
                              ? isSelectedlocation = false
                              : isSelectedlocation = true;
                        });
                        print(isSelectedlocation);
                      },
                      child: const SizedBox(
                        height: 300,
                        child: MapScreen(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.sizeOf(context).width - 20, 40),
                            backgroundColor: ColorsApp.ovile,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: const Text('Nearby Locations'),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      )),
    );
  }
}
