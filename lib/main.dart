import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postal_code_finder/screens/search_screen.dart';

const startAlignment = Alignment.topCenter;
const endAlignment = Alignment.bottomCenter;

void main() {
  runApp(const PostalCodeApp());
}

class PostalCodeApp extends StatelessWidget {
  const PostalCodeApp({super.key});

  final Widget homeScreen = const SearchScreen();

  @override
  Widget build(context) {
    return GetMaterialApp(
      title: 'Postal Code Finder',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(body: homeScreen),
    );
  }
}
