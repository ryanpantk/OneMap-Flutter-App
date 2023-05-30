import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/screens/search_screen.dart';

const startAlignment = Alignment.topCenter;
const endAlignment = Alignment.bottomCenter;

void main() {
  runApp(PostalCodeApp());
}

class PostalCodeApp extends StatelessWidget {
  PostalCodeApp({super.key});

  final Styles styles = const Styles();
  final Widget homeScreen = SearchScreen();

  @override
  Widget build(context) {
    return GetMaterialApp(
      title: 'Postal Code Finder',
      theme: ThemeData(
        primarySwatch: styles.mainColorSwatch,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(body: homeScreen),
    );
  }
}
