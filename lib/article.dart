import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:myproject/utils/request.dart';
import 'package:myproject/widgets/loading.dart';

class Article extends StatefulWidget {
  Article();

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  var MyArticle = {};
  var _loadding = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    RequestCollection()
        .getArticleById(id: ModalRoute.of(context).settings.arguments)
        .then((res) {
      Map<String, dynamic> topic = json.decode(res);
      if (topic["success"]) {
        setState(() {
          MyArticle = topic["data"];
          _loadding = false;
        });
      }
      // print(res);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(MyArticle["title"] ?? "加载中")),
      body: SingleChildScrollView(
        child: _loadding
            ? LoadingWidget()
            : Html(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 20.0),
                backgroundColor: Colors.white,
                data: MyArticle["content"] ?? "",
              ),
      ),
    );
  }
}
