import 'package:desa_getasan_app/bloc/user_bloc.dart';
import 'package:desa_getasan_app/l10n/l10n.dart';
import 'package:desa_getasan_app/screen/index.dart';
import 'package:desa_getasan_app/screen/loading_screen.dart';
import 'package:desa_getasan_app/screen/welcome_screen.dart';
import 'package:desa_getasan_app/services/agenda_service.dart';
import 'package:desa_getasan_app/services/announcement_service.dart';
import 'package:desa_getasan_app/services/authentication_service.dart';
import 'package:desa_getasan_app/services/complaint_service.dart';
import 'package:desa_getasan_app/services/umkm_service.dart';
import 'package:desa_getasan_app/services/user_service.dart';
import 'package:desa_getasan_app/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.containsKey('userData');
  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isLogin = false});

  final bool isLogin;

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
          RepositoryProvider(create: (context) => ComplaintService()),
          RepositoryProvider(create: (context) => AuthenticationService()),
          RepositoryProvider(create: (context) => UserService())
        ],
        child: BlocProvider(
            create: (context) => UserBloc()..add(CheckUserDataEvent()),
            child: MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all,
            onGenerateRoute: RouteGenerator.generateRoute,
            theme: ThemeData(
                textTheme: GoogleFonts.plusJakartaSansTextTheme()),
            title: 'Desa Getasan',
            home: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {

                if(state is UserLoaded){
                  return const Index();
                }

                if(!isLogin && state is UserInitial){
                  return const WelcomeScreen();
                }

                return const LoadingScreen();

              },
            )
          )
        ),
      ),
    );
  }
}
