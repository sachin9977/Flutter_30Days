import 'package:flutter/material.dart';
import 'package:rounting/detailed.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        shadowColor: Colors.black,
        title: const Text("HomePage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // This is Called Anonymous routes
          Center(
              child: TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailedPage(),
                  ));
            },
            child: const Text("Anonymous routes"),
          )),
          // This is Called Named routes
          Center(
              child: TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey)),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/details',
              );
            },
            child: const Text("Named routes"),
          )),
          // This is Called OnGenerate routes
          Center(
              child: TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey)),
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
            child: const Text("OnRoute Generate"),
          )),
        ],
      ),
    );
  }
}
