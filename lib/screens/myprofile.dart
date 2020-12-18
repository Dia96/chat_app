import 'package:chat_app/home/homescreen.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}
class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      child: Scaffold(backgroundColor: SecondaryColor,
        body: CustomScrollView(slivers: [
          SliverAppBar(leading: Builder( builder: (BuildContext context) {
            return IconButton(icon: const Icon(Icons.arrow_back),
              onPressed: () {Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => HomeScreen()));
                  });
              }),
            backgroundColor: PrimaryColor, expandedHeight: 300,
            pinned: true, floating: true,
            flexibleSpace: FlexibleSpaceBar(title: Text('My Profile'),
              background: Image.network(photoUrl, fit: BoxFit.fill))),
            SliverList(delegate: SliverChildListDelegate(<Widget>[
              SizedBox(height: 50),
              Slidable(actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25, child: Container(height: 60,
                    margin: EdgeInsets.only(left: 20, right: 100),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.cyan[700], blurRadius: 40.0,
                        spreadRadius: 1.0, offset: Offset(2.0, 2.0))],
                      borderRadius: BorderRadius.all(Radius.circular(100.0),),
                      gradient: LinearGradient(colors: <Color>[
                        Colors.cyan[200], Colors.cyan[400]])),
                    child: ListTile(trailing: Icon(Icons.slideshow),
                      leading: Icon(FontAwesomeIcons.slidersH),
                      title: Text('User Id',style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ),
                        textAlign: TextAlign.center),
                      subtitle: Text(name, style:
                      TextStyle(fontSize: 15.0), textAlign: TextAlign.center))),

                secondaryActions: <Widget>[IconSlideAction(caption: 'Edit',
                  color: PrimaryColor, icon: Icons.mode_edit,
                  onTap: () {},
                )]),
              SizedBox(height: 30),
              Slidable(actionPane: SlidableDrawerActionPane(),actionExtentRatio: 0.25,
                child: Container(height: 60, margin: EdgeInsets.only(left: 100, right: 20),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.cyan[700], blurRadius: 40.0,
                        spreadRadius: 1.0,
                        offset: Offset(2.0, 2.0))],
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      gradient: LinearGradient(colors: <Color>[
                        Colors.cyan[200], Colors.cyan[400]])),
                    child: ListTile(leading: Icon(Icons.slideshow), trailing: Icon(FontAwesomeIcons.slidersH),
                      title: Text('Email Id',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                        subtitle: Text(email, style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center))),
                actions: <Widget>[IconSlideAction(caption: 'Edit', color: PrimaryColor, icon: Icons.mode_edit)]),
              SizedBox(height: 30),
              Slidable(actionPane: SlidableDrawerActionPane(), actionExtentRatio: 0.25,
                child: Container(height: 60, margin: EdgeInsets.only(left: 20, right: 100),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.cyan[700], blurRadius: 40.0, spreadRadius: 1.0, offset: Offset(2.0, 2.0))],
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      gradient: LinearGradient(colors: <Color>[Colors.cyan[200], Colors.cyan[400]])),
                    child: ListTile(trailing: Icon(Icons.slideshow), leading: Icon(FontAwesomeIcons.slidersH),
                      title: Text('Contact Info',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ),
                        textAlign: TextAlign.center),
                      subtitle: Text('9876543210', style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center))),

                  secondaryActions: <Widget>[IconSlideAction(caption: 'Edit', color: PrimaryColor,
                  icon: Icons.mode_edit,
                  onTap: () {},
                  )]),

              SizedBox(height: 30),
              Slidable(actionPane: SlidableDrawerActionPane(), actionExtentRatio: 0.25,
                child: Container(height: 60, margin: EdgeInsets.only(left: 100, right: 20),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.cyan[700], blurRadius: 40.0, spreadRadius: 1.0,
                        offset: Offset(2.0, 2.0))],
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      gradient: LinearGradient(colors: <Color>[Colors.cyan[200], Colors.cyan[400]])),
                    child: ListTile(leading: Icon(Icons.slideshow), trailing: Icon(FontAwesomeIcons.slidersH),
                      title: Text('Bio',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                      subtitle: Text('Anything about me', style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center))),
                actions: <Widget>[IconSlideAction(caption: 'Edit', color: PrimaryColor, icon: Icons.mode_edit)]),
              SizedBox(height: 30),
              Slidable(actionPane: SlidableDrawerActionPane(), actionExtentRatio: 0.25,
                child: Container(height: 60, margin: EdgeInsets.only(left: 20, right: 100),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.cyan[700], blurRadius: 40.0, spreadRadius: 1.0, offset: Offset(2.0, 2.0))],
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      gradient: LinearGradient(colors: <Color>[Colors.cyan[200], Colors.cyan[400]])),
                    child: ListTile(trailing: Icon(Icons.slideshow), leading: Icon(FontAwesomeIcons.slidersH),
                      title: Text('Gender',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ),
                        textAlign: TextAlign.center),
                      subtitle: Text('Prefer not to say', style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center))),

                secondaryActions: <Widget>[IconSlideAction(caption: 'Edit', color: PrimaryColor, icon: Icons.mode_edit,
                    onTap: () {},
                  )]),

              SizedBox(height: 30),
              Slidable(actionPane: SlidableDrawerActionPane(), actionExtentRatio: 0.25,
                child: Container(height: 60, margin: EdgeInsets.only(left: 100, right: 20),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.cyan[700], blurRadius: 40.0, spreadRadius: 1.0, offset: Offset(2.0, 2.0))],
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      gradient: LinearGradient(colors: <Color>[Colors.cyan[200], Colors.cyan[400]])),
                    child: ListTile(leading: Icon(Icons.slideshow), trailing: Icon(FontAwesomeIcons.slidersH),
                      title: Text('Date of birth',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ),
                        textAlign: TextAlign.center),
                      subtitle: Text('01/01/0001', style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center))),
                actions: <Widget>[IconSlideAction(caption: 'Edit', color: PrimaryColor, icon: Icons.mode_edit)]),
              SizedBox(height: 30),
              Slidable(actionPane: SlidableDrawerActionPane(), actionExtentRatio: 0.25,
                child: Container(height: 60, margin: EdgeInsets.only(left: 20, right: 100),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.cyan[700], blurRadius: 40.0, spreadRadius: 1.0, offset: Offset(2.0, 2.0))],
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      gradient: LinearGradient(colors: <Color>[Colors.cyan[200], Colors.cyan[400]])),
                    child: GestureDetector(
                      onTap: () {},
                      child: ListTile(trailing: Icon(Icons.slideshow), leading: Icon(FontAwesomeIcons.slidersH),
                        title: Text('Invite your friends',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ),
                          textAlign: TextAlign.center),
                        subtitle: Text('Share and Invite', style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center)))),
                actions: <Widget>[],
                secondaryActions: <Widget>[IconSlideAction(caption: 'Share', color: PrimaryColor, icon: Icons.share,
                  onTap: () {},
                  )]),
              SizedBox(height: 200)]))]),
      ));
  }}