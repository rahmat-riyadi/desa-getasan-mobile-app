import 'package:desa_getasan_app/bloc/change_password_bloc.dart';
import 'package:desa_getasan_app/bloc/user_bloc.dart';
import 'package:desa_getasan_app/components/change_password_form.dart';
import 'package:desa_getasan_app/components/notif_dialog.dart';
import 'package:desa_getasan_app/services/user_service.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final String userId = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) =>
          ChangePasswordBloc(RepositoryProvider.of<UserService>(context)),
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
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Pallete.primary,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: LayoutBuilder(
                  builder: (p0, p1) => Container(
                    height: p1.maxHeight,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/market-header.png'),
                      fit: BoxFit.cover,
                    )),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              elevation: 0,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(10),
                              minimumSize: const Size(0, 0),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 15,
                              color: Pallete.primary,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Ubah Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 31,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccess) {
                context.read<UserBloc>().add(EmitUserDataEvent(state.user));
      
                showDialog(
                        context: context,
                        builder: (context) => const NotifDialog(
                            title: 'Sukses',
                            subtitle: 'Password anda berhasil diubah',
                            image: 'done.svg'))
                    .then((value) => Navigator.pop(context));
              } 

              if(state is ChangePasswordFailed){

                showDialog(
                  context: context,
                  builder: (context) => NotifDialog(
                    title: 'Sukses',
                    subtitle: state.message.toString(),
                    image: 'done.svg'
                  )
                );

              }
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  ChangePasswordForm(
                    passwordController: passwordController,
                    newPasswordController: newPasswordController,
                    confirmPasswordController: confirmPasswordController,
                    formKey: _formKey,
                  ),
                  const Spacer(),
                  BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<ChangePasswordBloc>().add(
                            ChangePassword(
                              password: passwordController.text, 
                              newPassword: newPasswordController.text, 
                              confirmPassword: confirmPasswordController.text,
                              id: userId
                            )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.secondary,
                          minimumSize: const Size.fromHeight(45),
                          elevation: 0
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        )
                      );
                    },
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
