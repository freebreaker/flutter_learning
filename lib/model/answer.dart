

import 'package:myflutterapp/model/author.dart';
import 'package:myflutterapp/model/question.dart';

class Answer {
  int id;
  String excerpt;
  int createdTime;
  int updatedTime;
  int commentCount;
  int voteupCount;
  Question question;
  Author author;

  Answer.fromJson(Map data) {
    id = data['id'];
    excerpt = data['excerpt'];
    createdTime = data['created_time'];
    updatedTime = data['updated_time'];
    commentCount = data['comment_count'];
    voteupCount = data['voteup_count'];

    if (data['author'] != null) {
      author = Author.fromJson(data['author']);
    }

    if (data['question'] != null) {
      question = Question.fromJson(data['question']);
    }
  }
}