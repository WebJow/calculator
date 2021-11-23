import 'package:calculator/pages/details_page.dart';
import 'package:calculator/pages/settings_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  double height = 0.0;
  double part = 0.35;
  var input = "0";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = (MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('SBC'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new SettingsPage();
                }));
              }),
        ],
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      bottomSheet: bottomAdsArea(context),
      body: Column(
        children: <Widget>[
          new Expanded(flex: 6, child: displayArea(context)),
          buildControls(),
          new Expanded(
            // flex: 10,
            flex: 8,
            child: new Container(
              // color: Colors.blue[100],
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    flex: 4,
                    child: Container(
                      child: new Column(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(child: buildButton(text: '1', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '2', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '3', bgColor: Colors.grey[300])),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(child: buildButton(text: '4', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '5', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '6', bgColor: Colors.grey[300])),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(child: buildButton(text: '7', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '8', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '9', bgColor: Colors.grey[300])),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(child: buildButton(text: '00', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '0', bgColor: Colors.grey[300])),
                                Expanded(child: buildButton(text: '.', bgColor: Colors.grey[300])),
                              ],
                            ),
                          ),
                          Expanded(child: Row(children: <Widget>[Spacer()])),
                        ],
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        Expanded(flex: 1, child: buildButton(text: '*', lineHeight: 1.7, textColor: Colors.white, bgColor: Colors.grey[700])),
                        Expanded(flex: 2, child: buildButton(text: 'Next', lineHeight: 1.0, fontSize: 18.0, textColor: Colors.white, bgColor: Colors.grey[700])),
                        Expanded(flex: 1, child: buildButton(text: '000', lineHeight: 1.2, fontSize: 19.0, textColor: Colors.white, bgColor: Colors.grey[700])),
                        Expanded(child: new Row()),
                      ],
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

  // eraser & backspace and reset buttons
  Container buildControls() {
    return new Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey[300]),
          bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new IconButton(
              icon: FaIcon(
                FontAwesomeIcons.redo,
                color: Colors.grey[700],
              ),
              onPressed: () {}),
          new IconButton(
              icon: FaIcon(
                FontAwesomeIcons.eraser,
                color: Colors.grey[700],
              ),
              onPressed: () {
                setState(() {
                  input = "0";
                });
              }),
          new IconButton(
              icon: FaIcon(
                FontAwesomeIcons.backspace,
                color: Colors.grey[700],
              ),
              onPressed: () {
                setState(() {
                  input = input.substring(0, input.length - 1);
                });
              })
        ],
      ),
    );
  }

  Container bottomAdsArea(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      color: Colors.grey[300],
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Center(child: new Text('Ads will display here...')),
    );
  }

  Container displayArea(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SafeArea(
        child: new Row(
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      flex: 3,
                      child: new Text('${input}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    ),
                    new Divider(),
                    new Expanded(
                      child: Center(
                        child: new Text('${input}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: new Column(
                  children: <Widget>[
                    new Expanded(
                      flex: 3,
                      child: new ListView.separated(
                        itemCount: 100,
                        // itemExtent: 40,
                        itemBuilder: (context, index) {
                          // sample data generating
                          int rand = Random().nextInt(100);
                          return new InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return new DetailsPage();
                              }));
                            },
                            child: Text(
                              '$rand * $index = ${(index * 10)}',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return new Divider();
                        },
                      ),
                    ),
                    new Divider(),
                    new Expanded(child: Center(child: new Text('564'))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({text, double fontSize: 21.0, EdgeInsetsGeometry padding: const EdgeInsets.all(0), bgColor: Colors.red, textColor: Colors.black, double lineHeight: 1.0}) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: padding,
      child: Material(
        color: bgColor,
        // borderRadius: BorderRadius.vertical(top: Radius.circular(100.0), bottom: Radius.circular(100.0)),
        child: InkWell(
          // borderRadius: BorderRadius.vertical(top: Radius.circular(100.0), bottom: Radius.circular(100.0)),
          onTap: () {
            //  here you get the number
            print('$text');

            switch (text) {
              case 'Next':
                // ramazai do something you want
                break;
              case '0':
                // ramazai do something you want
                break;
              case '1':
                // ....
                break;
              case '2':
                break;
              case '3':
                break;
              case '4':
                break;
              case '5':
                break;
              case '6':
                break;
              case '7':
                break;
              case '8':
                break;
              case '9':
                break;
              case '00':
                break;
              case '000':
                break;
              default:
            }
            setState(() {
              if (input == "0") input = "";
              input += text;
            });
          },
          child: Container(
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.w300, height: lineHeight),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
