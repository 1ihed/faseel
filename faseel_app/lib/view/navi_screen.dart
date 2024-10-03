import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faseel/contents/colors.dart';
import 'package:faseel/view/history/history_screen.dart';
import 'package:faseel/view/home/home_screen.dart';
import 'package:faseel/view/lang/lang_screen.dart';
import 'package:faseel/view/map/map_screen.dart';

import '../bloc/page_bloc/page_bloc.dart';

class NaviScreen extends StatelessWidget {
  NaviScreen({super.key});

  final List screens = [
    const HomeScreen(),
    const MapScreen(),
    // const FavoriteScreen(),
    const HistoryScreen(),
    const LanguageScreen()
  ];

  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is PageCurrentState) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
                selectedIndex: state.currentPage,
                onDestinationSelected: (value) {
                  context.read<PageBloc>().add(PageCurrentEvent(value));
                },
                destinations: [
                  NavigationDestination(
                    icon: const Icon(Icons.home),
                    label: tr('menu.home'),
                    tooltip: tr('menu.home'),
                    selectedIcon: Icon(
                      Icons.home,
                      color: ColorsApp.text,
                    ),
                  ),
                  NavigationDestination(
                      tooltip: tr('menu.map'),
                      icon: const Icon(Icons.location_on_outlined),
                      selectedIcon: Icon(
                        Icons.location_on,
                        color: ColorsApp.text,
                      ),
                      label: tr('menu.map')),
                  // NavigationDestination(
                  //   tooltip: tr('menu.favorite'),
                  //   icon: Icon(Icons.favorite_border),
                  //   label: tr('menu.favorite'),
                  //   selectedIcon: Icon(
                  //     Icons.favorite,
                  //     color: ColorsApp.text,
                  //   ),
                  // ),
                  NavigationDestination(
                    tooltip: tr('menu.history'),
                    icon: const Icon(Icons.history),
                    label: tr('menu.history'),
                    selectedIcon: Icon(
                      Icons.history,
                      color: ColorsApp.text,
                    ),
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.translate),
                    label: tr('menu.translate'),
                    tooltip: tr('menu.translate'),
                    selectedIcon: Icon(
                      Icons.translate,
                      color: ColorsApp.text,
                    ),
                  ),
                ]),
            body: screens[state.currentPage],
          );
        }
        return Scaffold(
          bottomNavigationBar: NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (value) {
                context.read<PageBloc>().add(PageCurrentEvent(value));
              },
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home),
                  label: '',
                  tooltip: tr('menu.home'),
                  selectedIcon: Icon(
                    Icons.home,
                    color: ColorsApp.text,
                  ),
                ),
                NavigationDestination(
                    tooltip: tr('menu.map'),
                    icon: const Icon(Icons.map),
                    selectedIcon: Icon(
                      Icons.map,
                      color: ColorsApp.text,
                    ),
                    label: ''),
                // NavigationDestination(
                //   tooltip: tr('menu.favorite'),
                //   icon: Icon(Icons.favorite_border),
                //   label: '',
                //   selectedIcon: Icon(
                //     Icons.favorite,
                //     color: ColorsApp.text,
                //   ),
                // ),
                NavigationDestination(
                  tooltip: tr('menu.history'),
                  icon: const Icon(Icons.history),
                  label: '',
                  selectedIcon: Icon(
                    Icons.history,
                    color: ColorsApp.text,
                  ),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.translate),
                  label: '',
                  tooltip: tr('menu.translate'),
                  selectedIcon: Icon(
                    Icons.translate,
                    color: ColorsApp.text,
                  ),
                ),
              ]),
          body: screens[index],
        );
      },
    );
  }
}
