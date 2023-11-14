import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/screens/profile_screen.dart';
import 'package:chat_app/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // For SToring all User
  List<ChatUser> _list = [];
  // For storing search items
  final List<ChatUser> _searchList = [];
  // for storing search status
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();


    // For Updating active status according to lifecycle events
    SystemChannels.lifecycle.setMessageHandler((message) {
      if (APIs.auth.currentUser != null) {
        // Resume -- active or online
        if (message.toString().contains('resume')) {
          APIs.updateActiveStatus(true);
        }
        // pause -- inactive or ofline
        if (message.toString().contains('pause')) {
          APIs.updateActiveStatus(false);
        }
      }
      return Future.value(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        // For Doing single back from search screen
        onWillPop: () {
          if (_isSearching) {
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(CupertinoIcons.home),
            centerTitle: true,
            title: _isSearching
                ? TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name, Email, ...',
                    ),
                    autofocus: true,
                    style: TextStyle(fontSize: 18, letterSpacing: 0.5),
                    // When search text changes then updated search List
                    onChanged: (value) {
                      // SEarch Logic Here
                      _searchList.clear();
                      for (var i in _list) {
                        if (i.name
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            i.email
                                .toLowerCase()
                                .contains(value.toLowerCase())) {
                          _searchList.add(i);
                        }
                        setState(() {
                          _searchList;
                        });
                      }
                    },
                  )
                : Text("Baat-Chit"),
            actions: [
              // Search User Icon
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                  icon: Icon(_isSearching
                      ? CupertinoIcons.clear_circled_solid
                      : CupertinoIcons.search)),
              // user profile
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            user: APIs.me,
                          ),
                        ));
                  },
                  icon: Icon(Icons.more_vert))
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 10),
            child: FloatingActionButton(
              onPressed: () async {
                // await APIs.auth.signOut();
                // await GoogleSignIn().signOut();
              },
              child: Icon(CupertinoIcons.chat_bubble),
            ),
          ),
          body: StreamBuilder(
              stream: APIs.getAllUsers(),
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
                    _list = data
                            ?.map((e) => ChatUser.fromJson(e.data()))
                            .toList() ??
                        [];
                    if (_list.isNotEmpty) {
                      return ListView.builder(
                        padding: EdgeInsets.only(top: mq.height * .01),
                        itemCount:
                            _isSearching ? _searchList.length : _list.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => ChatUserCard(
                            user: _isSearching
                                ? _searchList[index]
                                : _list[index]),
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
        ),
      ),
    );
  }
}
