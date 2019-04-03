import 'package:flutter/material.dart';

/*
* 子类是无状态组件，父类是有状态组件，
* 但是子类的样式会根据父类的状态变化而发生变化，
* 比如父组件有个 _active状态值，子控件被点击时，父组件的状态要发生变化，同时子组件因为_active发生变化而发生变化
*
*
* */
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleSonWidgetChanged(bool newValue) {
    setState(() {
      _active = !_active;
    });
  }

  /*
  * 状态发生变化时会重新调用 build 方法重新渲染页面
  *
  * 重新赋值，子组件拿到新的状态值
  * */
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new SonWidget(
        active: _active,
        onChanged: _handleSonWidgetChanged,
      ),
    );
  }
}



class SonWidget extends StatelessWidget {
  /*
  * 创建一个默认构造函数：状态值 和 回调函数
  * */
  SonWidget({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;

  // Signature for callbacks that report that an underlying value has changed
  final ValueChanged<bool> onChanged;

  /*
  * 点击时调用 父组件 传递进来的函数
  * */
  void _handleTap() {
    onChanged(!active);
  }


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),

        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

