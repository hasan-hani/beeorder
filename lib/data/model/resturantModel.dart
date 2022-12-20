class RestaurantModel {
  int?    restaurantId        ;
  String? restaurantName      ;
  String? restaurantNameEn    ;
  String? restaurantImage     ;
  String? restaurantStartDate ;
  String? restaurantEndDate   ;
  String? restaurantDetails   ;
  String? restaurantDetailsEn ;
  String? restaurantOrderValue;
  String? famuseMealImage     ;
  String? favorite            ;
  String? restaurantLat       ;
  String? restaurantLong      ;
  RestaurantModel(
      {
        this.restaurantId        ,
        this.restaurantName      ,
        this.restaurantNameEn    ,
        this.restaurantImage     ,
        this.restaurantStartDate ,
        this.restaurantEndDate   ,
        this.restaurantDetails   ,
        this.restaurantDetailsEn ,
        this.restaurantOrderValue,
        this.famuseMealImage     ,
        this.favorite            ,
        this.restaurantLat       ,
        this.restaurantLong      ,
      } ) ;

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    restaurantId         =  json['restaurant_id']                ;
    restaurantName       =  json['restaurant_name']              ;
    restaurantNameEn     =  json['restaurant_name_en']           ;
    restaurantImage      =  json['restaurant_image']             ;
    restaurantStartDate  =  json['restaurant_start_date']        ;
    restaurantEndDate    =  json['restaurant_end_date']          ;
    restaurantDetails    =  json['restaurant_details']           ;
    restaurantDetailsEn  =  json['restaurant_details_en']        ;
    restaurantOrderValue =  json['restaurant_order_value']       ;
    famuseMealImage      =  json['restaurant_famous_meal_image'] ;
    favorite             =  json['fav']                          ;
    restaurantLong       =  json['restaurant_long']              ;
    restaurantLat        =  json['restaurant_lat']               ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_id']          = restaurantId        ;
    data['restaurant_name']        = restaurantName      ;
    data['restaurant_name_en']     = restaurantNameEn    ;
    data['restaurant_image']       = restaurantImage     ;
    data['restaurant_start_date']  = restaurantStartDate ;
    data['restaurant_end_date']    = restaurantEndDate   ;
    data['restaurant_details']     = restaurantDetails   ;
    data['restaurant_details_en']  = restaurantDetailsEn ;
    data['restaurant_order_value'] = restaurantOrderValue;
    return data                                          ;
  }
}
