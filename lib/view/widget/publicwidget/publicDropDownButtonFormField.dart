import 'package:flutter/material.dart';

import '../../../core/constant/appColor.dart';
import '../../../core/constant/appview.dart';

class PublicDropDownButtonFormField extends StatelessWidget {
  final List<String> items     ;
  final String selectedValue   ;
  final void Function(String?)? onChanged ;
  const PublicDropDownButtonFormField({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.onChanged         ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String val = 'x'   ;
    return DropdownButtonFormField(
      decoration: InputDecoration(
        focusColor: AppColor.primaryColor           ,
        focusedBorder:AppView.underlineInputBorder  ,
      ) ,
      iconEnabledColor : AppColor.primaryColor ,
      value: selectedValue   ,
      items: items.map((e) =>
          DropdownMenuItem<String>(
            value: e ,
            child: Text(e),)).toList(),
      onChanged: onChanged  ,

    ) ;
  }
}
