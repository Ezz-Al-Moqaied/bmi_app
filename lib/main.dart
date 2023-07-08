import 'package:bmi_app/pages/InputPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff1B1E2F),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff1B1E2F), elevation: 0),
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Colors.red, secondary: Colors.yellow),
      ),
      home: InputPage(),
    );
  }
}
