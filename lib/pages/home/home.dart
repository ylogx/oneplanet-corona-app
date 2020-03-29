import 'dart:convert';
import 'dart:developer' as developer;

import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/cupertinoish_card.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/navigation.dart';
import '../../widgets/loader.dart';
import '../utils/constants.dart';
import 'data.dart';
import 'streaks_widget.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState = new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    developer.log("Showing homepage list");
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await getHomeData(),
      renderLoad: () => LoaderScreen(),
      renderError: ([error]) => ErrorScreen(() async {
        await _asyncLoaderState.currentState.reloadState();
      }),
      renderSuccess: ({data}) => homeTab(data),
    );

    return new CupertinoPageScaffold(
      child: Scrollbar(
        child: _asyncLoader,
      ),
    );
  }
}

class HomePageTab extends StatelessWidget {
  static const TEXT_PADDING = 10.0;
  HomeData data;
  bool isDark;

  HomePageTab(HomeData data) {
    this.data = data;
    this.isDark = false;
  }

  @override
  Widget build(BuildContext context) {
    isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var size = 1;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        semanticChildCount: size + 1,
        slivers: <Widget>[
          OnePlanetNavigationBar(),
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: TEXT_PADDING),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return StreaksWidget(data);
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

HomePageTab homeTab(data) {
  return HomePageTab(data);
}

buildTitle(String title) {
  return new Padding(
    padding: new EdgeInsets.all(10.0),
    child: new Text('One Planet'),
  );
}

getHomeData() async {
  final response = await get(API_HOST_BASE_URL + '/home');
  if (response.statusCode == 200) {
    var dataJson = json.decode(response.body);
    developer.log('home data json: ' + dataJson.toString(), name: 'home.dart');
    var homeDataMessage = HomeDataMessage.fromJson(dataJson);
    if (homeDataMessage?.status == false) {
      developer.log('Error fetching data: ' + homeDataMessage?.message, name: 'home.dart');
      developer.log('Data json: ' + dataJson.toString(), name: 'home.dart');
      throw Exception(dataJson);
    }
    developer.log('Successfully parsed home ${homeDataMessage?.data} from API', name: 'home.dart');
    return homeDataMessage?.data;
  } else {
    throw Exception('Failed to load data from api');
  }
}
