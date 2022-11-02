import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_music_player/src/screens/home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.amber
      ),
      home:  HomeScreen(),
    );
  }
}
