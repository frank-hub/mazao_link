import 'package:firebase_auth/firebase_auth.dart';
import 'package:mazao_link/models/user.dart';


class AuthService{
  FirebaseAuth  _auth = FirebaseAuth.instance;
  //create user obj based on FirebaseUser
  CurrentUser _userFromFirebaseUser(User user){
    return user != null ? CurrentUser(uid: user.uid) :null;
  }
  Stream <CurrentUser> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
}
//sign in Anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}