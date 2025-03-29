import 'package:flutter/material.dart';
import 'package:messaging/configs/theme/app_theme.dart';

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
          AppTheme(themeColor: 6, themeBrightness: Brightness.light).getTheme(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Messaging App Bar')),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {},
            child: const Text('Click me'),
          ),
        ),
      ),
    );
  }

  //#endregion
}
