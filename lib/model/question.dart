import 'package:myflutterapp/model/author.dart';

class Question {
  int id;
  String type;
  String title;
  String excerpt;
  int answerCount;
  int followerCount;
  int commentCount;
  Author author;

  Question.fromJson(data) {
    id = data['id'];
    title = data['title'];
    excerpt = data['excerpt'];
    answerCount = data['answer_count'];
    followerCount = data['follower_count'];
    commentCount = data['comment_count'];

    if (data['author'] != null) {
      author = Author.fromJson(data['author']);
    }
  }
}
