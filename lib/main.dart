import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/pages/home_page.dart';
import 'package:todoapp/pages/task_view_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 21
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          headlineMedium: TextStyle(
            color: Colors.grey,
            fontSize: 17
          ),
          headlineSmall: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w300
          ),
          titleMedium: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w300
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: HomePage(),
    );
  }
}


