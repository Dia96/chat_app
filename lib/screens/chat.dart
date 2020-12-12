import 'dart:async';
import 'dart:io';
import 'package:chat_app/home/homescreen.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser currentUser = ChatUser(name: name, avatar: photoUrl);

  final ChatUser otherUser = ChatUser(name: name);

  List<ChatMessage> messages = List<ChatMessage>();
  var m = List<ChatMessage>();
  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void systemMessage() {Timer(Duration(milliseconds: 300), () {
      if (i < 6) {setState(() {messages = [...messages, m[i]];});i++;}
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState.scrollController..animateTo(
            _chatViewKey.currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut, duration: const Duration(milliseconds: 300),
          );});
    });
  }

  void onSend(ChatMessage message) async {print(message.toJson());
    var documentReference = FirebaseFirestore.instance.collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.set(documentReference, message.toJson(),);});
  }

  @override
  Widget build(BuildContext context) {return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Scaffold(endDrawer:Drawer(child: Container(color: Colors.cyan[100],
            child: ListView(children: <Widget>[
                DrawerHeader(decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.cyan[700], blurRadius: 30.0,
                    offset: Offset(15.0, 15.0,),)],
                    gradient: LinearGradient(colors: <Color>[
                      Colors.cyan[200], Colors.cyan[600]])),
                    child: Stack(children: <Widget>[
                      Align(alignment: Alignment.center,
                          child: CircleAvatar(radius: 40,
                            backgroundImage: NetworkImage(photoUrl),),),],)
                ),

                SizedBox(height: 15),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan[800],
                        blurRadius: 30.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          15.0,
                          15.0,
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
                    hoverColor: Colors.red,
                    focusColor: Colors.cyan,

                    title: Text('Contact Info', style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan[800],
                        blurRadius: 30.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          15.0,
                          15.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100.0),),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.cyan[200],
                      Colors.cyan[400]
                    ]),
                  ),
                  child: ListTile(title: Text('Shared Media', style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                  ),
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan[800],
                        blurRadius: 30.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          15.0,
                          15.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100.0),),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.cyan[200],
                      Colors.cyan[400]
                    ]),

                  ),
                  child: ListTile(title: Text('Report User', style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),),
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan[800],
                        blurRadius: 30.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          15.0,
                          15.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100.0),),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.cyan[200],
                      Colors.cyan[400]
                    ]),

                  ),
                  child: LiteRollingSwitch(
                    value: true,
                    textOn: 'Hide',
                    textOff: 'Show',
                    colorOn: Colors.greenAccent,
                    colorOff: Colors.cyan[600],
                    iconOn: FontAwesomeIcons.eyeSlash,
                    iconOff: FontAwesomeIcons.eye,
                    textSize: 18.0,
                    onChanged: (bool position) {},
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan[800],
                        blurRadius: 30.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          15.0,
                          15.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100.0),),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.cyan[200],
                      Colors.cyan[400]
                    ]),
                  ),
                  child: LiteRollingSwitch(
                    value: false,
                    textOn: 'Unmute',
                    textOff: 'Mute',
                    colorOn: Colors.greenAccent,
                    colorOff: Colors.cyan[600],
                    iconOn: FontAwesomeIcons.bell,
                    iconOff: FontAwesomeIcons.bellSlash,
                    textSize: 18.0,
                    onChanged: (bool position) {},
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan[800],
                        blurRadius: 30.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          15.0,
                          15.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100.0),),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.cyan[200],
                      Colors.cyan[400]
                    ]),
                  ),
                  child: LiteRollingSwitch(
                    value: false,
                    textOn: 'Unblock',
                    textOff: 'Block',
                    colorOn: Colors.greenAccent,
                    colorOff: Colors.cyan[600],
                    iconOn: FontAwesomeIcons.circle,
                    iconOff: Icons.block,
                    textSize: 18.0,
                    onChanged: (bool position) {},
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          shadowColor: Colors.cyan,
          backgroundColor: PrimaryColor,
          elevation: 10,
          title: Text(name),
          leading: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new CircleAvatar(
              backgroundImage: NetworkImage(photoUrl),
            ),
          ),

        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('messages').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                );
              } else {
                List<DocumentSnapshot> items = snapshot.data.documents;
                var messages =
                items.map((i) => ChatMessage.fromJson(i.data())).toList();
                return Container(
                  color: SecondaryColor,
                  child: DashChat(
                    key: _chatViewKey,
                    inverted: false,
                    onSend: onSend,
                    sendOnEnter: true,
                    textInputAction: TextInputAction.send,
                    //user: user,
                    user: currentUser,
                    inputDecoration:
                    InputDecoration.collapsed(hintText: 'Type a message'),
                    dateFormat: DateFormat('yyyy-MMM-dd'),
                    timeFormat: DateFormat('HH:mm'),
                    messages: messages,
                    showUserAvatar: true,
                    showAvatarForEveryMessage: false,
                    scrollToBottom: true,
                    onPressAvatar: (ChatUser user) {
                      print("OnPressAvatar: ${user.name}");
                    },
                    onLongPressAvatar: (ChatUser user) {
                      print("OnLongPressAvatar: ${user.name}");
                    },
                    inputMaxLines: 5,
                    messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                    alwaysShowSend: true,
                    inputTextStyle: TextStyle(fontSize: 16.0),
                    inputContainerStyle: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      color: PrimaryColor,
                    ),
                    onQuickReply: (Reply reply) {
                      setState(() {
                        messages.add(ChatMessage(
                            text: reply.value,
                            createdAt: DateTime.now(),
                            user: currentUser));

                        messages = [...messages];
                      });

                      Timer(Duration(milliseconds: 300), () {
                        _chatViewKey.currentState.scrollController
                          ..animateTo(
                            _chatViewKey.currentState.scrollController.position
                                .maxScrollExtent,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );

                        if (i == 0) {
                          systemMessage();
                          Timer(Duration(milliseconds: 600), () {
                            systemMessage();
                          });
                        } else {
                          systemMessage();
                        }
                      });
                    },
                    onLoadEarlier: () {
                      print("laoding...");
                    },
                    shouldShowLoadEarlier: false,
                    showTraillingBeforeSend: true,
                    trailing: <Widget>[
                      IconButton(
                        icon: Icon(Icons.photo),
                        onPressed: () async {
                          File result = await ImagePicker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 80,
                            maxHeight: 400,
                            maxWidth: 400,
                          );

                         /* if (result != null) {
                            final StorageReference storageRef = FirebaseStorage.instance.ref().child("chat_images");
                            StorageUploadTask uploadTask = storageRef.putFile(
                              result,
                              StorageMetadata(contentType: 'image/jpg',),);
                            StorageTaskSnapshot download = await uploadTask.onComplete;*/

                           // String url = await download.ref.getDownloadURL();

                            ChatMessage message =
                            ChatMessage(text: "", user: currentUser, );

                            var documentReference = FirebaseFirestore.instance
                                .collection('messages')
                                .doc(DateTime.now()
                                .millisecondsSinceEpoch
                                .toString());

                            FirebaseFirestore.instance.runTransaction((transaction) async {
                               transaction.set(
                                documentReference,
                                message.toJson(),
                              );
                            });
                          }

                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
