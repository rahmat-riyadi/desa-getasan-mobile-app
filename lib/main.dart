import 'package:desa_getasan_app/screen/index.dart';
import 'package:desa_getasan_app/screen/login.dart';
import 'package:desa_getasan_app/screen/market.dart';
import 'package:desa_getasan_app/screen/splash.dart';
import 'package:desa_getasan_app/screen/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.plusJakartaSansTextTheme()
        ),
        title: 'Desa Getasan',
        home: const MarketPage()
      ),
    );
  }
}
