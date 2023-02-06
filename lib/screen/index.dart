import 'package:desa_getasan_app/bloc/agenda_bloc.dart';
import 'package:desa_getasan_app/bloc/announcement_bloc.dart';
import 'package:desa_getasan_app/components/bottom_nav.dart';
import 'package:desa_getasan_app/screen/home.dart';
import 'package:desa_getasan_app/screen/mail_management.dart';
import 'package:desa_getasan_app/screen/profil.dart';
import 'package:desa_getasan_app/services/agenda_service.dart';
import 'package:desa_getasan_app/services/announcement_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnnouncementBloc(RepositoryProvider.of<AnnouncementService>(context))..add(LoadAnnouncementEvent())),
        BlocProvider(create: (context) => AgendaBloc(RepositoryProvider.of<AgendaService>(context))..add(LoadAgendaEvent()))
      ],
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

