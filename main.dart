import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setelah_get_x/Home_Screen.dart';
import 'package:project_setelah_get_x/list_Screen.dart';
import 'inDec_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: ()=>MyApp()),
        GetPage(name: "/indec", page: ()=>InDecScreen()),
        GetPage(name: "/listsc", page: ()=>ListScreen()),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}
