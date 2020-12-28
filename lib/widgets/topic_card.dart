import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  var topicItem = {};
  TopicCard({this.topicItem});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
        margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
        child: Column(children: [
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                '${topicItem["title"]}',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
            child: Row(
              children: [
                // Image(image: NetworkImage('${topicItem["author"]["avatar_url"]}'), width: 50.0,),
                ClipOval(
                    child: Image(
                      image: NetworkImage(
                          '${topicItem["author"]["avatar_url"]}'),
                      width: 20.0,
                    )
                  // child: Image.network("http://avatars0.githubusercontent.com/u/5453359?v=4&s=120")
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                  child: Text(
                    '${topicItem["author"]["loginname"]}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                  child: Text(
                    "2020-12-26",
                    style:
                    TextStyle(color: Color(0xAA333333)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
            alignment: Alignment.topLeft,
            child: Text(
              topicItem["intro"] ?? "无",
              style: TextStyle(color: Color(0xFF999999)),
            ),
          )
        ]));
  }

}