import 'package:chat_app/model/avatar.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  ProfileDetail({
    Key? key,
    required this.user,
    required this.isExpanded,
    required this.onClose,
  }) : super(key: key);

  final Avatar? user;
  final bool isExpanded;
  final VoidCallback onClose;

  late final double _width;
  late final double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return _buildProfileDetail();
  }

  // 1. Profile onTap 이벤트 발생
  // 2. ViewModel을 통해 상태를 갱신 (Notifying)
  // 3. home_page 리빌드 (Listener)
  // 4. profile_detail 빌드
  // 5. 애니메이션 처리
  Widget _buildProfileDetail() {
    return AnimatedPositioned(
      top: isExpanded ? 0 : _height,
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: _width,
        height: _height,
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CloseButton(
              onPressed: onClose,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
