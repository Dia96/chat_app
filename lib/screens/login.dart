import 'package:chat_app/main.dart';
import 'package:chat_app/screens/mainscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

String name, email, password, photoUrl;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
    await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential userCredential =
    await _firebaseAuth.signInWithCredential(authCredential);
    final User user = userCredential.user;
    assert(user.photoURL != null);
    assert(user.displayName != null);
    assert(user.email != null);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = user.displayName;
      email = user.email;
      photoUrl = user.photoURL;
    });

    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);
    return 'Logged In';
  }

  @override

  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () => exit(0),
        child: Scaffold(backgroundColor: SecondaryColor,
          body: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_GoogleSignInButton()],
            ))));}

  _GoogleSignInButton() {

    return Builder( builder: (context) =>
        Column(
            children: <Widget>[
              Text('WELCOME TO CHATAPP', style: TextStyle(fontSize: 30, color: PrimaryColor),),
              Container(child: Image(image: AssetImage('images/chatlogo.png'))),
              SizedBox(width: 250.0,
                child: ColorizeAnimatedTextKit(
                    speed: Duration(milliseconds: 100), repeatForever: true,
                    onTap: () {print("Tap Event");},
                    text: [
                      '   CHAT',
                      '   SHARE ',
                      ' CONNECT',
                      '  LOCATE',
                    ],
                    textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                    colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.blue,
                      Colors.indigo,
                    ],
                    textAlign: TextAlign.start,
                )),
              SizedBox(height: 20),
              Container(margin: EdgeInsets.only(left: 50, right: 50),height: 50,
                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10)),
                    CircleAvatar(backgroundImage: AssetImage('images/googlelogo.png'),),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    GestureDetector(onTap: () => googleSignIn().whenComplete(()
                    async {
                      await  FirebaseFirestore.instance.collection("user").add(
                              {'email': email,
                                'name' : name,
                                'photoUrl' : photoUrl,
                              }).then((value){print(value.id);});
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                        }),
                        child: Text('Sign in with Google', style: TextStyle(fontSize: 18),))
                  ],),),
              SizedBox(height: 20,),
              Container(margin: EdgeInsets.only(left: 50, right: 50), height: 50,
                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10)),
                    CircleAvatar(backgroundImage: AssetImage('images/applelogo.png'),),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Text('Sign in with iOS',style: TextStyle(fontSize: 18),)
                  ],
                ))]));
  }}

