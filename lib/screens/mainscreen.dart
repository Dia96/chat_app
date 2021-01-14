import 'dart:io';
import 'package:chat_app/home/homescreen.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/mapscreen.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location_permissions/location_permissions.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {AnimationController _controller;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> signOut() async {_googleSignIn.signOut();
  }

  @override
  void initState() {super.initState();
  _controller = AnimationController(value: 0.0, duration: Duration(seconds: 25),
      upperBound: 1, lowerBound: -1, vsync: this,)..repeat();}

  @override
  void dispose() {_controller.dispose();
    super.dispose();}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,

        actions: <Widget> [
        SizedBox(
        width: 100.0,
        height: 10.0,
        child: OutlineButton(
          borderSide: BorderSide(width: 0.5),
          child: Text('Sign Out', style: TextStyle(color: Colors.black),),
          onPressed:   () {
            signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginScreen())
            );
          }
      ),
    ),
    ],

      ),
      resizeToAvoidBottomPadding: false, backgroundColor: Colors.cyan[800],
      floatingActionButton: CircularMenu(animationDuration: Duration(milliseconds: 10),
        toggleButtonPadding: 10, alignment: Alignment.bottomCenter, curve: Curves.fastOutSlowIn,
        toggleButtonBoxShadow: [BoxShadow(color: Colors.cyan[400], spreadRadius: 2, blurRadius: 5)],
        toggleButtonIconColor: PrimaryColor, toggleButtonColor: SecondaryColor, items: [
          CircularMenuItem(icon: Icons.info, boxShadow: [BoxShadow(color: Colors.cyan[400], spreadRadius: 2, blurRadius: 5)],
              color: SecondaryColor, iconColor: PrimaryColor,
              onTap: () {}
              ),
          CircularMenuItem(icon: Icons.settings, boxShadow: [BoxShadow(color: Colors.cyan[400], spreadRadius: 2, blurRadius: 5)],
              color: SecondaryColor, iconColor: PrimaryColor,
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          }
          ),
          CircularMenuItem(icon: Icons.rate_review, boxShadow: [BoxShadow(color: Colors.cyan[400], spreadRadius: 2,blurRadius: 5)],
              color: SecondaryColor, iconColor: PrimaryColor,
              onTap: () {}
              ),
          CircularMenuItem(icon: Icons.report_problem, boxShadow: [BoxShadow(color: Colors.cyan[400], spreadRadius: 2, blurRadius: 5)],
              color: SecondaryColor, iconColor: PrimaryColor,
              onTap: () {}
              ),
          CircularMenuItem(icon: Icons.exit_to_app, boxShadow: [BoxShadow(color: Colors.cyan[400], spreadRadius: 2, blurRadius: 5)],
            color: SecondaryColor, iconColor: PrimaryColor,
            onTap: () => exit(0),
          ),
        ],
      ),

      body: Column(children: <Widget>[
        Stack(alignment: Alignment.center, children: [
          AnimatedBuilder(animation: _controller, builder: (BuildContext context, Widget child) {
            return ClipPath(clipper: DrawClip(_controller.value), child:
             Container(height: size.height * 0.5, decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [SecondaryColor, Colors.cyan[800]
             ]
            ),
                      ),
                    ),
                  );
                },
              ),


          Container(
            child: Text('CHAT APP', style: TextStyle(color: TertiaryColor, fontSize: 46, fontWeight: FontWeight.bold),),
          ),
        ],
    ),

        Expanded(child: GridView.count(
          crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, shrinkWrap: true,
          children: <Widget>[
            Stack(children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())
                    );
                    },
                  child: Container(height: 120, width: 200,

                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50.0)
                    ),
                    gradient: LinearGradient(colors: <Color>[Colors.cyan[100], Colors.cyan[700]
                    ]
                    ),
                  ),
                    child: Text('CHAT', style: TextStyle( color: Colors.grey[800], fontWeight: FontWeight.bold,
                        fontSize: 30)), alignment: Alignment.bottomCenter,
                  ),
                ),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())
                  );
                  },
                child: Align( alignment: Alignment.topCenter,
                  child: Container(
                    height: 60, width: 70, decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      gradient: LinearGradient(colors: <Color>[ Colors.white, Colors.grey]
                      ),
                      image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover)
                  ),
                  ),
                ),
              ),
            ],
            ),
            Stack( children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GoogleScreen())
                  );
                  },
                child: Container(height: 120, width: 200, decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  gradient: LinearGradient(colors: <Color>[Colors.cyan[100], Colors.cyan[700]
                  ]
                  ),
                ),
                  child: Text('LOCATE', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 30)),
                  alignment: Alignment.bottomCenter),
              ),
              GestureDetector( onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GoogleScreen())
                );
                },
                child: Align(alignment: Alignment.topCenter,
                  child: Container(height: 60, width: 70, decoration:
                  BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(30.0)
                  ),
                      gradient: LinearGradient(
                          colors: <Color>[ Colors.white, Colors.grey]
                      ),
                      image: DecorationImage(image: AssetImage('images/locationlogo.png'), fit: BoxFit.cover,
                      )
                  ),
                  ),
                ),
              ),
            ],
            ),


          ],
        ),


        )
      ],
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0; double slice = math.pi; DrawClip(this.move);
  @override
  Path getClip(Size size) {Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter = size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


