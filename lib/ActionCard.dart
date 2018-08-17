import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  String title, malayalam;
  IconData icon;

  Function fun;

  ActionCard({this.title, this.malayalam, this.icon,this.fun});

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height - 40.0) / 3;
    Color primary = Theme.of(context).primaryColor;
    TextTheme txttheme = Theme.of(context).textTheme;
    return SizedBox(
        height: height,
        child: Material(
            color: primary,
            child: InkWell(
                onTap: this.fun,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        child: Icon(
                          this.icon,
                          size: 40.0,
                        ),
                        padding: EdgeInsets.only(bottom: 5.0),
                      ),
                      Text(
                        this.title,
                        style: txttheme.title,textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          width: 200.0,
                          child: Divider(
                            color: Colors.black,
                          )),
                      Text(
                        this.malayalam,
                        style: TextStyle(fontFamily: 'Roboto'),
                      )
                    ],
                  ),
                ))));
  }
}
