import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class LogInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInPageState();
  }
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 1,
      navigateAfterSeconds: new AfterSplash(),
      loadingText: Text('Setting up'),
      title: new Text(
        'Welcome\nThis is Rent Manager',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.purple,
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Rent Manager',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 400,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      height: 55,
                      width: 275,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(fontSize: 14),
                          labelText: 'Username',
                        ),
                      )),
                  SizedBox(
                      height: 55,
                      width: 275,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(fontSize: 14),
                          labelText: 'Password',
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Container(
                      height: 55,
                      width: 275,
                      color: Colors.black,
                      child: Center(
                        child: Text('Log In',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      print('object');
                    },
                    child: Container(
                      height: 55,
                      width: 275,
                      color: Colors.blue,
                      child: Center(
                        child: Text('Create Account',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
