import 'package:flutter/material.dart';
import 'screens/breeds_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Breeds',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BreedsScreen(),
    );
  }
}
