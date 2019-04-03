import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  /*
  * build方法是构造方法，必须得实现
  * */
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Hello flutter',
      home: new Scaffold(
        body: new RandomWords(),
      ),


      // 设置主题颜色，默认蓝色
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
    );
  }
}

/*
* 创建一个有状态的Widget
* */
class RandomWords extends StatefulWidget {
  @override
  /*
  * 有状态的Widget必须得实现 createState方法
  * */
  State<StatefulWidget> createState() {
    // 返回一个状态对象
    return new RandomWordsState();
  }
}

class RandomWordsState extends State {
  final _suggestions = <WordPair>[];  // 用来存放数据源
  final _biggerFont = const TextStyle(fontSize: 18);  // 用来设置row的样式
  final _saved = new Set();


  Widget _buildRow(WordPair pair) {
    final alreadSaved = _saved.contains(pair);

    /*
    * ListTile 相当于cell
    * */
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadSaved ? Icons.favorite : Icons.favorite_border,
        color: alreadSaved ? Colors.red : null,
      ),

      /*
      * onTap 是cell
      * */
      onTap: (){
        setState(() {
          if (alreadSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }


  Widget _buildSuggestion(){

    /*
      * ListView需要用 builder方法来构建
      * 同时itemBuilder参数必须得有入参，用来实现每个item显示的Widget，值是一个匿名函数
      * 函数有2个参数context和index
      * */
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),

      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          final items = generateWordPairs().take(10);
          _suggestions.addAll(items);
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }


  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final titles = _saved.map(
                (pair){
                  return new ListTile(
                    title: new Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                }
            );


            final divided = ListTile.divideTiles(tiles: titles, context: context).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Hello World'),
              ),

              body: new ListView(
                children: divided,
              ),
            );
          }

      )
    );
    
  }
  

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Helo'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),

      body: _buildSuggestion(),
    );
  }
}


