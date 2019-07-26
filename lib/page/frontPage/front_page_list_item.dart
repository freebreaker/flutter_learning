import 'package:flutter/material.dart';
import 'package:myflutterapp/model/recommend.dart';

class FrontPageListItem extends StatelessWidget {
  final Recommend recommend;

  const FrontPageListItem({Key key, this.recommend}) : super(key: key);

  Widget infoItem(IconData icon, String info) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 18.0,
          color: Colors.grey,
        ),
        SizedBox(
          width: 3.0,
        ),
        Text(
          info,
          style: TextStyle(fontSize: 16.0, color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.question_answer),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              recommend.target.question.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: infoItem(Icons.thumb_up,
                      this.recommend.target.voteupCount.toString()),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: infoItem(Icons.chat_bubble_outline,
                      this.recommend.target.commentCount.toString()),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
