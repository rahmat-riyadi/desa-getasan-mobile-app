import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primary,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient : LinearGradient(
                end: Alignment(-6.0703366777659085e-9,1),
                begin: Alignment(-0.06073538213968277,-5.587935447692871e-9),
                colors: [Color.fromRGBO(135, 16, 30, 1),Color.fromRGBO(201, 16, 34, 1)]
              ),
            )
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/desa.png',
                  width: 61.94,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Desa Getasan',
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  )
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SvgPicture.asset(
              'assets/pattern.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            )
          )
        ]
      ),
    ); 
  }
} 