import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

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
                  padding: const EdgeInsets.symmetric(horizontal: 20) + const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: Colors.black,),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Ajukan Aduan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur.',
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
                          InputLabel(label: 'Nama'),
                          SizedBox(height: 10),
                          TextInput(placeholder: 'Exp: Fidyah Nurfitrah',)
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          InputLabel(label: 'No. Telepon'),
                          SizedBox(height: 10),
                          TextInput(placeholder: 'Exp: 0878',)
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          InputLabel(label: 'Email'),
                          SizedBox(height: 10),
                          TextInput(placeholder: 'Exp: fidyahh@gmail.com',)
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          InputLabel(label: 'Deskripsi Aduan'),
                          SizedBox(height: 10),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Deskripsi',
                              contentPadding: EdgeInsets.all(12),
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
                        onPressed: () => Navigator.pushNamed(context, '/home'),
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
    );;
  }
}

class TextInput extends StatelessWidget {

  final String placeholder;

  const TextInput({
    Key? key, required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.all(12),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide.none
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Pallete.secondary
          )
        ),
        focusColor: Pallete.secondary,
        fillColor: const Color(0xffF4F5F6)
      )
    );
  }
}

class InputLabel extends StatelessWidget {

  final String label;

  const InputLabel({
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF5B5B5B),
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
    );
  }
}