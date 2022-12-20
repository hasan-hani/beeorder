import 'package:flutter/material.dart'   ;

import '../../../core/constant/appColor.dart';
class PublicButton extends StatelessWidget {
  final String title                ;
  final void Function()?    onTap   ;
  const PublicButton({Key? key      ,
    required this.title             ,
    required this.onTap } ) : super(key: key)  ;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30) ,
      child: InkWell(
        onTap: onTap  ,
        child: Stack(
          children: [
            Positioned.fill(
                child:Container(
                  decoration:const  BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft   ,
                          end  : Alignment.centerRight  ,
                          colors: [
                            AppColor.secondaryColor         ,
                            AppColor.primaryColor           ,
                          ])
                  ),
                )
            ),
            SizedBox(
                height: 50,
                width: 300,
                child: Center(
                    child: Text(title ,
                      style: const TextStyle(
                          color: Colors.white          ,
                          fontSize: 18                 ,
                          fontWeight: FontWeight.bold) ,)))
          ],
        ),
      ),
    );
  }
}
