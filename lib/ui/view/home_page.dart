import 'package:chat_app/model/avatar.dart';
import 'package:chat_app/ui/widget/profile.dart';
import 'package:chat_app/view_model/avatar_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.me,
  }) : super(key: key);

  final Avatar me;

  @override
  Widget build(BuildContext context) {
    // ViewModel 에서 변경사항 통지되면 Build 사이클이 재실행된다.
    final avatarModel = Provider.of<AvatarModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Chat App'),
      ),
      body: Center(
        child: _buildBody(avatarModel),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(AvatarModel avatarModel) {
    return ListView(
      children: [
        ElevatedButton(
          onPressed: () {
            avatarModel.fetch(me);
          },
          child: const Text('새로고침'),
        ),
        Profile(
          avatarUrl: me.url!,
          nickname: me.nickname!,
          statusMessage: me.statusMessage!,
        ),
        const Divider(),
        // spread 연산자를 사용하여 리스트를 펼친다.
        ...avatarModel.friends
            .map((e) => Profile(
                  avatarUrl: e.url!,
                  nickname: e.nickname!,
                  statusMessage: e.statusMessage!,
                ))
            .toList(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
