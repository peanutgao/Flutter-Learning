// import 'dart:convert';
// import 'dart:async';
// import 'package:http/http.dart';



class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  /**
   * Json转model手动方法：
   * 1. 实现 类.fromJson 工厂方法
   * 2. 转换时调用这个方法
   */
  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
