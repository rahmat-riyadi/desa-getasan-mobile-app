import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
          currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Pallete.primary,
        body: SizedBox(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20) + const EdgeInsets.only(top: 30),
                  // decoration: BoxDecoration(color: Colors.black),
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
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Silahkan Masukkan Nik dan Password Anda!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 32,
                    right: 24,
                    left: 24,
                    bottom: 50
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Nik',
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
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
                        children: const [
                          Text(
                            'Password',
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
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
                      const Spacer(),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.secondary,
                          minimumSize: const Size.fromHeight(45),
                          elevation: 0
                        ),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}