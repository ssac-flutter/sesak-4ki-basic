import 'package:flutter/material.dart';

class Youtubu extends StatelessWidget {
  Youtubu({Key? key}) : super(key: key);

  final items = ['홍길동', '한석봉'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder:  (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('${items[index]}');
            },
            child: Column(
              children: [
                Text('${items[index]}', style: TextStyle(fontSize: 100),),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
