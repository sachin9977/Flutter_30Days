import 'package:flutter/material.dart';
import 'package:hero/homepage.dart';

class NextScreen extends StatefulWidget {
  final Item item;

  const NextScreen({super.key, required this.item});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
            transitionOnUserGestures: true,
            tag: widget.item,
            child: buildImage()));
  }

  Widget buildImage() => AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          widget.item.urlImage,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      );
}
