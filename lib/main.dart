import 'dart:async';
import 'package:chat_app/screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {runApp(MyApp());}
Color PrimaryColor = Colors.cyan[800];
Color SecondaryColor = Colors.cyan[100];
Color TertiaryColor = Colors.white;

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(debugShowCheckedModeBanner: false,
   title: 'ChatApp',
   home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    setValue();
    Timer(Duration(seconds: 5), ()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Introduction()))
    );
  }

  void setValue() async {
    final prefs = await SharedPreferences.getInstance();
    int launchCount = prefs.getInt('counter') ?? 0;
    prefs.setInt('counter', launchCount + 1);
    if (launchCount == 0) {Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Introduction()
      ));
    } else {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }}

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.cyan[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border.all(
                  color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Image.asset('images/logo.png'),

            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text('Welcome to ChatApp',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent, strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
