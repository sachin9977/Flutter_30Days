import 'package:flutter/material.dart';
import 'package:hero/next_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        shadowColor: Colors.black,
        title: const Text("Hero Animation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NextScreen();
              })),
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
