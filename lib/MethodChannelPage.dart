import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelPage extends StatefulWidget {
  MethodChannelPage({Key key}) : super(key: key);

  @override
  _MethodChannelPageState createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  var _data;

  int _counter = 30;

  // var channel = MethodChannel('com.zhou.MethodChannel');
  static const MethodChannel channel =
      const MethodChannel('com.zhou.MethodChannel');

  var _nativeData;

  @override
  void initState() {
    super.initState();
    print("_MethodChannelPageState initState");

    channel.setMethodCallHandler((call) {
      var callData =
          "Flutter收到Native发送的数据" + call.method + call.arguments.toString();
      print(callData);
      setState(() {
        _nativeData = call.arguments["count"];
      });
      return Future<dynamic>.value();
    });
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    var result = await channel
        .invokeMethod('flutterSendData', {'name': 'zhou', 'age': _counter});
    print("Flutter 收到了返回数据");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("MethodChannel"),
      ),
      body: Column(
        children: [
          Text("Flutter发送的数据："),
          Text('$_counter'),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text(
              '发送数据',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          Text("Native发送的数据："),
          Text('$_nativeData'),
        ],
      ),
    );
  }
}
