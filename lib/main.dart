import 'package:flutter/material.dart';

//* Configs
import 'package:messaging/configs/theme/app_theme.dart';

//* Screens
import 'package:messaging/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  //#region --------------------------------- Hooks ---------------------------------

  const MyApp({super.key});

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging App',
      debugShowCheckedModeBanner: false,
      theme:
          AppTheme(themeColor: 1, themeBrightness: Brightness.light).getTheme(),
      home: const ChatScreen(),
    );
  }

  //#endregion
}
