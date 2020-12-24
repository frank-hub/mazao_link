import 'package:firebase_auth/firebase_auth.dart';
import 'package:mazao_link/models/user.dart';
import 'package:mazao_link/services/database.dart';


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
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password:password );
      User user =userCredential.user;

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  //register with Email $ password
  Future registerWithEmailAndPass(String name,String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password );
      User user = userCredential.user;
//create doc for the user with uid
      await DatabaseService(uid: user.uid).updateUserData(name, email ,0, 'gender', 'county', 'address', 'location');
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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