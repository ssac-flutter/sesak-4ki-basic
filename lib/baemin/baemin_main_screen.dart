import 'package:flutter/material.dart';

class BaeminMainScreen extends StatelessWidget {
  const BaeminMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5EBEBB),
        leading: const Icon(Icons.account_tree_outlined),
        title: const Text('경기 안양시 동안구 동편로 1...'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color(0xFF5EBEBB),
            ),
            height: 50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Container(),
                ),
              ),
              Flexible(
                child: Card(
                  child: Container(
                    color: Colors.redAccent,
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('aaa'),
                              Text('aaa'),
                              Text('aaa'),
                            ],
                          ),
                        ),
                      ),
                      Image.network(
                        'https://e7.pngegg.com/pngimages/825/741/png-clipart-kakaotalk-kakao-friends-sticker-iphone-iphone-electronics-smiley.png',
                        width: 100,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                    child: Text(
                      '4 / 6 모두보기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Column(
                      children: const [
                        Icon(Icons.access_time_filled),
                        Text('aaaa'),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: Column(
                      children: const [
                        Icon(Icons.access_time_filled),
                        Text('aaaa'),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: Column(
                      children: const [
                        Icon(Icons.access_time_filled),
                        Text('aaaa'),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: Column(
                      children: const [
                        Icon(Icons.access_time_filled),
                        Text('aaaa'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
