import 'package:flutter/material.dart';

class ComponentExam extends StatelessWidget {
  const ComponentExam({Key? key}) : super(key: key);

  // 요것도 괜찮아요~ 이 파일 안에서만 쓸 수 있다
  Widget _buildProfie(String imageUrl, String name) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Text(name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('컴포넌트 분리 예제'),
      ),
      body: Column(
        children: [
          Profile(
            'https://cdnimg.melon.co.kr/cm2/album/images/105/54/246/10554246_20210325161233_500.jpg?304eb9ed9c07a16ec6d6e000dc0e7d91',
            '아이유',
          ),
          Profile(
            'https://img1.daumcdn.net/thumb/C500x500/?fname=http://t1.daumcdn.net/brunch/service/user/6qYm/image/eAFjiZeA-fGh8Y327AH7oTQIsxQ.png',
            '홍길동',
          ),
        ],
      ),
    );
  }
}

// 아무데서나 쓸 수 있다
class Profile extends StatelessWidget {
  final String imageUrl;
  final String name;

  const Profile(this.imageUrl, this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Text(name),
      ],
    );
  }
}
