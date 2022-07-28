import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/image_search_app/api/video_api.dart';
import 'package:flutter_pr_guide/image_search_app/model/video.dart';
import 'package:flutter_pr_guide/image_search_app/ui/video_search/components/video_thumbnail.dart';
import 'package:flutter_pr_guide/image_search_app/ui/video_search_detail/video_search_detail_screen.dart';

class VideoSearchScreen extends StatefulWidget {
  const VideoSearchScreen({Key? key}) : super(key: key);

  @override
  State<VideoSearchScreen> createState() => _VideoSearchScreenState();
}

class _VideoSearchScreenState extends State<VideoSearchScreen> {
  final _videoApi = VideoApi();
  final _controller = TextEditingController();

  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _query = _controller.text;
                });
              },
              child: const Icon(Icons.search),
            ),
            hintText: '검색어를 입력하세요',
          ),
        ),
      ),
      body: FutureBuilder<List<Video>>(
        future: _videoApi.getVideos(_query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('에러!!!'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('검색 결과 : 0'));
          }

          final videos = snapshot.data!;

          return GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: videos
                .map((Video video) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PlayVideoScreen(video: video)),
                        );
                      },
                      child: VideoThumbnail(video: video),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
