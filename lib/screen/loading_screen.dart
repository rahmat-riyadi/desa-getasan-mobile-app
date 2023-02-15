import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Pallete.primary,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}