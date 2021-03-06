import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mazao_link/models/user.dart';
import 'package:mazao_link/services/auth.dart';
import 'package:mazao_link/ui/authenticate/authenticate.dart';
import 'package:mazao_link/ui/wrapper.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomeApp());
}
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}


