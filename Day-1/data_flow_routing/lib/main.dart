import 'package:data_flow_routing/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
          )),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Day-1',
      home: const FirstScreen(),
    );
  }
}
