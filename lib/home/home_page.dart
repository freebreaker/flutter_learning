import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:myflutterapp/page/frontPage/front_page.dart";
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int tabIndex = 0;

  // List<Icon> tabImages = [
  //   Icon(Icons.view_list, size: 25.0, color: Colors.grey),
  //   Icon(Icons.touch_app, size: 25.0, color: Colors.grey),
  //   Icon(Icons.school, size: 25.0, color: Colors.grey),
  //   Icon(Icons.notifications, size: 25.0, color: Colors.grey),
  //   Icon(Icons.person, size: 25.0, color: Colors.grey),
  // ];

  // List<Icon> tabSelectedImages = [
  //   Icon(Icons.view_list, size: 25.0, color: Colors.blue),
  //   Icon(Icons.touch_app, size: 25.0, color: Colors.blue),
  //   Icon(Icons.school, size: 25.0, color: Colors.blue),
  //   Icon(Icons.notifications, size: 25.0, color: Colors.blue),
  //   Icon(Icons.person, size: 25.0, color: Colors.blue),
  // ];

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "首页", Colors.blue),
    new TabItem(Icons.search, "Search", Colors.orange),
    new TabItem(Icons.layers, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);

  CircularBottomNavigationController _navigationController =
      CircularBottomNavigationController(tabIndex);

  // Icon getTabIcon(int index) {
  //   if (index == tabIndex) {
  //     return tabSelectedImages[index];
  //   } else {
  //     return tabImages[index];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[200],
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
          ],
          index: tabIndex,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (int selectedPos) {
            print("clicked on $selectedPos");
            setState(() {
              tabIndex = selectedPos;
            });
          },
        ));
  }
}
