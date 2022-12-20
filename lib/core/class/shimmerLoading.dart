import 'package:flutter/material.dart'   ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart'    ;

class ShimmerLoadingPage extends StatelessWidget {
  const ShimmerLoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 200               ,
        width : double.maxFinite  ,
        child: Shimmer.fromColors(
            baseColor: Colors.grey, highlightColor: Colors.black12,
            child:Container(
              margin:const EdgeInsets.all(3)  ,
              child:Column(
                children: [
                  Container(width:double.maxFinite,height:100   ,
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.grey) ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:EdgeInsets.all(2) ,
                        height:80,width:50 ,
                        decoration:BoxDecoration(shape: BoxShape.rectangle,color: Colors.grey) ,),
                      Container(
                        width: Get.width-100  ,
                        child: Column(
                          children: [
                            Container(margin:EdgeInsets.all(2),color:Colors.grey,height:25 ,),
                            Container(margin:EdgeInsets.all(2),color:Colors.grey,height:25,)
                          ],
                        ),
                      )
                    ],
                  )            ,
                ],
              )        ,
            ) ),
      );
  }
}