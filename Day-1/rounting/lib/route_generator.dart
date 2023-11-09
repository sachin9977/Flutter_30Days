import 'package:flutter/material.dart';
import 'package:rounting/detailed.dart';
import 'package:rounting/home_page.dart';

// class For OnGenrator Routes

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    final args = setting.arguments;

    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        );
      case '/second':
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => const DetailedPage(),
          );
        }
        return __errorRoute();
      default:
        return __errorRoute();
    }
  }

  static Route<dynamic> __errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(child: Text("Error")),
      );
    });
  }
}
