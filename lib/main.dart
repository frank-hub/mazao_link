import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mazao_link/ui/authenticate/authenticate.dart';
import 'package:mazao_link/ui/authenticate/login.dart';
import 'package:mazao_link/ui/authenticate/test.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomeApp());
}
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}


