import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './Post.dart';

class JsonHomeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Fetch Data'),
      ),
      body: new Center(
        /// FutureBuilder
        child: new FutureBuilder(
          future: fetchPost(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return new Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return new Text('${snapshot.error}');
            }

            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);

  return new Post.fromJson(responseJson);
}