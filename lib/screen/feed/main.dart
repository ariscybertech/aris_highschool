import 'package:flutter/material.dart';
import 'package:highschool/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

// TODO FIX DESIGN AND TEMPLATE
class _FeedScreenState extends State<FeedScreen> {
  Future<List<User>> fetchUserFromGithub() async {
    final response = await http.get('https://api.github.com/users');

    print(response.body);

    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }

  List<User> createUserList(List data) {
    List<User> list = new List();

    for (var i = 0; i < data.length; i++) {
      String title = data[i]["login"];
      int id = data[i]["id"];
      User movie = new User(title, id.toString());
      list.add(movie);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder<List<User>>(
        future: fetchUserFromGithub(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(snapshot.data[index].username,
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                        new Divider()
                      ]);
                });
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return new CircularProgressIndicator();
        },
      ),
    );
  }
}
