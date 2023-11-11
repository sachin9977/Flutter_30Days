import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile Screen"),
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
      body: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * .3),
              child: CachedNetworkImage(
                width: mq.height * .055,
                height: mq.height * .055,
                imageUrl: widget.user.image,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => CircleAvatar(
                  child: Icon(CupertinoIcons.person),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
