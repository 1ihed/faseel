import 'package:easy_localization/easy_localization.dart';
import 'package:faseel/bloc/map_bloc/google_map_bloc.dart';
import 'package:faseel/contents/colors.dart';
import 'package:faseel/view/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'bloc/page_bloc/page_bloc.dart';

late LocationPermission checkPermission;
late Position current;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ar'),
    ],

    path: 'assets/langs',
    startLocale: const Locale('en', 'US'),
    child: const MainApp(),
    // useOnlyLangCode: true,
    // ignorePluralRules: false,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GoogleMapBloc(),
        ),
        BlocProvider(
          create: (context) => PageBloc()..add(PageCurrentEvent(0)),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: ColorsApp.background,
            listTileTheme: ListTileThemeData(textColor: ColorsApp.text),
            appBarTheme: AppBarTheme(
                foregroundColor: ColorsApp.text,
                backgroundColor: ColorsApp.bottomBar,
                elevation: 0,
                centerTitle: true),
            navigationBarTheme: NavigationBarThemeData(
                backgroundColor: ColorsApp.bottomBar,
                indicatorColor: Colors.transparent,
                labelTextStyle: WidgetStatePropertyAll(TextStyle(
                    color: ColorsApp.text, fontWeight: FontWeight.bold)),
                iconTheme: WidgetStatePropertyAll(
                    IconThemeData(color: ColorsApp.background)))),
        debugShowCheckedModeBanner: false,
        home: const LoadingScreen(),
      ),
    );
  }
}
