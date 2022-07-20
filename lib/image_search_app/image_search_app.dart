import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/mock_data/images.dart';

class ImageSearchApp extends StatefulWidget {
  const ImageSearchApp({Key? key}) : super(key: key);

  @override
  State<ImageSearchApp> createState() => _ImageSearchAppState();
}

class _ImageSearchAppState extends State<ImageSearchApp> {
  List<Map<String, dynamic>> _images = [];

  @override
  void initState() {
    super.initState();

    initData();
  }

  Future initData() async {
    _images = await getImages();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                suffixIcon: Icon(Icons.search),
                hintText: '검색어를 입력하세요',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _images.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount: _images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> image = _images[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            image['previewURL'],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getImages() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, dynamic>> hits = images['hits'];
    return hits;
  }
}
