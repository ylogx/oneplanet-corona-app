import 'package:flutter/cupertino.dart';

class LoaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        padding: const EdgeInsets.all(2 * 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CupertinoActivityIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
