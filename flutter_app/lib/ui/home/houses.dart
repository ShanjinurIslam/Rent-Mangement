import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class House {
  static Widget getView(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            'Houses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .6,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.15), blurRadius: 10)
                  ]),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          'Add House',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 20,
                        right: 20,
                        bottom: 20,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .5,
                          width: MediaQuery.of(context).size.width * .3,
                          child: ListView(
                            children: <Widget>[
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 14),
                                  labelText: 'House name',
                                ),
                              ),
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 14),
                                  labelText: 'Address Line #1',
                                ),
                              ),
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 14),
                                  labelText: 'Address Line #2',
                                ),
                              ),
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 14),
                                  labelText: 'City',
                                ),
                              ),
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 14),
                                  labelText: 'Country',
                                ),
                              ),
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 14),
                                  labelText: 'ZipCode',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CupertinoButton(
                                    child: Text('Add House'),
                                    onPressed: () {},
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .6,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.15), blurRadius: 10)
                  ]),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          'Current Houses',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'ID',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0),
                              ),
                              Text(
                                'House Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0),
                              ),
                              Text(
                                'Address',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0),
                              ),
                              SizedBox(
                                width: 0,
                              )
                            ],
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(color: Colors.grey),
                        ),
                      ),
                      Positioned(
                          top: 135,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('1'),
                                    Text('Silverleaf'),
                                    Text(
                                        'House #25,Road #15,\nSector #04,\nUttara,\nDhaka')
                                  ],
                                ),
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ))),
                              );
                            },
                            itemCount: 4,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
