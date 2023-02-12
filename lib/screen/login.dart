import 'package:another_flushbar/flushbar.dart';
import 'package:desa_getasan_app/bloc/authentication_bloc.dart';
import 'package:desa_getasan_app/bloc/user_bloc.dart';
import 'package:desa_getasan_app/components/login_form.dart';
import 'package:desa_getasan_app/services/authentication_service.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nikController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nikController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc(RepositoryProvider.of<AuthenticationService>(context))),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Pallete.primary,
          body: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {

              if(state is AuthenticationSuccess){

                context.read<UserBloc>().add(EmitUserDataEvent(state.user));
                Flushbar(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  borderRadius: BorderRadius.circular(5),
                  backgroundColor: Colors.white,
                  flushbarPosition: FlushbarPosition.TOP,
                  boxShadows: [
                    BoxShadow(
                      offset: const Offset(0, 0.5),
                      blurRadius: 1.5,
                      color: const Color(0xff54B435).withOpacity(0.4)
                    ),
                  ],
                  messageText: Row(
                    children: const [
                      SizedBox(width: 8),
                      Text(
                        'Login Berhasil',
                        style: TextStyle(
                          color: Color(0xff379237),
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                  duration: const Duration(milliseconds: 2300),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Icon(Icons.done_rounded, color: Color(0xff379237)),
                  ),
                ).show(context).then((value) => Navigator.of(context).pushNamed('/home'));
              }

              if(state is AuthenticationFailed){

                showCupertinoDialog(
                  context: context, 
                  builder: (context) => CupertinoAlertDialog(
                    title: Text(
                      state.error['message'],
                    ),
                    content: const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Daftar diri anda terlebih dahulu'),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                );

              }

            },
            child: SizedBox(
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20) +
                          const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/desa.png'),
                          const SizedBox(height: 20),
                          const Text(
                            'Selamat Datang',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Silahkan Masukkan Nik dan Password Anda!',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 32, right: 24, left: 24, bottom: 50),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          LoginForm(
                              nikController: nikController,
                              passwordController: passwordController),
                          const Spacer(),
                          BlocBuilder<AuthenticationBloc, AuthenticationState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                  onPressed: () {
                                    context.read<AuthenticationBloc>().add(
                                        LoginEvent(
                                            nik: nikController.text,
                                            password: passwordController.text));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Pallete.secondary,
                                      minimumSize: const Size.fromHeight(45),
                                      elevation: 0),
                                  child: (state is LoadingAuthenticationState) 
                                  ?
                                  const CircularProgressIndicator.adaptive()
                                  :
                                  const Text(
                                    'Masuk',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  )
                                );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}

