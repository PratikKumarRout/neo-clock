import 'package:flutter/material.dart';
import 'package:math_time/providers/themes_provider.dart';
import 'package:math_time/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(create: (context) => ThemesProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //this is the title
      title: "Math clock",
      //this is the theme
      theme: Provider.of<ThemesProvider>(context).themeData,
      home: HomeScreen(),
    );
  }
}
