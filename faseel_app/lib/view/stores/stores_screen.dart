import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/global/global.dart';
import 'package:faseel/method/location_sort.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('stores').tr(),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var loc = LocationSort().locationSort();
           
            return Card(
                child: ListTile(
              leading: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset('assets/ss.jpg')),
              title: Row(
                children: [
                  Text(
                    loc[index].title ?? '',
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '| 5.0 ',
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: () async {
                    final url =
                        'https://www.google.com/maps/search/?api=1&query=${loc[index].latitude},${loc[index].longitude}';
                    await launchUrl(Uri.parse(url));
                  },
                  icon: const Icon(Icons.location_on)),
            ));
          },
          itemCount: marker.length),
    );
  }
}
