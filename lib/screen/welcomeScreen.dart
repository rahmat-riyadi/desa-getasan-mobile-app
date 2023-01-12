import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late final TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primary,
      body: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: GestureDetector(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      Column(
                        children: [
                          HeadingText(title: 'Pesan'),
                          const SizedBox(height: 20),
                          DescriptionText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae tellus tempor, vulputate vel dui.')
                        ],
                      ),
                      Column(
                        children: [
                          HeadingText(title: 'Pasar'),
                          const SizedBox(height: 20),
                          DescriptionText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae tellus tempor, vulputate vel dui.')
                        ],
                      ),
                      Column(
                        children: [
                          HeadingText(title: 'Aduan'),
                          const SizedBox(height: 20),
                          DescriptionText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae tellus tempor, vulputate vel dui.')
                        ],
                      )
                    ] 
                  ),
                ),
              ),
              SliderIndicator(length: 3, selected: _controller.index),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(MediaQuery.of(context).size.width, 48),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700 
                  ),
                  backgroundColor: Pallete.secondary
                ),
                onPressed: (){}, 
                child: const Text('Mulai Sekarang'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  
  String? title;

  HeadingText({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
} 

class DescriptionText extends StatelessWidget {
  
  String? text;

  DescriptionText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: Color(0xff7B7B7B),
      ),
    );
  }
} 

class SliderIndicator extends StatelessWidget {

  int? length, selected;

  SliderIndicator({super.key, this.length, this.selected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length!, (index) => Container(
        margin: const EdgeInsets.only(right: 10),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (index == selected!) ? Pallete.secondary : const Color(0xffEAEAEA)
        ),
      ))
    );
  }
}