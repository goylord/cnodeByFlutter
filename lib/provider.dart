import 'package:flutter/material.dart';

class MyInheritedProvider<T> extends InheritedWidget {
  MyInheritedProvider({
    @required this.data,
    Widget child,
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ChangeNotifier implements Listenable {
  List listeners = [];
  @override
  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  void notifyListener() {
    listeners.forEach((e) => e());
  }
}

class CarModel extends ChangeNotifier {
  final List list = [];
  void add(String text) {
    print("调用添加方法");
    list.add(text);
    notifyListener();
  }
}

class ChangeNotifyProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifyProvider({
    Key key,
    this.data,
    this.child,
  }): super(key: key);
  final T data;
  final Widget child;

  static T of<T>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<MyInheritedProvider<T>>();
    return provider.data;
  }

  @override
  _ChangeNotifyProviderState<T> createState() => _ChangeNotifyProviderState<T>();

}

class _ChangeNotifyProviderState<T extends ChangeNotifier> extends State<ChangeNotifyProvider<T>> {

  void update() {
    print("更新数据");
    setState(() {
      
    });
  }
  didChangeDependencies() {
    print("provider change");
  }

  @override
  void initState() {
    print("添加方法到provider");
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedProvider<T>(
      data: widget.data, 
      child: widget.child
    );
  }
  
}