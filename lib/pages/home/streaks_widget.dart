import 'package:flutter/cupertino.dart';
import "package:intl/intl.dart";

import 'data.dart';

class StreaksWidget extends StatelessWidget {
  HomeData data;
  bool isDark;
  static const TEXT_PADDING = 10.0;

  StreaksWidget(HomeData data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: TEXT_PADDING, horizontal: 2 * TEXT_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgetsList(context),
      ),
    );
  }

  List<Widget> widgetsList(BuildContext context) {
    var updatedAtDateTime = DateTime.parse(data.UpdatedAt);
    var updatedAtDateTimeString = DateFormat.yMMMMEEEEd().format(updatedAtDateTime.toLocal()) + " " + DateFormat.Hms().format(updatedAtDateTime.toLocal());
//    updatedAtDateTimeString = DateFormat.E().format(updatedAtDateTime.toLocal());
    var output = <Widget>[
        showStat("Cases", data.Cases),
        showStat("Active", data.Active),
        showStat("Deaths", data.Deaths),
        showStat("Recovered", data.Recovered),
        //showStat("Updated At", updatedAtDateTimeString),
        Text(
          "Updated At: ${updatedAtDateTimeString}",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey3,
          ),
        ),
      ];
    return output;
  }

  Padding showStat(title, numbers) {
    return Padding(
        padding: const EdgeInsets.only(bottom: TEXT_PADDING),
        child: Column(
        children: <Widget>[
          Text(
            "${title.toUpperCase()}",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
//              color: isDark ? CupertinoColors.darkBackgroundGray : CupertinoColors.extraLightBackgroundGray,
//              color: isDark ? CupertinoColors.secondaryLabel : CupertinoColors.systemGrey6,
              color: isDark ? CupertinoColors.white : CupertinoColors.black,
            ),
          ),
          Text(
            "$numbers",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: isDark ? CupertinoColors.white : CupertinoColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
