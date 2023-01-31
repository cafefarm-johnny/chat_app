import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/avatar.dart';

class AvatarRepository {
  static const _gistUrl =
      "https://gist.githubusercontent.com/cafefarm-johnny/ad6ca270049e3fbd24be0cae2e20fd6d/raw/29ca0883e25f9928dfa8885db43f5908f3c57b63/chat_app_peoples_data.json";

  final friends = <Avatar>[];

  Future<List<Avatar>> fetch(Avatar me) async {
    try {
      final response = await http.get(Uri.parse(_gistUrl));
      if (response.statusCode != 200) {
        return friends;
      }

      final result = jsonDecode(response.body);
      final myFriends = result[me.nickname];

      friends.clear();

      myFriends.forEach((e) {
        final friend = Avatar.fromJson(e);
        if (friend.nickname != me.nickname) {
          friends.add(friend);
        }
      });

      return friends
        ..sort((a, b) => a.nickname?.compareTo(b.nickname ?? '') ?? 0);
    } catch (e) {
      return friends;
    }
  }
}
