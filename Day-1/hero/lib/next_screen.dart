import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Hero(
                  tag: 'Hero Animation',
                  child: Image.network('https://picsum.photos/250?image=9')),
            ),
          )
        ],
      ),
    );
  }
}
