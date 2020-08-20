import 'package:cinema_ticket_app/screens/home_screen.dart';
import 'package:cinema_ticket_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Ticket App',
      theme: ThemeData(
        primaryColor: kColorPinkEnd,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: HomeScreen(),
    );
  }
}
