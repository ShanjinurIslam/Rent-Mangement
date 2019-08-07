import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Flat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlatState();
  }
}

class FlatState extends State<Flat> {
  int optionFlag = 0;
  int selectitem = 0;

  List<String> houseNames = ['Silverleaf','Hatemtower'] ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            'Flats',
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
                          'Add Flat',
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
                                  labelText: 'Flat Name',
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CupertinoButton(
                                child: Text(
                                  houseNames[selectitem],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.blueAccent,
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .copyWith()
                                                  .size
                                                  .height /
                                              3,
                                          child: CupertinoPicker(
                                            backgroundColor: Colors.white,
                                            children: <Widget>[
                                              Text(
                                                "Silverleaf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30),
                                              ),
                                              Text(
                                                "Hatemtower",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30),
                                              ),
                                            ],
                                            itemExtent:
                                                45, //height of each item
                                            looping: false,
                                            onSelectedItemChanged: (int index) {
                                              setState(() {
                                                selectitem = index;
                                              });
                                            },
                                          ),
                                        );
                                      });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CupertinoButton(
                                    child: Text('Add Flat'),
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
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              optionFlag = 0;
                            });
                          },
                          child: Text(
                            'Vacant Flats',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: optionFlag == 1
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 140,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              optionFlag = 1;
                            });
                          },
                          child: Text(
                            'All Flats',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: optionFlag == 0
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: optionFlag == 0 ? 20 : 140,
                        child: Container(
                          height: 1,
                          width: 50,
                          color: Colors.greenAccent,
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
                                'Flat ID',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0),
                              ),
                              Text(
                                'Flat Name',
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
                                    Text('#1'),
                                    Text('AB1'),
                                    Text('Silverleaf'),
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
