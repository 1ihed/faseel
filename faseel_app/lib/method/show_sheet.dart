// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/extensions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowSheet {
  static showSheet(BuildContext context) {
    showModalBottomSheet(
      constraints: const BoxConstraints(
        maxHeight: 130,
      ),
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
                  final XFile? photo =
                      await picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    // image = photo.path;
                    // setState(() {});
                  }

                  context.pop();
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
                  // Pick an image.
                  final XFile? photo =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (photo != null) {
                    //   image = photo.path;
                    //
                    //   setState(() {});
                  }
                  context.pop();
                } catch (e) {
                  return;
                }
              },
            )
          ],
        );
      },
    );
  }
}
