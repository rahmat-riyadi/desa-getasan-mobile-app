import 'dart:developer';

import 'package:desa_getasan_app/bloc/complaint_bloc.dart';
import 'package:desa_getasan_app/components/complaint_form.dart';
import 'package:desa_getasan_app/components/notif_dialog.dart';
import 'package:desa_getasan_app/models/complaint.dart';
import 'package:desa_getasan_app/services/complaint_service.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ComplaintBloc(RepositoryProvider.of<ComplaintService>(context)),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Pallete.primary,
          body: BlocListener<ComplaintBloc, ComplaintState>(
            listener: (context, state) {

              if(state is ComplaintSended){

                showDialog(
                  context: context, 
                  builder: (context) => const NotifDialog(
                    title: 'Sukses', 
                    subtitle: 'Ajuan anda berhasil dikirim', 
                    image: 'done.svg'
                  )
                ).then((value) => Navigator.pop(context));

              }

            },
            child: SizedBox(
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20) +
                          const EdgeInsets.only(top: 10),
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
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Ajukan Aduan',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Lorem ipsum dolor sit amet consectetur.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 32, right: 24, left: 24, bottom: 50),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          ComplaintForm(
                            nameController: nameController, 
                            phoneController: phoneController,
                            emailController: emailController,
                            deskriptionController: descriptionController,
                            formKey: _formKey,
                          ),
                          const Spacer(),
                          BlocBuilder<ComplaintBloc, ComplaintState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: () {

                                  if(_formKey.currentState!.validate()){
                                    context.read<ComplaintBloc>().add(
                                    SendComplaintEvent(
                                        Complaint(
                                          phone: phoneController.text,
                                          name: nameController.text,
                                          email: emailController.text,
                                          description: descriptionController.text,
                                          complaintCategoryId: "3",
                                        )
                                      )
                                    );
                                  } 

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Pallete.secondary,
                                  minimumSize: const Size.fromHeight(45),
                                  elevation: 0
                                ),
                                child: const Text(
                                  'Kirim Aduan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
