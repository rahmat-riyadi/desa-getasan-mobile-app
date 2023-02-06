import 'package:desa_getasan_app/bloc/complaint_bloc.dart';
import 'package:desa_getasan_app/components/input_label.dart';
import 'package:desa_getasan_app/components/text_input.dart';
import 'package:desa_getasan_app/models/complaint.dart';
import 'package:desa_getasan_app/services/complaint_service.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintPage extends StatelessWidget {
  ComplaintPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController deskriptionController = TextEditingController();

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
                  builder: (context) => const SimpleDialog(
                    children: [
                      Text('asdf')
                    ],
                  ),
                );

              }

              if(state is ComplaintFailed){

                showDialog(
                  context: context, 
                  builder: (context) => const SimpleDialog(
                    children: [
                      Text('asdf')
                    ],
                  ),
                );

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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const InputLabel(label: 'Nama'),
                              const SizedBox(height: 10),
                              TextInput(
                                  placeholder: 'Exp: Putu Gede',
                                  textEditingController: nameController)
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const InputLabel(label: 'No. Telepon'),
                              const SizedBox(height: 10),
                              TextInput(
                                  placeholder: 'Exp: 0878',
                                  textEditingController: phoneController)
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const InputLabel(label: 'Email'),
                              const SizedBox(height: 10),
                              TextInput(
                                  placeholder: 'Exp: putuGede@gmail.com',
                                  textEditingController: emailController)
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const InputLabel(label: 'Deskripsi Aduan'),
                              const SizedBox(height: 10),
                              TextField(
                                  controller: deskriptionController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  decoration: const InputDecoration(
                                      hintText: 'Deskripsi',
                                      contentPadding: EdgeInsets.all(12),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Pallete.secondary)),
                                      focusColor: Pallete.secondary,
                                      fillColor: Color(0xffF4F5F6)))
                            ],
                          ),
                          const Spacer(),
                          BlocBuilder<ComplaintBloc, ComplaintState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                  onPressed: () => context
                                      .read<ComplaintBloc>()
                                      .add(SendComplaintEvent(Complaint(
                                        phone: phoneController.text,
                                        name: nameController.text,
                                        email: nameController.text,
                                        description: deskriptionController.text,
                                        complaintCategoryId: "3",
                                      ))),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Pallete.secondary,
                                      minimumSize: const Size.fromHeight(45),
                                      elevation: 0),
                                  child: const Text(
                                    'Kirim Aduan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ));
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
    ;
  }
}
