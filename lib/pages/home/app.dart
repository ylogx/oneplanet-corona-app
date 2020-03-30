import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './home.dart';

class AppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
    developer.log("Showing home page with bottom navigation bar", name: 'app.dart');
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(CupertinoIcons.check_mark_circled),
//            title: Text('Countries'),
//          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        assert(index >= 0 && index <= 1);
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return HomePage();
              },
            );
            break;
//          case 1:
//            return CupertinoTabView(
//              builder: (BuildContext context) => CountriesListPage(),
//            );
//            break;
        }
        return null;
      },
    );
  }
}
