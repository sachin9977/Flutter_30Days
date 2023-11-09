import 'package:data_flow_routing/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 6,
          shadowColor: Colors.black,
          title: const Text(
            "Data Flow Routing",
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () => _navigate(context),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal)),
              child: const Text(
                "Go To Second Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Function for sending data forward & backward
Future<void> _navigate(BuildContext context) async {
  // here we are storing the value which we are receiving from second screen (OnPop)
  final result = await Navigator.push(
    context,
// We are sending data to second Screen
    MaterialPageRoute(
        builder: (context) => const SecondScreen(
              s: 'Data Returning Page',
            )),
  );
  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
        // Here we are handling null value
        SnackBar(
            content: result != null
                ? Text('$result')
                : const Text("Not selected any option")));
}
