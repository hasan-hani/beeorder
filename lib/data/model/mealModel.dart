class MealModel {
  int?      mealId              ;
  String?   mealImage           ;
  String?   mealDesc            ;
  String?   mealDescEn          ;
  String?   mealName            ;
  String?   mealNameEn          ;
  int?      mealNumber          ;
  int?      mealActive          ;
  int?      mealPrice           ;
  DateTime? mealDate            ;
  int?      mealResturant       ;
  int?      mealOffer           ;
  int?      mealService         ;
  int?      servicesId          ;
  String?   servicesName        ;
  String?   servicesNameEn      ;
  int?      resdetailsId        ;
  int?      resdetailsRestaurant;
  int?      resdetailsService   ;
  String?   favorite            ;

  MealModel(
      {this.mealId               ,
        this.mealImage           ,
        this.mealDesc            ,
        this.mealDescEn          ,
        this.mealName            ,
        this.mealNameEn          ,
        this.mealNumber          ,
        this.mealActive          ,
        this.mealPrice           ,
        this.mealDate            ,
        this.mealResturant       ,
        this.mealOffer           ,
        this.mealService         ,
        this.servicesId          ,
        this.servicesName        ,
        this.servicesNameEn      ,
        this.resdetailsId        ,
        this.resdetailsRestaurant,
        this.resdetailsService   ,
        this.favorite            ,
      });

  MealModel.fromJson(Map<String, dynamic> json) {
    mealId         = json['meal_id']                      ;
    mealImage      = json['meal_image']                   ;
    mealDesc       = json['meal_desc']                    ;
    mealDescEn     = json['meal_desc_en']                 ;
    mealName       = json['meal_name']                    ;
    mealNameEn     = json['meal_name_en']                 ;
    mealNumber     = json['meal_number']                  ;
    mealActive     = json['meal_active']                  ;
    mealPrice      = json['meal_price']                   ;
    mealDate       = DateTime.tryParse(json['meal_date']) ;
    mealResturant  = json['meal_resturant']               ;
    mealOffer      = json['meal_offer']                   ;
    mealService    = json['meal_service']                 ;
    servicesId     = json['services_id']                  ;
    servicesName   = json['services_name']                ;
    servicesNameEn = json['services_name_en']             ;
    resdetailsId         = json['resdetails_id']          ;
    resdetailsRestaurant = json['resdetails_restaurant']  ;
    resdetailsService    = json['resdetails_service']     ;
    favorite             = json['fav']                    ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meal_id'] = this.mealId          ;
    data['meal_image'] = this.mealImage    ;
    data['meal_desc'] = this.mealDesc      ;
    data['meal_desc_en'] = this.mealDescEn ;
    data['meal_name'] = this.mealName      ;
    data['meal_name_en'] = this.mealNameEn ;
    data['meal_number'] = this.mealNumber  ;
    data['meal_active'] = this.mealActive  ;
    data['meal_price'] = this.mealPrice    ;
    data['meal_date']      = this.mealDate ;
    data['meal_resturant'] = this.mealResturant;
    data['meal_offer']     = this.mealOffer;
    data['meal_service']   = this.mealService;
    data['services_id']    = this.servicesId;
    data['services_name']  = this.servicesName;
    data['services_name_en'] = this.servicesNameEn;
    data['resdetails_id'] = this.resdetailsId;
    data['resdetails_restaurant'] = this.resdetailsRestaurant;
    data['resdetails_service'] = this.resdetailsService;
    return data;
  }
}
