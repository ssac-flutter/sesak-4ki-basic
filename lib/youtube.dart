import 'package:flutter/material.dart';

class Youtubu extends StatelessWidget {
  const Youtubu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('aa', style: TextStyle(fontSize: 200),),
            Text('aa', style: TextStyle(fontSize: 200),),
            Text('aa', style: TextStyle(fontSize: 200),),
            Text('aa', style: TextStyle(fontSize: 200),),
          ],
        ),
      ),
    );
  }
}
