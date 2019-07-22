import "package:flutter/material.dart";
import 'package:myflutterapp/model/recommend.dart';
import 'package:myflutterapp/network/request.dart';
import 'package:myflutterapp/page/frontPage/front_page_list_item.dart';

class FrontPageList extends StatefulWidget {
  @override
  _FrontPageList createState() => _FrontPageList();
}



class _FrontPageList extends State<FrontPageList> {
  List<Recommend> modules = [];

  bool isRequesting = false;

  int page = 1;

  ScrollController _scrollController = ScrollController();

  Future<void> fetchData() async {
    var response = await Request.get(action: "myhome_recommend");

    List<Recommend> modules = [];
    response.forEach((data) {
      modules.add(Recommend.fromJson(data));
    });

    setState(() {
      this.modules = modules;
      page = 1;
    });
  }

  Future<List<Recommend>> fakeRequest() async {
    var responseJson = await Request.get(action: "myhome_recommend");
    List<Recommend> modules = [];
    responseJson.forEach((data) {
      modules.add(Recommend.fromJson(data));
    });
    return Future.delayed(Duration(seconds: 1), () {
      return modules;
    });
  }

  void _getMoreData() async {
    if (!isRequesting) {
      setState(() => isRequesting = true);
      List<Recommend> newEntries = await fakeRequest(); //returns empty list
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        modules.addAll(newEntries);
        isRequesting = false;
        page++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (page < 3) {
          _getMoreData();
          print("get more data");
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildModule(BuildContext context, Recommend module) {
    return FrontPageListItem(recommend: module,);
  }

  Widget _buildProgressIndicator() {
    print("page:"+page.toString());
    if(page<3) {
      return new Padding(
        padding: const EdgeInsets.all(18.0),
        child: new Center(
          child: new Opacity(
            opacity: isRequesting ? 1.0 : 0.0,
            child: new CircularProgressIndicator(),
          ),
        ),
      );
    } else{
      return Text("没有更多了");
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchData,
      child: ListView.builder(
        itemCount: modules.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < modules.length) {
            return buildModule(context, modules[index]);
          } else {
            return _buildProgressIndicator();
          }
        },
        controller: _scrollController,
      ),
    );
  }
}
