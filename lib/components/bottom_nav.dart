import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30) + const EdgeInsets.only(bottom: 10)  ,
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(1, 0),
            blurRadius: 10
          )
        ]
      ),
      child: TabBar(
        labelColor: Pallete.primary,               
        indicator: const BoxDecoration(),
        unselectedLabelColor: const Color(0xFF7B7B7B),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal
        ),
        tabs: [
          const Tab(
            icon: Icon(Icons.home),
            iconMargin: EdgeInsets.symmetric(vertical: 3),
            text: 'Beranda',
          ),
          Stack(
            clipBehavior: Clip.none ,
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Tab(
                  icon: Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Pallete.primary
                      ),
                      child: const Icon(Icons.email, color: Colors.white,),
                    ),
                  ),
                  iconMargin: const EdgeInsets.symmetric(vertical: 5),
                  height: 100,
                  text: 'Surat',
                ),
              ),
            ],
          ),
          const Tab(
            icon: Icon(Icons.person),
            iconMargin: EdgeInsets.symmetric(vertical: 3),
            text: 'Akun',
          )
        ],
      ),
    );
  }
}