import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.avatarUrl,
    required this.nickname,
    required this.statusMessage,
  }) : super(key: key);

  final String avatarUrl;
  final String nickname;
  final String statusMessage;

  @override
  Widget build(BuildContext context) {
    return _buildProfile();
  }

  Widget _buildProfile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(nickname),
      subtitle: Text(statusMessage),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
