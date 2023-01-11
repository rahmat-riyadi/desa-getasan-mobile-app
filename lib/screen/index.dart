import 'package:desa_getasan_app/components/bottomNav.dart';
import 'package:desa_getasan_app/screen/home.dart';
import 'package:desa_getasan_app/screen/mailManagement.dart';
import 'package:desa_getasan_app/screen/profil.dart';
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNav(),
        body: TabBarView(
          children: [
            Home(),
            MailManagement(),
            Profil()
          ]
        )
      ),
    );
  }
}

