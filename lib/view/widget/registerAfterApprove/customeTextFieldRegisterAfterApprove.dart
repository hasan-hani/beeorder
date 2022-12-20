import 'package:flutter/material.dart';

import '../../../core/function/validinput.dart';

class CustomTextFieldRegisterAfterApprove extends StatelessWidget {
  final bool? isActive                        ;
  final TextEditingController controllerVal   ;
  final void Function()? onTap                ;
  final bool? needValidator                   ;
  const CustomTextFieldRegisterAfterApprove({
    Key? key,
    required this.controllerVal  ,
    this.isActive                ,
    this.onTap, this.needValidator=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 40              ,
        child: TextFormField(
          enabled: isActive     ,
          validator:(value) {
            if(needValidator!) return validInput(value.toString() ,'noType') ;
          },
          controller: controllerVal,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onTap     :   onTap ,
        ),
      ),
    );
  }
}
