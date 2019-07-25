import "package:flutter/material.dart";

class CardEveryday extends StatefulWidget {
  CardEveryday({Key key, this.content, this.author}) : super(key: key);

  final String content;
  final String author;

  @override
  _CardEveryday createState() => _CardEveryday();
}

class _CardEveryday extends State<CardEveryday> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(18),
        // color: Colors.redAccent[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("2019/7/24"),
              // subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('BUY TICKETS'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: Text('LISTEN'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
