import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:smartfit3/pages/food_log.dart';
import 'package:smartfit3/pages/home_page.dart';
import 'package:smartfit3/pages/messages.dart';
import 'package:smartfit3/pages/schedule.dart';
import 'package:smartfit3/pages/settings.dart';
import 'package:smartfit3/pages/workouts.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final myTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Workouts',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        const WorkoutPage(
          title: "My workouts",
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Food Log',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        const FoodLogPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Schedule',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        const SchedulePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Messages',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        const MessagePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Settings',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        const SettingsPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.black,
      screens: _pages,
      initPositionSelected: 0,
    );
  }
}
