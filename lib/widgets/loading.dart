import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  String title;

  LoadingWidget({this.title = "正在加载"});

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topCenter,
        children: [
      Positioned(
          child: Center( child: Container(
//      padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  this.title,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      )))
    ]);
  }
}
