import 'package:chat_app/model/avatar.dart';
import 'package:chat_app/ui/widget/profile_detail.dart';
import 'package:chat_app/view_model/avatar_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/profile.dart';

class HomePage extends StatelessWidget {
  HomePage({
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
    return Stack(
      children: [
        ListView(
          children: [
            Profile(
              user: me,
              onTap: () => _onTapProfile(avatarModel, me),
            ),
            const Divider(),
            // spread 연산자를 사용하여 리스트를 펼친다.
            ...avatarModel.friends
                .map((friend) => Profile(
                      user: friend,
                      onTap: () => _onTapProfile(avatarModel, friend),
                    ))
                .toList(),
          ],
        ),
        ProfileDetail(
          // (중요) ViewModel 에서 상태를 취급하고, 각 커스텀 위젯을 stateless로 구현하여 위젯간 커플링을 제거한다.
          user: avatarModel.selectedUser,
          isExpanded: avatarModel.isExpanded,
          onClose: avatarModel.toggle,
        ),
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

  void _onTapProfile(AvatarModel avatarModel, Avatar user) {
    avatarModel.selectUser(user);
    avatarModel.toggle();
  }
}
