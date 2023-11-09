import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  // Created constructor function for recevieng data from first screen

  const SecondScreen({super.key, required this.s});

  final String s;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 6,
        shadowColor: Colors.black,
        title: Text(
          widget.s,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // Sending data backward (on First Screen)
              Navigator.pop(context, 'Yeah!!');
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.teal)),
            child: const Text(
              "Return Yes",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                // Sending data backward (on First Screen)
                Navigator.pop(context, 'Nope!!');
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal)),
              child: const Text(
                "Return No",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
