import 'package:chat_app/model/avatar.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  final Avatar user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _buildProfile();
  }

  Widget _buildProfile() {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.url!),
        ),
        title: Text(user.nickname!),
        subtitle: Text(user.statusMessage!),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
