import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:unmute/views/otherscreens/player_screen.dart';

import 'views/homescreens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
