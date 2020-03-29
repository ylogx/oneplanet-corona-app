import 'package:flutter/cupertino.dart';

class CupertinoishCard extends Container {
  Widget child;
  bool isDark;

  CupertinoishCard({child}) {
    this.child = child;
  }

  @override
  Widget build(BuildContext context) {
    isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? CupertinoColors.darkBackgroundGray : CupertinoColors.extraLightBackgroundGray,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: child,
    );
  }
}
