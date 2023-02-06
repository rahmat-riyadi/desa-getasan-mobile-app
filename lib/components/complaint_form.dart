import 'package:desa_getasan_app/components/input_label.dart';
import 'package:desa_getasan_app/components/text_form_input.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class ComplaintForm extends StatelessWidget {

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController deskriptionController;
  final dynamic formKey;

  const ComplaintForm({
    super.key, 
    required this.nameController, 
    required this.phoneController, 
    required this.emailController, 
    required this.deskriptionController, 
    required this.formKey, 
  });

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          _buildInputField(
            label: 'Name', 
            placeholder: 'Exp: Putu Gede', 
            controller: nameController,
            validator: (value) {

              if(value!.isEmpty){
                return 'nama tidak boleh kosong';
              }

              return null;

            }
          ),
          _buildInputField(label: 'No. Telepon', placeholder: 'Exp: 0878', controller: phoneController),
          _buildInputField(label: 'Email', placeholder: 'Exp: putugede@gmail.com', controller: emailController),
          _buildInputDescriptionField(
            label: 'Deskripsi Aduan', 
            placeholder: 'Deskripsi', 
            controller: deskriptionController,
            validator: (value) {

              if(value!.isEmpty){
                return 'deskripsi tidak boleh kosong';
              }

              return null;

            },
          ),
        ],
      )
    );
  }

  Widget _buildInputField({
    String? label, 
    String? placeholder, 
    TextEditingController? controller,
    FormFieldValidator<String>? validator
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputLabel(label: label!),
          const SizedBox(height: 10),
          TextFormInput(
            placeholder: placeholder!,
            textEditingController: controller!,
            validator: validator ?? (value) => null,
          )
        ],
      ),
    );
  }

  Widget _buildInputDescriptionField({
    String? label, 
    String? placeholder, 
    TextEditingController? controller,
    FormFieldValidator<String>? validator
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: label!),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          validator: validator ?? (value) => null,
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
              borderSide: BorderSide(color: Pallete.secondary)
            ),
            focusColor: Pallete.secondary,
            fillColor: const Color(0xffF4F5F6),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Colors.red
              )
            ),
          ),
        ),
      ],
    );
  }

}