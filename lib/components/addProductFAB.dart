import 'package:flutter/material.dart';

class AddProductFAB extends StatelessWidget {
  const AddProductFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff1BD741),
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(200)
          )
        ),
        elevation: 0,
        fixedSize: const Size(180, 60)
      ),
      onPressed: () => Navigator.pushNamed(context, '/addProduct'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Tambah Produk',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.add, color: Color(0xff1BD741), size: 25,),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}