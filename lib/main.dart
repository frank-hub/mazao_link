import 'package:flutter/material.dart';
import 'package:mazao_link/ui/login.dart';

void main() {
  runApp(HomeApp());
}
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}


