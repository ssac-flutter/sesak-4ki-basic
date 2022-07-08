import 'package:flutter/material.dart';

class YoutubuItem extends StatelessWidget {
  final String name;

  const YoutubuItem(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/pic.jpg',
          width: 100,
          height: 100,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 100),
        ),
      ],
    );
  }
}
