import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DoubanTheatersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String titleString = 'Movies';
    return MaterialApp(
      title: titleString,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: HomeApp(title: titleString),
    );
  }
}


class HomeApp extends StatefulWidget {
  final String title;
  HomeApp({Key key, this.title}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _HomeAppState();
  }
}

class _HomeAppState extends State<HomeApp> {
  String title = '';
  List dataArray = [];


  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: _getBody(),
      ),
    );
  }

  _loadData() async {
    var url = 'https://api.douban.com/v2/movie/in_theaters';
    var httpClient = new HttpClient();
    
    try {
      var uri = Uri.parse(url);
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var json = await response.transform(utf8.decoder).join();
      var data = jsonDecode(json);
      print(data);

      this.title = data['title'];
      this.dataArray = data['subjects'];
    } catch (excp) {
      print(excp);
    }
  }

  Widget _getBody() {
    return ListView.builder(
        itemCount: this.dataArray.length,
        itemBuilder: (ctx, idx) {
          var subject = this.dataArray[idx];
          return getItem(subject);
        },
      );
    // if (this.dataArray.length != 0) {
    //   return ListView.builder(
    //     itemCount: this.dataArray.length,
    //     itemBuilder: (ctx, idx) {
    //       var subject = this.dataArray[idx];
    //       return getItem(subject);
    //     },
    //   );
    // } else {
    //   return CupertinoActivityIndicator();
    // }
  }



  Widget getItem(var subject) {

    var avatars = List.generate(
      subject['casts'].length,
      (int index) => Container(
        margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),
        child: CircleAvatar(
          backgroundColor: Colors.white10,
          backgroundImage: NetworkImage(subject['casts'][index]['avatars']['small']),
        ),
      )
    );

    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          // 设置圆角
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              subject['images']['large'],
              width: 100.0,
              height: 150.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8.0),
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 标题
                  Text(
                    subject['title'],
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  // 评分
                  Text(
                    "豆瓣评分: ${subject['rating']['average']}",
                    style: TextStyle(
                      fontSize: 16.0
                    )
                  ),
                  // 类型
                  Text(
                    "类型:${subject['genres'].join('、')}",
                  ),
                  // 导演
                  Text(
                    '导演: ${subject['directors'][0]['name']}'
                  ),
                  // 主演
                  Container(
                    margin: EdgeInsets.only(top: 8.0),  
                    child: Row(
                      children: <Widget>[
                        Text('主演：'),
                        Row(
                          children: avatars,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    
    return Card(
      child: row,
    );
  }
}