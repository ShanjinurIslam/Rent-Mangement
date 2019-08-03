import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInPageState();
  }
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Management'),
      ),
      body: Center(
          child: FlatButton(
        child: Text('Log In'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      )),
    );
  }
}
