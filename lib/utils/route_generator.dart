import 'package:desa_getasan_app/screen/add_product.dart';
import 'package:desa_getasan_app/screen/announcement_detail.dart';
import 'package:desa_getasan_app/screen/change_password.dart';
import 'package:desa_getasan_app/screen/complaint_page.dart';
import 'package:desa_getasan_app/screen/detail_market.dart';
import 'package:desa_getasan_app/screen/error_page.dart';
import 'package:desa_getasan_app/screen/index.dart';
import 'package:desa_getasan_app/screen/login.dart';
import 'package:desa_getasan_app/screen/market.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments as dynamic;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/home':
      // return PageRouteBuilder(
      //   pageBuilder: (context, animation, secondaryAnimation) => 
      //     const Index(), 
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) => 
      //       FadeTransition(opacity: animation, child: child)
      // );
        return MaterialPageRoute(builder: (context) => const Index());
      case '/market':
        return MaterialPageRoute(builder: (context) => MarketPage(userProduct: args));
      case '/detailMarket':
        return MaterialPageRoute(builder: (context) => DetailMarketPage(umkm: args));
      case '/complaint':
        return MaterialPageRoute(builder: (context) => const ComplaintPage());
      case '/addProduct':
        return MaterialPageRoute(builder: (context) => const AddProductPage());
      case '/announcementDetail':
        return MaterialPageRoute(builder: (context) => const DetailAnnoncement());
      case '/changePassword':
        return MaterialPageRoute(builder: (context) => const ChangePasswordPage());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }


  }

}