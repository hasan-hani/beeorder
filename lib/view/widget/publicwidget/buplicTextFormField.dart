import 'package:beeorder/core/constant/appColor.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/appview.dart';
import '../../../core/function/validinput.dart';

class PublicTextFormField extends StatelessWidget {
  final TextEditingController con ;
  final String hint               ;
  const PublicTextFormField({
    Key? key,
    required this.con,
    required this.hint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validInput(value.toString(),'name') ;
      },
      controller: con                   ,
      decoration: InputDecoration(
        focusColor: AppColor.primaryColor           ,
        focusedBorder:AppView.underlineInputBorder  ,
        hintText: hint                              ,
      )  ,


    );
  }
}
