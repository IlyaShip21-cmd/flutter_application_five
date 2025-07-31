import 'package:flutter/material.dart';
import 'package:flutter_application_universities/widgets/find_university_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'University guide',
      home: FindUniversityScreen(),
    );
  }
}
