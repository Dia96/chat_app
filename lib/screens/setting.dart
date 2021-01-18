import 'package:chat_app/main.dart';
import 'package:chat_app/screens/mainscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: Text('Settings'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        backgroundColor: PrimaryColor,
        foregroundColor: TertiaryColor,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => MainScreen()
          ));
        },
        icon: Icon(Icons.home),
        label: Text('HOME'),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.cyan[200], Colors.cyan[600]]),
            // color: Colors.lightBlueAccent[100],
            borderRadius: BorderRadius.circular(50)),
        height: 500,


        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[700],
                    blurRadius: 40.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100.0),),
                gradient: LinearGradient(colors: <Color>[
                  Colors.cyan[200],
                  Colors.cyan[400]
                ]),
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(FontAwesomeIcons.indent, size: 25, color: Colors.black87),
                trailing: Icon(FontAwesomeIcons.angleRight, size: 30,),
                //trailing: Icon(Icons.call, size: 30, color: Colors.blueGrey),
                title: Text('App Permissions', style: TextStyle(fontSize: 25,
                ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[700],
                    blurRadius: 40.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100.0),),
                gradient: LinearGradient(colors: <Color>[
                  Colors.cyan[200],
                  Colors.cyan[400]
                ]),
              ),
              child: ListTile(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MariaScreen()),);
                },
                leading: Icon(FontAwesomeIcons.circleNotch, size: 25, color: Colors.black87),
                trailing: Icon(FontAwesomeIcons.angleRight, size: 30,),
                //trailing: Icon(Icons.call, size: 30, color: Colors.blueGrey),
                title: Text("Data Usage", style: TextStyle(fontSize: 25,
                ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[700],
                    blurRadius: 40.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100.0),),
                gradient: LinearGradient(colors: <Color>[
                  Colors.cyan[200],
                  Colors.cyan[400]
                ]),
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(FontAwesomeIcons.ggCircle, size: 25, color: Colors.black87),
                trailing: Icon(FontAwesomeIcons.angleRight, size: 30,),
                title: Text('Clear Cache', style: TextStyle(fontSize: 25,
                ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[700],
                    blurRadius: 40.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100.0),),
                gradient: LinearGradient(colors: <Color>[
                  Colors.cyan[200],
                  Colors.cyan[400]
                ]),
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(FontAwesomeIcons.lock, size: 25, color: Colors.black87),
                trailing: Icon(FontAwesomeIcons.angleRight, size: 30,),
                title: Text('Privacy', style: TextStyle(fontSize: 25,
                ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[700],
                    blurRadius: 40.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100.0),),
                gradient: LinearGradient(colors: <Color>[
                  Colors.cyan[200],
                  Colors.cyan[400]
                ]),
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(FontAwesomeIcons.newspaper, size: 25, color: Colors.black87),
                trailing: Icon(FontAwesomeIcons.angleRight, size: 30,),
                //trailing: Icon(Icons.call, size: 30, color: Colors.blueGrey),
                title: Text('Terms & Conditions', style: TextStyle(fontSize: 25,
                ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[700],
                    blurRadius: 40.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100.0),),
                gradient: LinearGradient(colors: <Color>[
                  Colors.cyan[200],
                  Colors.cyan[400]
                ]),
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(FontAwesomeIcons.questionCircle, size: 25, color: Colors.black87),
                trailing: Icon(FontAwesomeIcons.angleRight, size: 30),
                title: Text("FAQ's", style: TextStyle(fontSize: 25,
                ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[700],
                    blurRadius: 40.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100.0),),
                gradient: LinearGradient(colors: <Color>[
                  Colors.cyan[200],
                  Colors.cyan[400]
                ]),
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(FontAwesomeIcons.headphones, size: 25, color: Colors.black87),
                trailing: Icon(FontAwesomeIcons.angleRight, size: 30,),
                title: Text('Support', style: TextStyle(fontSize: 25,
                ),
                ),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
