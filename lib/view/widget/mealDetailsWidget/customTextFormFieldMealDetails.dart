import 'package:flutter/material.dart' ;
class CustomTextFormFieldMealDetails extends StatelessWidget {
  const CustomTextFormFieldMealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12) ,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'ملاحظات اضافية اختياري'
        ),
      ),
    );
  }
}
