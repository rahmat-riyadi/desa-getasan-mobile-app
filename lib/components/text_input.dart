import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  final String placeholder;
  final TextEditingController textEditingController;
  final bool readonly;

  const TextInput({
    Key? key, required this.placeholder, 
    required this.textEditingController, 
    this.readonly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readonly,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Color(0xff9B9B9B),
          fontSize: 14,
        ),
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