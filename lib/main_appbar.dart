import 'package:flutter/material.dart';
class floodAppBar extends StatelessWidget {
  String title;
  floodAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      leading: InkWell(
        child: Icon(
          Icons.home,
        ),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Tap'),
          ));
        },
      ),
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: new Text(this.title),
    );
  }
}
