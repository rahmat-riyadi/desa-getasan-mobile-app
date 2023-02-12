import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  const LoginForm({
    super.key, 
    required this.nikController, 
    required this.passwordController, 
    this.formKey
  });

  final TextEditingController nikController;
  final TextEditingController passwordController;
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nik',
                style: TextStyle(color: Color(0xFF5B5B5B), fontSize: 14),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nikController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Exp:123456',
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Pallete.secondary
                    )
                  ),
                  focusColor: Pallete.secondary,
                  fillColor: Color(0xffF4F5F6)
                )
              )
            ],
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Password',
                style: TextStyle(color: Color(0xFF5B5B5B), fontSize: 14),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Pallete.secondary)
                  ),
                  focusColor: Pallete.secondary,
                  fillColor: Color(0xffF4F5F6)
                )
              )
            ],
          ),
        ]
      )
    );
  }

}