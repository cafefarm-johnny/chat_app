import 'package:flutter/material.dart';

import '../model/avatar.dart';
import '../repository/avatar_repository.dart';

class AvatarModel with ChangeNotifier {
  var friends = <Avatar>[];
  var isLoading = false;

  final _avatarRepository = AvatarRepository();

  // 생성자 호출 시점에 데이터를 fetch한다.
  AvatarModel(Avatar me) {
    fetch(me);
  }

  Future<void> fetch(Avatar me) async {
    isLoading = true;
    notifyListeners();

    friends = await _avatarRepository.fetch(me);

    // View에게 변경사항을 통지
    isLoading = false;
    notifyListeners();
  }
}
