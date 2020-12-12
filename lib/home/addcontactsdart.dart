import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: PrimaryColor,
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('user').snapshots(),
            builder: (context, snapshot) {
              if ((snapshot.connectionState == ConnectionState.waiting) || (!snapshot.hasData)) {
                return Center(child: LinearProgressIndicator());
              }
              else return Container(decoration: BoxDecoration(
                  color: Colors.cyan[100]),
                child: ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                      print('NETWORK IMAGE: ' + documentSnapshot.data()['name'].toString() +
                          documentSnapshot.data()['photoUrl'].toString());
                      return Card(color: Colors.cyan[100],
                        child: ListTile(onTap: () {},
                          leading: CircleAvatar(radius: 30,
                            backgroundImage: NetworkImage(documentSnapshot.data()['photoUrl']),),
                          title: Text(documentSnapshot.data()['name']),
                          subtitle: Text(documentSnapshot.data()['email']),
                        ));
                    }).toList()
                ));
            }));
  }
}
