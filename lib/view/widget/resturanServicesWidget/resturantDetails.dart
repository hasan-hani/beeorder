import 'package:beeorder/controller/resturant/ResturantServicesController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import '../../../core/class/handlingData.dart';
import '../../../core/constant/apiLink.dart';
import '../../../core/constant/appColor.dart';
import '../../../core/function/translateFun.dart';
import '../../../data/model/resturantModel.dart';
class ResturantDetails extends GetView<RestaurantServicesControllerImp> {
  final RestaurantModel restaurantModel ;
  final void Function()?  getPosition ;
  const ResturantDetails({
    Key? key,
    required this.restaurantModel,
    required this.getPosition
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantServicesControllerImp>(
      builder: (controller) {
        return HandlingDataViewShimmer(
            statusRequest: controller.addFavStatusRequest,
            widget: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      width: double.maxFinite ,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black54),
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
                    ) ,
                    Container(
                      height: 170,
                      width: double.maxFinite ,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter  ,
                            end : Alignment.bottomCenter ,
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.white.withOpacity(0.1),

                            ]) ,
                      ),
                    ),
                    Positioned(
                        top  : 5   ,
                        left : 5   ,
                        right: 5   ,
                        child:Row(
                          children: [
                            InkWell(
                              onTap: getPosition ,
                              child: CircleAvatar(
                                  backgroundColor: AppColor.greyColor,
                                  child: Icon(Icons.location_on_outlined,color: AppColor.primaryColor,)),
                            )    ,
                            SizedBox(width: 15,) ,
                            controller.canFav?
                            GetBuilder<RestaurantServicesControllerImp>(
                                builder: (controller) {
                                  return InkWell(
                                    onTap : controller.addMyFavorite        ,
                                    child : CircleAvatar(
                                        backgroundColor: AppColor.greyColor ,
                                        child:controller.isFavorite ?
                                        Icon(Icons.favorite,color: AppColor.primaryColor,):
                                        Icon(Icons.favorite_border,color: AppColor.primaryColor,)
                                    ),
                                  );
                                }
                            ):
                            const Text('')             ,
                            const Spacer()             ,
                            InkWell(
                              onTap: (){
                                controller.goToHomeScreen() ;
                              },
                              child: CircleAvatar(
                                  backgroundColor:AppColor.greyColor,
                                  child: Icon(Icons.arrow_back_ios,color: AppColor.primaryColor,)),
                            )    ,
                          ],
                        ) )
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage('${ApiLink.imageLinkRestaurant}/${restaurantModel.famuseMealImage}')),
                  title:   Text(
                    translate(ar:restaurantModel.restaurantName.toString() , en:restaurantModel.restaurantNameEn.toString() ,),
                    style: const TextStyle(color: AppColor.primaryColor),
                  ),

                  subtitle:Text('${'valueoforder'.tr}${restaurantModel.restaurantOrderValue} ل س',
                    style: const TextStyle(color: Colors.black),),
                  trailing: Text(
                      '${restaurantModel.restaurantStartDate} ${restaurantModel.restaurantEndDate}'),
                )  ,

              ],
            ) );
      }
    );
  }
}
