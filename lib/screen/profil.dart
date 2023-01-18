import 'package:desa_getasan_app/components/textInput.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Pallete.primary
        ),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Akun',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset('assets/icons/notification.svg'),
                        Positioned(
                          left: 10,
                          bottom: 15,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xffFFAB00),
                              shape: BoxShape.circle
                            ),
                            child: const Text(
                              '3', 
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            )
                          )
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: const Text(
                        'ID',
                        style: TextStyle(
                          color: Pallete.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:const EdgeInsets.all(24),
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  )
                ),
                child: Column(
                  children: [
                     const CircleAvatar(
                    radius: 40,
                     backgroundColor: Color(0xffF1F3F6),
                      child: Text(
                        'FN',
                        style: TextStyle(
                          fontSize: 31,
                          color: Colors.black
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){}, 
                      child: const Text(
                        'Ubah Profil',
                        style: TextStyle(
                          fontSize: 14,
                          color: Pallete.secondary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8
                        ),
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('Nama'),
                        ),
                        TextInput(placeholder: 'Fidyah Nurfitrah Salsabila')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Nik'),
                          ),
                          TextInput(placeholder: '60200120116')
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('Desa'),
                        ),
                        const TextInput(placeholder: 'Bima'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Pallete.secondary,
                              elevation: 0,
                              fixedSize: const Size(170, 43),
                            ),
                            onPressed: (){}, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/lock-circle.svg',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  'Ubah Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                              ],
                            )
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        fixedSize: const Size(double.maxFinite, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(
                            color: Color(0xff00AAE1),
                            width: 1.5
                          )
                        )
                      ),
                      onPressed: (){}, 
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          color: Color(0xff00AAE1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}