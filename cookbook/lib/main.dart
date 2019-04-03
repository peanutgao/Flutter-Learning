import 'package:flutter/material.dart';
// import 'themeDemo.dart';
// import 'imageDemo.dart';
// import 'listDemo.dart';
// import 'listDemoBuilder.dart';
// import 'listDemoDifferentItem.dart';
// import 'gridViewDemo.dart';
// import 'gestureTapDemo.dart';
// import 'inkWellDemo.dart';
// import 'dismissableDemo.dart';
// import './Nav/firstScreen.dart';
// import './PagePassData/todoListPage.dart';
import './PagePassDataBack/homeScreen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final items = new List<ListItem>.generate(
    //   1000, 
    //   (i) => i % 6 == 0
    //     ? new HeadingItem('Heading $i')
    //     : new MessageItem('Sender $i', 'Message body $i'),
    // );

    return MaterialApp(
      title: 'Cookbook案例',
      home: new Scaffold(
        // body: ThemeDemo(),
        // body: ImageDemo(),
        // body: ListViewDemo(),
        // body: HListViewDemo(),
        // body: LongListViewDemo(items: ['a', 'b', 'c', 'd', 'e']),
        // body: ListDifferentItemDemo(items: items),
        // body: GridViewDemo(),
        // body: MyButton(),
        // body: InkWellDemo(),
        // body: DismissableDemo(),
        // body: FirstScreen(),
        // body: TodoListPage(),
        body: HomeScreen(),
      ),
    );
  }
}