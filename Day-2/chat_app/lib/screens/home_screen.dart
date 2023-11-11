import 'dart:convert';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/screens/profile_screen.dart';
import 'package:chat_app/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        centerTitle: true,
        title: Text("Baat-Chit"),
        actions: [
          // Search User Icon
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          // user profile
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: list[0],),
                    ));
              },
              icon: Icon(Icons.more_vert))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          child: Icon(CupertinoIcons.chat_bubble),
        ),
      ),
      body: StreamBuilder(
          stream: APIs.Firestore.collection('users').snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(),
                );
              // TODO: Handle this case.
              case ConnectionState.active:
              // TODO: Handle this case.
              case ConnectionState.done:
                // TODO: Handle this case.

                final data = snapshot.data?.docs;
                list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
                    [];
                if (list.isNotEmpty) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: mq.height * .01),
                    itemCount: list.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ChatUserCard(user: list[index]),
                    // Text("data: ${list[index]}")
                  );
                } else {
                  return Center(
                      child: Text(
                    "No Connection Found",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ));
                }
            }
          }),
    );
  }
}
