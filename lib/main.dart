import 'package:flutter/material.dart';
import 'features/home-feature/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 239, 244, 239)
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}


