import "package:firebase_auth/firebase_auth.dart";
import 'package:ninja_brew_crew/models/user.dart';
import 'package:ninja_brew_crew/screens/notloggedin/signin.dart';

class AuthService{

  final FirebaseAuth _auth =  FirebaseAuth.instance;

  // Create user from Firebase user

  User _userFromFirebase(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

  //  Auth change user stream

  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map(_userFromFirebase);
  }
  // anony login 

  Future signInAnonymous() async{
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    } 
  }

  // signin with email and passwd

  Future signInWithEmailAndPassword(String email, String password) async{

    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    
    } catch (e) {
      print(e.toString());
      return e;
    }

  }


  // register with email and passwd

  Future registerWithEmailAndPass(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  // signout

  Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
      return null;
    }
  }


}