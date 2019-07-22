import 'package:myflutterapp/model/answer.dart';

class Recommend {
  String id;
  String type;
  int createdTime;
  int updatedTime;
  Answer target;
  String actionText;

  Recommend.fromJson(Map data) {
    id = data['id'];
    type = data['type'];
    createdTime = data['updated_time'];
    updatedTime = data['updated_time'];

    if (data['target'] != null) {
      target = Answer.fromJson(data['target']);
    }
  }
}