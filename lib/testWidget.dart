import 'package:flutter/material.dart';
import 'package:myproject/provider.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState()  => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifyProvider<CarModel>(
        child: Container(
          child: Column(
            children: [
              Builder(builder: (context) {
                print("list build");
                var cart = ChangeNotifyProvider.of<CarModel>(context);
                return Column(
                  children: cart.list.map((e) => Text(e.toString())).toList()
                );
              }),
              Builder(builder: (context) {
                print("RaisedButton build");
                return RaisedButton(onPressed: () {
                  print("点击按钮");
                  var card = ChangeNotifyProvider.of<CarModel>(context);
                  card.add("世界你好");
                }, child: Text("添加"),);
              })
            ],
          ),
        ),
        data: CarModel(),
      ),
    );
  }
  
}