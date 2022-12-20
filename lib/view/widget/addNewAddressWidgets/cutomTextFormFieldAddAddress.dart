import 'package:flutter/material.dart'  ;

import '../../../core/function/validinput.dart';
class CustomTextFormFieldAddAddress extends StatelessWidget {
  final String hint                 ;
  final TextEditingController controller   ;
  const CustomTextFormFieldAddAddress({
    Key? key,
    required this.hint  ,
    required this.controller   ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 2),
      child: TextFormField(
        validator: (value) => validInput(value.toString(),'name') ,
        controller: controller ,
        decoration: InputDecoration(
            hintText: hint   ,
            border:const OutlineInputBorder()
        ),
      ),
    );
  }
}