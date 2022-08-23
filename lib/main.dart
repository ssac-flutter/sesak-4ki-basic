import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/exchange_app/exchange_app_view_model.dart';
import 'package:flutter_pr_guide/image_search_app/color_schemes.g.dart';
import 'package:flutter_pr_guide/image_search_app/ui/image_search/image_search_view_model.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_screen.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_view_model.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// 사소한 무언가
// 어쩌구 저쩌구
// 수정!!!
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImageSearchViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => ExchangeAppViewModel(),
        child: const MainScreen(),
      ),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카운터'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                count--;
              });
            },
            icon: const Icon(Icons.exposure_minus_1),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                count = count - 2;
              });
            },
            icon: const Icon(Icons.exposure_minus_2),
          ),
        ],
      ),
      body: Center(
        child: _buildText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increase,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildText() {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    return Text(
      '$count',
      style: const TextStyle(fontSize: 80),
    );
  }

  Future<void> increase() async {
    setState(() {
      isLoading = true;
    });
    print('click');

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      count++;
      isLoading = false;
    });
  }
}

class YourExLife extends StatefulWidget {
  const YourExLife({Key? key}) : super(key: key);

  @override
  State<YourExLife> createState() => _YourExLifeState();
}

class _YourExLifeState extends State<YourExLife> {
  // var rnd = Random();
  int randomNumber = 0;
  bool isLoading = false;
  List myList = ['홍길동', '유비', '관우', '장비', '여포'];

  String? name; // null

  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 서버
    getName().then((value) => name = value);
  }

  Future<String> getName() async {
    await Future.delayed(Duration(seconds: 2));
    return '홍길동';
  }

  @override
  void dispose() {
    myController.dispose();

    super.dispose();
    print('dispose');

    String num = 10.toString();
    double d = 10.toDouble();

    int i = int.parse(num);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant YourExLife oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("전생앱"),
      ),
      body: name == null ? CircularProgressIndicator() : Text(name!),
    );
  }

  Widget showText() {
    return const Text(
      "당신의 전생은",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget randomButton() {
    return ElevatedButton(
      onPressed: () {
        setLoading();
      },
      child: const Text("전생 알아보기"),
    );
  }

  Widget showLoading() {
    if (isLoading) {
      return const CircularProgressIndicator();
    } else {
      return Text('${myList[randomNumber]}');
    }

    ElevatedButton(
      onPressed: () {},
      child: null,
    );
  }

  Future setLoading() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      Future.delayed(Duration(seconds: 1), () {});
      isLoading = false;
      // randomnumber = rnd.nextInt(3);
      randomNumber = Random().nextInt(myList.length); // 0 ~ 3
      Person person = Person();
    });
  }
}

class Person extends Object {
  void getName() {}
}
