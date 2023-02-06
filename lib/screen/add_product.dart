import 'package:desa_getasan_app/components/input_label.dart';
import 'package:desa_getasan_app/components/text_input.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController productController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController linkController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                margin: EdgeInsets.zero,
                width: double.maxFinite,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(1, 1)
                    )
                  ]
                ),
              ),
            ),
            backgroundColor: Pallete.primary,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.height * 0.16,
            flexibleSpace: FlexibleSpaceBar(
              background: LayoutBuilder(
                builder: (p0, p1) => Container(
                  height: p1.maxHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/market-header.png'),
                      fit: BoxFit.cover,
                    )
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: Pallete.primary,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 8),
                          child: Text(
                            'Tambah Produk',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),
                        ),
                        const Text(
                          'Lorem ipsum dolor sit amet consectetur.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: InputLabel(label: 'Nama Produk'),
                        ),
                        TextInput(placeholder: 'Exp: Sabun Mandi', textEditingController: productController)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: InputLabel(label: 'kategori'),
                        ),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(color: Color(0xffF4F5F6)),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: const Text(
                              'Barang',
                              style: TextStyle(
                                color: Color(0xff9B9B9B),
                                fontSize: 14,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: '',
                                child: Text('Barang'),
                              ),
                            ], 
                            onChanged: (value) {}
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: InputLabel(label: 'Harga'),
                        ),
                        TextInput(placeholder: 'Exp: 12.000', textEditingController: priceController,)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: InputLabel(label: 'No.Whatsapp'),
                        ),
                        TextInput(placeholder: 'Exp: 087891', textEditingController: numberController,)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: InputLabel(label: 'Link Marketplace'),
                        ),
                        TextInput(placeholder: 'Exp: https://metro', textEditingController: linkController)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: InputLabel(label: 'Link Marketplace'),
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Deskripsi',
                            hintStyle: TextStyle(
                              color: Color(0xff9B9B9B),
                              fontSize: 14,
                            ),
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.secondary,
                        minimumSize: const Size.fromHeight(45),
                        elevation: 0
                      ),
                      child: const Text(
                        'Simpan Produk',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}