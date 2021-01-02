import 'package:chat_app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}
class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> getPages() {
      return [
        PageViewModel(
          decoration: PageDecoration(pageColor: Colors.white),
          image: Image.asset('images/chatcommunication.png', fit: BoxFit.fill),
          title: 'Connect with people from all around the World',
          body: 'Chat instantly'),

        PageViewModel(
          decoration: PageDecoration(pageColor: Colors.lightGreenAccent[100]),
          image: Image.asset('images/locationshare.jpg', fit: BoxFit.fill),
          title: 'Know location of your friends',
          body: 'Share your location with others'),

        PageViewModel(
          decoration: PageDecoration(pageColor: Colors.cyan[700]),
          image: Image.asset('images/shareimage.png', fit: BoxFit.fill),
          title: 'Share photos, videos and many more in one go',
          body: 'Lets Dive'),
      ];
    }

    return Scaffold(
      body: IntroductionScreen(
        skip: Text('Skip',style: TextStyle(color: Colors.black)),
        done: Text('Done', style: TextStyle(color: Colors.black)),
        onDone: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        pages: getPages(),
        globalBackgroundColor: Colors.white,
        showSkipButton: true,
      ),
    );
  }
}