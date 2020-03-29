import 'package:flutter/cupertino.dart';

class ErrorScreen extends StatelessWidget {
  Function onReload;
  bool isDark;

  ErrorScreen(onReload) {
    this.onReload = onReload;
  }

  @override
  Widget build(BuildContext context) {
    isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var textColor = isDark ? CupertinoColors.white : CupertinoColors.black;
    return CupertinoPageScaffold(
      child: Container(
        padding: const EdgeInsets.all(2 * 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/error_screen.png")),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('Oops, there was an error contacting server.', style: TextStyle(color: textColor)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('Please retry in sometime.', style: TextStyle(color: textColor)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: CupertinoButton(
                  key: Key("retry_button"),
                  onPressed: onReload,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(CupertinoIcons.refresh),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: const Text("Retry", style: TextStyle(color: CupertinoColors.inactiveGray, fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
