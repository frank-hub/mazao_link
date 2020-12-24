import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mazao_link/models/user.dart';
import 'package:mazao_link/services/auth.dart';

class HomePage  extends StatelessWidget {
  final AuthService _auth= AuthService();
  User _user= FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text("Mazao Link Manager"),
    centerTitle: true,
    backgroundColor: Colors.blue,
    elevation: 0.0,
    actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
    onPressed: () async {
    await _auth.signOut();
    },
    label: Text('logout')),

    ],

    ),
      body: Container(
        child: Center(
          child: Text(_user.uid),
        ),
      ),
    );
  }
}
