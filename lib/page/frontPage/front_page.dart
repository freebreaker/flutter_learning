import "package:flutter/material.dart";
import 'package:myflutterapp/page/frontPage/card_everyday.dart';

// import 'package:myflutterapp/page/frontPage/front_page_list.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPage createState() => _FrontPage();
}

class _FrontPage extends State<FrontPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final loginButton = FlatButton.icon(
    onPressed: () {},
    icon: Icon(Icons.mode_edit, size: 20.0, color: Colors.blue),
    label: Text("提问", style: TextStyle(color: Colors.blue, fontSize: 18.0)),
  );

  // Widget searchBar() {
  //   return Row(
  //     children: <Widget>[
  //       Expanded(
  //         child: Padding(
  //           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
  //           child: FlatButton.icon(
  //             color: Colors.black12,
  //             onPressed: () {},
  //             icon: Icon(Icons.search, size: 18.0, color: Colors.grey),
  //             label: Text(
  //               "搜索",
  //               style: TextStyle(color: Colors.grey, fontSize: 16.0),
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: CardEveryday(content: "白日依山尽，黄河入海流",author: "free"),
    );
  }
}
