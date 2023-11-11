import 'package:chat_app/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  // For Authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  // For Accessing cloud Firestore database
  static FirebaseFirestore Firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  //  For checking if user exists or not?
  static Future<bool> userExists() async {
    return (await Firestore.collection('users').doc(user.uid).get()).exists;
  }

  // For Creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUser(
        image: user.photoURL.toString(),
        about: "Hey I'm Using BaatChit",
        name: user.displayName.toString(),
        createdAt: time,
        isOnline: false,
        id: user.uid,
        lastActive: time,
        email: user.email.toString(),
        pushToken: '');

    return await Firestore.collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}
