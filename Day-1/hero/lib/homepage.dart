import 'package:flutter/material.dart';
import 'package:hero/next_screen.dart';

class Item {
  final String urlImage;
  final String title;

  Item({required this.urlImage, required this.title});
}

class HomePage extends StatelessWidget {
  final items = <Item>[
    Item(title: 'Item 1', urlImage: 'https://picsum.photos/250?image=9'),
    Item(
        title: 'Item 2',
        urlImage:
            'https://img.freepik.com/free-photo/puppy-that-is-walking-snow_1340-37228.jpg'),
    Item(
        title: 'Item 3',
        urlImage:
            'https://t3.ftcdn.net/jpg/05/93/79/50/360_F_593795007_nRQ8Z5M7xdZnT3y7YtOE8ypwexuUb6kP.jpg'),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 6,
          shadowColor: Colors.black,
          title: const Text("Hero Animation"),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextScreen(item: item),
                  )),
              child: Row(
                children: [
                  Hero(
                      transitionOnUserGestures: true,
                      tag: "image1",
                      child: buildImage(item.urlImage)),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Item ${index + 1}',
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            );
          },
        ));
  }
}

Widget buildImage(String urlImage) => Image.network(
      urlImage,
      fit: BoxFit.cover,
      width: 100,
      height: 100,
    );
