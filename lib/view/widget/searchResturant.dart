import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/class/searchResturantMeal/serchDelegate.dart';
import '../../core/constant/appColor.dart';
class SearchRestaurunt extends StatelessWidget {
  final String? hint ;
  const SearchRestaurunt({
     this.hint      ,
       }
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration:BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(8)
            ) ,
            width: double.maxFinite,
            height:35,
            child: TextFormField(
              onTap: () {
                showSearch(context: context, delegate: SearchResturantMeal());
              },
              decoration:InputDecoration(
                hintText: hint            ,
                fillColor: Colors.white10 ,
                filled: true              ,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),

                )
              ) ,
            ),
          ) ,
        )              ,
        const SizedBox(width: 2,)  ,
        Stack(
          children: [
            Container(height: 36,width: 36,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(4),color: AppColor.secondaryColor),) ,
            Positioned(
              bottom: 5,
                left:5 ,
                child: Container(
                height: 25,
                width: 25,
                child: CircleAvatar(backgroundColor: AppColor.primaryColor,child: Icon(Icons.percent_rounded,color: Colors.white,),)))
          ],
        )                 ,
      ],
    );
  }
}
