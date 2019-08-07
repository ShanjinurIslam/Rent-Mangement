import 'package:example_flutter/ui/home/flats.dart';
import 'package:example_flutter/ui/home/renters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'houses.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;

  Widget loadUI() {
    switch (index) {
      case 0:
        return Center(
          child: Text('dashboard'),
        );
        break;
      case 1:
        return new House();
        break;
      case 2:
        return new Flat();
        break;
      case 3:
        return new Renter();
        break;
      case 4:
        return Center(
          child: Text('invoice'),
        );
        break;
      case 5:
        return Center(
          child: Text('payment'),
        );
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.green,
        trailing: GestureDetector(
          child: Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        middle: Text(
          'Rent Manager',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 200,
              color: Color.fromRGBO(65, 69, 80, 1),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 75,
                      width: 200,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.profile_circled,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Shanjinur Islam',
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 16,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        color:
                            index == 0 ? Color.fromRGBO(87, 96, 113, 1) : null,
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 15,
                                left: 30,
                                child: Icon(
                                  Icons.dashboard,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 80,
                                child: Text(
                                  'Dashboard',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 135,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        color:
                            index == 1 ? Color.fromRGBO(87, 96, 113, 1) : null,
                        child: Center(
                            child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 15,
                              left: 30,
                              child: Icon(
                                CupertinoIcons.home,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 80,
                              child: Text(
                                'Houses',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 195,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        color:
                            index == 2 ? Color.fromRGBO(87, 96, 113, 1) : null,
                        child: Center(
                            child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 15,
                              left: 30,
                              child: Icon(
                                Icons.account_balance,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 80,
                              child: Text(
                                'Flats',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 255,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        color:
                            index == 3 ? Color.fromRGBO(87, 96, 113, 1) : null,
                        child: Center(
                            child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 15,
                              left: 30,
                              child: Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 80,
                              child: Text(
                                'Renters & Rents',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 315,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 4;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        color:
                            index == 4 ? Color.fromRGBO(87, 96, 113, 1) : null,
                        child: Center(
                            child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 15,
                              left: 30,
                              child: Icon(
                                Icons.apps,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 80,
                              child: Text(
                                'Invoices',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 375,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 5;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        color:
                            index == 5 ? Color.fromRGBO(87, 96, 113, 1) : null,
                        child: Center(
                            child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 15,
                              left: 30,
                              child: Icon(
                                Icons.payment,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 80,
                              child: Text(
                                'Payments',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            top: 0,
            left: 0,
            width: 200,
          ),
          Positioned(
            top: 0,
            left: 200,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width - 200,
              child: loadUI(),
            ),
          )
        ],
      ),
    );
  }
}
