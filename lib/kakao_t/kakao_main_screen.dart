import 'package:flutter/material.dart';

class KakaoMainScreen extends StatefulWidget {
  const KakaoMainScreen({Key? key}) : super(key: key);

  @override
  State<KakaoMainScreen> createState() => _KakaoMainScreenState();
}

class _KakaoMainScreenState extends State<KakaoMainScreen> {
  int _selectedIndex = 0;

  final screens = [
    Text('1', style: TextStyle(fontSize: 40)),
    Text('2', style: TextStyle(fontSize: 40)),
    Text('3', style: TextStyle(fontSize: 40)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카카오 T'),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '이용 서비스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: '내 정보',
          ),
        ],

      ),
    );
  }
}
