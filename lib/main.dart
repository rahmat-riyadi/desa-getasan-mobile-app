import 'package:desa_getasan_app/l10n/l10n.dart';
import 'package:desa_getasan_app/screen/add_product.dart';
import 'package:desa_getasan_app/screen/announcement_detail.dart';
import 'package:desa_getasan_app/screen/complaint_page.dart';
import 'package:desa_getasan_app/screen/detail_market.dart';
import 'package:desa_getasan_app/screen/index.dart';
import 'package:desa_getasan_app/screen/login.dart';
import 'package:desa_getasan_app/screen/market.dart';
import 'package:desa_getasan_app/screen/welcome_screen.dart';
import 'package:desa_getasan_app/services/agenda_service.dart';
import 'package:desa_getasan_app/services/announcement_service.dart';
import 'package:desa_getasan_app/services/complaint_service.dart';
import 'package:desa_getasan_app/services/umkm_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AnnouncementService()),
          RepositoryProvider(create: (context) => UmkmService()),
          RepositoryProvider(create: (context) => AgendaService()),
          RepositoryProvider(create: (context) => ComplaintService())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          routes: {
            '/login' : (context) => const LoginPage(),
            '/home': (context) => const Index(),
            '/market' :(context) => const MarketPage(),
            '/detailMarket' :(context) => const DetailMarketPage(),
            '/complaint' :(context) => ComplaintPage(),
            '/addProduct' :(context) => const AddProductPage(),
            '/announcementDetail' :(context) => const DetailAnnoncement(),
          },
          theme: ThemeData(
            textTheme: GoogleFonts.plusJakartaSansTextTheme()
          ),
          title: 'Desa Getasan',
          home: const WelcomeScreen()
        ),
      ),
    );
  }
}
