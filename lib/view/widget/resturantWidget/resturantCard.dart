import 'package:beeorder/controller/HomeScreen/restaurantController.dart';
import 'package:beeorder/core/constant/apiLink.dart';
import 'package:beeorder/core/constant/appImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'            ;
import 'package:get/get.dart';
import '../../../core/constant/appColor.dart';
import '../../../core/function/translateFun.dart';
import '../../../data/model/resturantModel.dart'  ;
class ResturantCard extends StatelessWidget {
  final RestaurantModel restaurantModel    ;
  final bool canFav                        ;
  const ResturantCard({
    Key? key,
    required this.restaurantModel,
    required this.canFav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RestaurantControllerImp controller =Get.put(RestaurantControllerImp());
    return InkWell(
      onTap: () {controller.goToResturantDetailes(restaurantModel,canFav);},
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 170,
            width: double.maxFinite ,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black54),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage('${ApiLink.imageLinkRestaurant}/${restaurantModel.famuseMealImage}')
                )
            ),
            child: Hero(
              tag: restaurantModel.restaurantId.toString(),
              child: CachedNetworkImage(
                  imageUrl: '${ApiLink.imageLinkRestaurant}/${restaurantModel.famuseMealImage}',
                  fit:BoxFit.fill),
            ),

          )  ,
          ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage('${ApiLink.imageLinkRestaurant}/${restaurantModel.famuseMealImage}')),
            title:   Text(
                translate(ar:restaurantModel.restaurantName.toString() , en:restaurantModel.restaurantNameEn.toString() ,),
              style: const TextStyle(color: AppColor.primaryColor),
            ),

            subtitle:Text('${'valueoforder'.tr}${restaurantModel.restaurantOrderValue} ل س',
            style: const TextStyle(color: Colors.black),),
            trailing: Column(
              children: [
                Text(
                    '${restaurantModel.restaurantStartDate} ${restaurantModel.restaurantEndDate}'),
                canFav?Icon( restaurantModel.favorite=='1'?
                Icons.favorite:Icons.favorite_border ,
                  color: AppColor.primaryColor  ,  ):Text('')
              ],
            ),
            
          )   ,

        ],
      ),
    );
  }
}
