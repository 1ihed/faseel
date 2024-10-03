import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/contents/colors.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'menu.translate',
      ).tr()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 26),
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              'lang',
              style: TextStyle(
                color: ColorsApp.text,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ).tr(),
          ),
          _SwitchListTileMenuItem(
              title: 'عربي',
              subtitle: 'عربي',
              locale:
                  context.supportedLocales[1] //BuildContext extension method
              ),
          const _Divider(),
          _SwitchListTileMenuItem(
              title: 'English',
              subtitle: 'English',
              locale: context.supportedLocales[0]),
          const _Divider(),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: const Divider(
        color: Colors.grey,
      ),
    );
  }
}

class _SwitchListTileMenuItem extends StatelessWidget {
  const _SwitchListTileMenuItem({
    required this.title,
    required this.subtitle,
    required this.locale,
  });

  final String title;
  final String subtitle;
  final Locale locale;

  bool isSelected(BuildContext context) => locale == context.locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
        border: isSelected(context) ? Border.all(color: ColorsApp.text) : null,
      ),
      child: ListTile(
          textColor: ColorsApp.text,
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
          ),
          subtitle: Text(
            subtitle,
          ),
          onTap: () async {
            await context.setLocale(locale); //BuildContext extension method
            // Navigator.pop(context);
          }),
    );
  }
}
