import 'package:cached_network_image/cached_network_image.dart' ;
import 'package:flutter/material.dart'             ;
import 'package:get/get.dart'                      ;
import '../../../core/constant/apiLink.dart'       ;
import '../../../core/constant/appColor.dart'      ;
import '../../../core/function/isOfferfun.dart';
import '../../../core/function/translateFun.dart'  ;
import '../../../data/model/mealModel.dart'        ;
import '../../screen/mealDetailsScreen.dart'       ;
import 'package:badges/badges.dart'                ;

class MealCard extends StatelessWidget {
  final MealModel mealModel ;
  final bool isExpanded     ;
  final bool canFavorite    ;
  const MealCard({Key? key    ,
    required this.mealModel   ,
    this.isExpanded = false   ,
    required this.canFavorite ,  // to add fav icon and delete it
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () => Get.offAllNamed(MealDetailsScreen.id,arguments:
        {'MealModel': mealModel , 'canFav':canFavorite } )  ,
        child: Column(
          children: [
            Badge(
              shape: BadgeShape.square            ,
              showBadge: isOfferFun(mealModel.mealOffer)                  ,
              position:BadgePosition.topStart()   ,
              badgeColor: Colors.grey.withOpacity(0.2)     ,
              badgeContent: Center(
                  child: Text(' ${'offer'.tr} ${mealModel.mealOffer}%  ',
                    style:const TextStyle(color: AppColor.primaryColor,fontSize: 20,fontWeight: FontWeight.bold),)),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black54),
                  borderRadius: BorderRadius.circular(14),
                ),
                height: 125 ,
                width: isExpanded? double.maxFinite:225  ,
                child: CachedNetworkImage(
                  height: 125,
                  width: isExpanded? double.maxFinite:225,
                  imageUrl: '${ApiLink.imageLinkMeal}/${mealModel.mealImage}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  translate(ar:mealModel.mealName.toString()
                      ,en:mealModel.mealNameEn.toString() ),
                  textAlign: TextAlign.start          ,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  isExpanded? '${mealModel.mealPrice} ${'sp'.tr}':'',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 20,color: AppColor.primaryColor),
                ),
              ],
            )     ,
          ],
        )          ,
      ),
    );
  }
}
