import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:myflutterapp/page/frontPage/front_page.dart";

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  List<Icon> tabImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.grey),
    Icon(Icons.touch_app, size: 25.0, color: Colors.grey),
    Icon(Icons.school, size: 25.0, color: Colors.grey),
    Icon(Icons.notifications, size: 25.0, color: Colors.grey),
    Icon(Icons.person, size: 25.0, color: Colors.grey),
  ];

  List<Icon> tabSelectedImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.blue),
    Icon(Icons.touch_app, size: 25.0, color: Colors.blue),
    Icon(Icons.school, size: 25.0, color: Colors.blue),
    Icon(Icons.notifications, size: 25.0, color: Colors.blue),
    Icon(Icons.person, size: 25.0, color: Colors.blue),
  ];

  Icon getTabIcon(int index) {
    if (index == tabIndex) {
      return tabSelectedImages[index];
    } else {
      return tabImages[index];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          Center(
            child: FrontPage(),
          ),
          Center(
            child: Text("2"),
          ),
          Center(
            child: Text("3"),
          ),
          Center(
            child: Text("4"),
          ),
          Center(
            child: Text("5"),
          ),
        ],
        index: tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.teal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('首页')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('想法')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('大学')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('消息')),
          BottomNavigationBarItem(icon: getTabIcon(4), title: Text('我')),
        ],
        currentIndex: tabIndex,
        onTap: (index){
          setState(() {
           tabIndex = index; 
          });
        },
      ),
    );
  }
}
