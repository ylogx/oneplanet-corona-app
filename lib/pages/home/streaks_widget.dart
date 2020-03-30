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
      padding: EdgeInsets.symmetric(vertical: 2 * TEXT_PADDING, horizontal: 2 * TEXT_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgetsList(context),
      ),
    );
  }

  List<Widget> widgetsList(BuildContext context) {
    var updatedAtDateTime = DateTime.parse(data.UpdatedAt);
    var updatedAtDateTimeString = DateFormat.yMMMMEEEEd().format(updatedAtDateTime.toLocal()) + " " + DateFormat.Hms().format(updatedAtDateTime.toLocal());
//    updatedAtDateTimeString = DateFormat.E().format(updatedAtDateTime.toLocal());
    var output = <Widget>[
        showStat("Cases", data.Cases, null, CupertinoColors.activeOrange),
        showStat("Active", data.Active, (100.0 * data.Active)/data.Cases, CupertinoColors.systemYellow),
        showStat("Deaths", data.Deaths, (100.0 * data.Deaths)/data.Cases, CupertinoColors.destructiveRed),
        showStat("Recovered", data.Recovered, (100.0 * data.Recovered)/data.Cases, CupertinoColors.activeGreen),
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

  Widget showStat(title, numbers, percentage, color) {
    var normalColor = isDark ? CupertinoColors.white : CupertinoColors.black;
    var textColor = color == null ? normalColor : color;
    var percentageText = percentage == null ? "" : "${percentage.toStringAsFixed(1)}%";
    return Padding(
        padding: const EdgeInsets.only(bottom: 4 * TEXT_PADDING),
        child: Column(
        children: <Widget>[
          Text(
            "${title.toUpperCase()}",
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
              fontSize: 20,
//              color: isDark ? CupertinoColors.darkBackgroundGray : CupertinoColors.extraLightBackgroundGray,
//              color: isDark ? CupertinoColors.secondaryLabel : CupertinoColors.systemGrey6,
              color: normalColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$numbers",
                style: TextStyle(
                  letterSpacing: 4.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: textColor,
                ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 1.5 * TEXT_PADDING),
                child: Text(
                  percentageText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: normalColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
