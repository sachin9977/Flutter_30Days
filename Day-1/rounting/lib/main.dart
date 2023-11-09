import 'package:flutter/material.dart';
import 'package:rounting/detailed.dart';
import 'package:rounting/home_page.dart';
import 'package:rounting/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Day-1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      initialRoute: '/',
      // For OnGenerate Routes
      onGenerateRoute: RouteGenerator.generateRoute,
      // For Named Routes
      routes: {
        '/': (context) => const MyHomePage(),
        '/details': (context) => const DetailedPage(),
      },
    );
  }
}

  // IMP -: We can not use Named Routes and OnGenerate Routes at the Same Time or In same Project.