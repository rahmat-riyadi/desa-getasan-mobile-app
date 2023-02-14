import 'package:desa_getasan_app/components/input_label.dart';
import 'package:desa_getasan_app/components/text_form_input.dart';
import 'package:flutter/material.dart';

class ChangePasswordForm extends StatelessWidget {

  const ChangePasswordForm({
    super.key, 
    required this.passwordController, 
    required this.newPasswordController, 
    required this.confirmPasswordController, 
    this.formKey
  });

  final TextEditingController passwordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildInputField(label: 'Password Lama', controller: passwordController, placeholder: ''),
          _buildInputField(label: 'Password Baru', controller: newPasswordController, placeholder: ''),
          _buildInputField(label: 'Konfirmasi Password', controller: confirmPasswordController, placeholder: ''),
        ],
      ),
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
}