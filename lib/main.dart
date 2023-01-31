import 'package:chat_app/model/avatar.dart';
import 'package:chat_app/ui/view/home_page.dart';
import 'package:chat_app/view_model/avatar_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final me = Avatar(
      url: 'https://avatars.githubusercontent.com/u/16812446?v=4',
      nickname: 'Johnny',
      statusMessage: '상태 메시지',
    );

    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChangeNotifierProvider.value(
        value: AvatarModel(me),
        child: HomePage(
          me: me,
        ),
      ),
    );
  }
}
