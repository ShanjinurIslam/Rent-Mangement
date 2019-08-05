import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.green,
        middle: Text(
          'Dashboard',
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
                      child: Container(
                        height: 60,
                        width: 200,
                        color: Color.fromRGBO(87, 96, 113, 1),
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
                      child: Container(
                        height: 60,
                        width: 200,
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
                      child: Container(
                        height: 60,
                        width: 200,
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
                      child: Container(
                        height: 60,
                        width: 200,
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
                                'Renters',
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
                      child: Container(
                        height: 60,
                        width: 200,
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
                      child: Container(
                        height: 60,
                        width: 200,
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
        ],
      ),
    );
  }
}
