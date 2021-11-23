import 'package:calculator/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> _list = new List<String>();
  @override
  void initState() {
    super.initState();
    // _list.add('12 * 10 ');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Details'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.share), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.content_copy), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.settings), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return new SettingsPage();
            } ));
          }),

        ],
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: new ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) {
            return new ListTile(
              onTap: () async {
                print(' -------- Editing --------');
                await _showMyDialog();
              },
              trailing: new SizedBox(
                width: 100,
                height: 60,
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new IconButton(
                        icon: FaIcon(FontAwesomeIcons.edit, size: 16, color: Colors.blue),
                        onPressed: () async {
                          await _showMyDialog();
                        }),
                    new IconButton(
                        icon: FaIcon(FontAwesomeIcons.trash, size: 16, color: Colors.red),
                        onPressed: () async {
                          await _showDeleteDialog();
                        }),
                  ],
                ),
              ),
              title: new Text('$index * 10 = ${index * 10}'),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return new Divider();
          },
        ),
      ),
    );
  }

  Future<void> _showDeleteDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Are you sure to delete this record ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure to delete this record ?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Delete', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You can change digits as you want.'),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new TextFormField(
                        decoration: new InputDecoration(hintText: 'number 1'),
                      ),
                    ),
                    new Expanded(
                      child: new TextFormField(
                        decoration: new InputDecoration(hintText: 'number 1'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Apply'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
