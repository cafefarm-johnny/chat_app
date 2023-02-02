import 'package:flutter/material.dart';

import '../model/avatar.dart';
import '../repository/avatar_repository.dart';

class AvatarModel with ChangeNotifier {
  var _friends = <Avatar>[];
  var _isLoading = false;

  // Profile 상세화면
  var _isExpanded = false;
  Avatar? _selectedUser;

  // 외부에서 데이터를 변경할 수 없도록 필드 정보를 캡슐화하고, getter를 제공한다.
  get friends => _friends;
  get isLoading => _isLoading;
  get isExpanded => _isExpanded;
  get selectedUser => _selectedUser;

  final _avatarRepository = AvatarRepository();

  // 생성자 호출 시점에 데이터를 fetch한다.
  AvatarModel(Avatar me) {
    fetch(me);
  }

  Future<void> fetch(Avatar me) async {
    _isLoading = true;
    notifyListeners();

    _friends = await _avatarRepository.fetch(me);

    // View에게 변경사항을 통지
    _isLoading = false;
    notifyListeners();
  }

  void selectUser(Avatar user) {
    _selectedUser = user;
    notifyListeners();
  }

  void toggle() {
    if (_isExpanded && _selectedUser != null) {
      _selectedUser = null;
    }

    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
