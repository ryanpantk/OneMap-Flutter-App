import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postal_code_finder/screens/search_screen.dart';

const startAlignment = Alignment.topCenter;
const endAlignment = Alignment.bottomCenter;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Widget searchScreen = const SearchScreen();

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(body: searchScreen),
    );
  }
}
