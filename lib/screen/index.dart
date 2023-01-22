import 'package:desa_getasan_app/bloc/announcement_bloc.dart';
import 'package:desa_getasan_app/components/bottomNav.dart';
import 'package:desa_getasan_app/screen/home.dart';
import 'package:desa_getasan_app/screen/mailManagement.dart';
import 'package:desa_getasan_app/screen/profil.dart';
import 'package:desa_getasan_app/services/announcementService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnnouncementBloc(RepositoryProvider.of<AnnouncementService>(context))..add(LoadAnnouncementEvent()),
      child: const DefaultTabController(
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
      ),
    );
  }
}

