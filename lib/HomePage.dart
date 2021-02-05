import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Views"),
        ),
        body: Column(
          children: [
            methodChannelButton(),
          ],
        ));
  }

  Widget methodChannelButton() {
    return RaisedButton(
      child: Text(
        'testMethodChannel',
        style: TextStyle(fontSize: 28.0),
      ),
      onPressed: () {
        // Navigate to the second screen using a named route
        Navigator.pushNamed(context, '/testMethodChannel');
      },
    );
  }
}
