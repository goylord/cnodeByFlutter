
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _count = 0;
  countPlus() {
    setState(() {
      _count;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: Colors.white,
      body: Column(
        children: [
          Text("这是第一行", 
          style: TextStyle(
            backgroundColor: Colors.blue,
            color: Colors.yellow,
          )),
          Container(
            padding: EdgeInsets.fromLTRB(50.0, 5.0, 10.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: 10.0, color: Colors.red),
              boxShadow: [BoxShadow(
                color: Colors.yellow,
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
              )]
            ),
            child: Text("这是第二行", style: TextStyle(decoration: TextDecoration.none),)
          ),
          Flex(
            direction: Axis.horizontal, 
            children: [
              Expanded(child: Text("中国你好"),),
              Expanded(child: Text("中国你好"),),
              Expanded(child: Text("中国你好"),),
              Expanded(child: Text("中国你好"),),
            ],
          ),
          Container(
            child: RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text("请点击我"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {

              },
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            margin: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "请输入用户名",
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person, color: Colors.white,)
              )
            )
          )
        ],
      )
    );
  }
  
}