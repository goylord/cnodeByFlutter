import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myproject/utils/request.dart';
import 'package:myproject/widgets/loading.dart';
import 'dart:convert';

import 'package:myproject/widgets/topic_card.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  RequestCollection requestCollection = new RequestCollection();
  List<dynamic> topicsList = [];
  var _loading = true;
  var _currentPage = 0;
  var _currentTab = "all";

  TabController _tabController;
  ScrollController _scrollController;

  void getPageList({more: false}) {
    requestCollection
        .getTopics(page: _currentPage, limit: "10", tab: _currentTab)
        .then((res) {
      Map<String, dynamic> topics = json.decode(res);
      if (topics["success"]) {
        topics["data"].forEach((item) {
          var removeString =
              item["content"].replaceAll(RegExp('<\/?.+?\/?>'), "");
          if (removeString.length > 40) {
            item["intro"] = removeString.substring(0, 40);
          } else {
            item["intro"] = removeString;
          }
        });
        setState(() {
          if (more) {
            topicsList.addAll(topics["data"]);
          } else {
            topicsList = topics["data"];
          }
          _loading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
      setState(() {
        _loading = true;
        _currentPage = 1;
      });
      switch (_tabController.index) {
        case 1:
          setState(() {
            _currentTab = "good";
          });
          break;
        case 2:
          setState(() {
            _currentTab = "share";
          });
          break;
        case 3:
          setState(() {
            _currentTab = "ask";
          });
          break;
        case 0:
          setState(() {
            _currentTab = "all";
          });
          break;
      }
      getPageList();
    });
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("加载更多");
        setState(() {
          _currentPage++;
          getPageList(more: true);
        });
      }
    });

    getPageList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: Text("CNODE"),
        bottom: TabBar(
          tabs: [
            new Tab(
              text: "全部",
            ),
            new Tab(
              text: "精选",
            ),
            new Tab(
              text: "分享",
            ),
            new Tab(
              text: "问答",
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: _loading
          ? LoadingWidget()
          : ListView.builder(
              controller: _scrollController,
              itemCount: topicsList.length,
              itemBuilder: (context, index) {
                if (index == topicsList.length - 1) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Transform.scale(scale: 0.5, child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      )),
                    ),
                  );
                }
                return Container(
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
                    child: new Material(
                        color: Colors.white,
                        child: InkWell(
                            onTap: () {
                              print("点击");
                              Navigator.pushNamed(context, "/article",
                                  arguments: topicsList[index]["id"]);
                            },
                            child: TopicCard(topicItem: topicsList[index]))));
              },
            ),
    );
  }
}
