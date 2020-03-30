import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/utils/constants.dart';

class OnePlanetNavigationBar extends StatelessWidget {
  static const TEXT_PADDING = 10.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      largeTitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            TEXT_NAV_BAR_HEADER,
            style: TextStyle(fontFamily: FONT_SERIF),
          ),
          Row(
            children: <Widget>[
//              CupertinoButton(
//                key: Key("logout_button"),
//                onPressed: () async {
//                  logout(context);
//                },
//                child: const Icon(Icons.exit_to_app, size: 18.0),
//                //const Text("Logout",
//                //    textAlign: TextAlign.right, style: TextStyle(color: CupertinoColors.activeGreen, fontSize: 15)),
//              ),
              Padding(
                padding: const EdgeInsets.only(right: 2 * TEXT_PADDING),
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(20.0),
                  child: Image.asset('assets/corona.png', height: 25.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
