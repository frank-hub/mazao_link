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
//sign in with Email and password
  Future signInWithEmailAndPass(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    }catch (e) {
      print(e.toString());
      return null;
    }
  }
  //register with Email $ password
  Future registerWithEmailAndPass(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = userCredential.user;
      //create doc for the user with uid
      // await DatabaseService(uid: user.uid).updateUserData('username', 071000000, 'Male','Kericho', '1797','Kapsuser');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
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