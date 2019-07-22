 
class Author {
  String id;
  String name;
  int gender;
  String avatarUrl;
  String headline;

  Author.fromJson(Map data) {
    id = data['id'];
    name = data['name'];
    gender = data['gender'];
    avatarUrl = data['avatar_url'];
    headline = data['headline'];
  }
}