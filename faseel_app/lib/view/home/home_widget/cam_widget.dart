import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/contents/colors.dart';
import 'package:faseel/method/dates_sort.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamWidget extends StatefulWidget {
  const CamWidget({super.key});

  @override
  State<CamWidget> createState() => _CamWidgetState();
}

class _CamWidgetState extends State<CamWidget> {
  var controller = TextEditingController();
  String image = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          color: ColorsApp.text, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextField(
              cursorColor: ColorsApp.background,
              onChanged: (value) {
                var loc = DatesSort.datesSort();
                var isFind =
                    loc.where((e) => e.dates!.contains(value)).toList();
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                                child: ListTile(
                              leading: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(isFind[index].image!)),
                              title: Row(
                                children: [
                                  Text(
                                    isFind[index].dates ?? '',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ));
                          },
                          itemCount: isFind.length),
                    );
                  },
                );
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              style: TextStyle(color: ColorsApp.background),
              decoration: InputDecoration(
                  prefixIconColor: ColorsApp.background,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'cam.searchF'.tr(),
                  hintStyle: TextStyle(color: ColorsApp.background),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsApp.background, width: 0.7),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsApp.background, width: 0.7),
                      borderRadius: BorderRadius.circular(16))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                right: context.locale.languageCode == 'ar' ? 16 : 0,
                left: context.locale.languageCode == 'ar' ? 0 : 16),
            decoration: BoxDecoration(
                border: Border.all(color: ColorsApp.background),
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
                onPressed: () {
                  print(context.locale.languageCode);
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    backgroundColor: ColorsApp.background,
                    constraints: const BoxConstraints(maxHeight: 130),
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text('cam.camera'.tr()),
                            trailing: const Icon(Icons.camera_alt),
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              // Capture a photo.
                              try {
                                final XFile? photo = await picker.pickImage(
                                    source: ImageSource.camera);
                                if (photo != null) {
                                  image = photo.path;
                                  setState(() {});
                                }
                                Navigator.of(context).pop();
                              } catch (e) {
                                return;
                              }
                            },
                          ),
                          const Divider(),
                          ListTile(
                            title: Text('cam.gallery'.tr()),
                            trailing: const Icon(Icons.image),
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              try {
                                final XFile? photo = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (photo != null) {
                                  image = photo.path;
                                  setState(() {});
                                }
                                Navigator.of(context).pop();
                              } catch (e) {
                                return;
                              }
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: ColorsApp.background,
                )),
          )
        ],
      ),
    );
  }
}
