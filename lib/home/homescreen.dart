
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/mainscreen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  HomeScreen({Key key, this.child}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchTextEditingController = new TextEditingController();
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text('ChatApp');
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: (){
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => MainScreen()));
        },
      child: DefaultTabController(length: 4,
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor:  Colors.cyan[800], foregroundColor: TertiaryColor,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => MainScreen()
              ));
              },
            icon: Icon(Icons.home),
            label: Text('HOME'),
          ),
          backgroundColor: Colors.cyan[700],

          appBar: AppBar(elevation: 10, title: customSearchBar,
            actions: <Widget>[IconButton(onPressed: () {setState(() {
                      if(this.customIcon.icon == Icons.search) {
                        this.customIcon=Icon(Icons.cancel);
                        this.customSearchBar = TextField(
                          controller: searchTextEditingController,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(color: TertiaryColor)),
                          style: TextStyle(color: TertiaryColor,),
                        );
                      }
                      else
                      {this.customIcon = Icon(Icons.search);
                        this.customSearchBar = Text('ChatApp');}
                    });
                  },
                  icon: customIcon
              )
            ],

            toolbarHeight: 140,
            backgroundColor: Colors.cyan[700],

            bottom: TabBar(

              isScrollable: true,
              indicatorColor: SecondaryColor,

              indicatorWeight: 5.0,
              onTap: (index) {},
              tabs: <Widget>[
                Tab(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    child: Icon(Icons.loop, size: 35),
                  ),
                ),

                Tab(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    child: Icon(Icons.people, size: 35),
                  ),
                ),

                Tab(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    child: Icon(Icons.person_add, size: 35),
                  ),
                ),

                Tab(child: Container(
                    padding: EdgeInsets.all(13),
                    child: Icon(Icons.call, size: 35,),
                  ))
              ],
            ),
          ),

          drawer: Drawer(child: Container(color: SecondaryColor,
              child: ListView(children: <Widget>[
                  DrawerHeader(decoration: BoxDecoration(
                          boxShadow:  [BoxShadow(
                            color: Colors.cyan[600],blurRadius: 40.0,
                            offset: Offset(1.0, 1.0,),)],
                          gradient: LinearGradient(colors: <Color>[
                            Colors.cyan[200],
                            Colors.cyan[600]
                          ])
                      ),
                      child: Row(

                        children: <Widget>[

                          Align(
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(photoUrl
                              ) ,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),

                          Align(
                            alignment: Alignment.center,
                            child: Text( name
                              , style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),

                  SizedBox(height: 15),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan[700],
                            blurRadius: 40.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(100.0),),
                        gradient: LinearGradient(colors: <Color>[
                          Colors.cyan[200],
                          Colors.cyan[400]
                        ]),
                      ),

                      child: ListTile(title: Text('Profile', style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      ),
                        leading: Icon(Icons.more),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan[700],
                            blurRadius: 40.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(100.0),),
                        gradient: LinearGradient(colors: <Color>[
                          Colors.cyan[200],
                          Colors.cyan[400]
                        ]),
                      ),

                      child: ListTile(title: Text('Notifications', style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),),
                        leading: Icon(Icons.notifications),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan[700],
                            blurRadius: 40.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(100.0),),
                        gradient: LinearGradient(colors: <Color>[
                          Colors.cyan[200],
                          Colors.cyan[400]
                        ]),
                      ),
                      child: ListTile(title: Text('Settings', style: TextStyle(

                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      ),
                        leading: Icon(Icons.settings),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan[700],
                          blurRadius: 40.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            2.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(100.0),),
                      gradient: LinearGradient(colors: <Color>[
                        Colors.cyan[200],
                        Colors.cyan[400]
                      ]),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        //final action = await Dialogs.yesAbortDialog(context, 'Exit Alert', 'Are you sure you want to Exit?');
                      },
                      child: ListTile(title: Text('Exit', style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),),
                        leading: Icon(Icons.exit_to_app,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          body: TabBarView(
              children: <Widget>[]),
        ),
      ),
    );
  }
}
