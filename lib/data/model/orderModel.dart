class OrderModel {
  int? ordermealId;
  int? ordermealUser;
  int? ordermealMeal;
  int? ordermealCount;
  String? ordermealDate;
  int? ordermealAddress;
  int? mealId;
  String? mealImage;
  String? mealDesc;
  String? mealDescEn;
  String? mealName;
  String? mealNameEn;
  int? mealNumber;
  int? mealActive;
  int? mealPrice;
  String? mealDate;
  int? mealResturant;
  int? mealOffer;
  int? mealService;

  OrderModel(
      {this.ordermealId,
        this.ordermealUser,
        this.ordermealMeal,
        this.ordermealCount,
        this.ordermealDate,
        this.ordermealAddress,
        this.mealId,
        this.mealImage,
        this.mealDesc,
        this.mealDescEn,
        this.mealName,
        this.mealNameEn,
        this.mealNumber,
        this.mealActive,
        this.mealPrice,
        this.mealDate,
        this.mealResturant,
        this.mealOffer,
        this.mealService});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordermealId = json['ordermeal_id'];
    ordermealUser = json['ordermeal_user'];
    ordermealMeal = json['ordermeal_meal'];
    ordermealCount = json['ordermeal_count'];
    ordermealDate = json['ordermeal_date'];
    ordermealAddress = json['ordermeal_address'];
    mealId = json['meal_id'];
    mealImage = json['meal_image'];
    mealDesc = json['meal_desc'];
    mealDescEn = json['meal_desc_en'];
    mealName = json['meal_name'];
    mealNameEn = json['meal_name_en'];
    mealNumber = json['meal_number'];
    mealActive = json['meal_active'];
    mealPrice = json['meal_price'];
    mealDate = json['meal_date'];
    mealResturant = json['meal_resturant'];
    mealOffer = json['meal_offer'];
    mealService = json['meal_service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ordermeal_id'] = ordermealId;
    data['ordermeal_user'] = ordermealUser;
    data['ordermeal_meal'] = ordermealMeal;
    data['ordermeal_count'] = ordermealCount;
    data['ordermeal_date'] = ordermealDate;
    data['ordermeal_address'] = ordermealAddress;
    data['meal_id']           = mealId          ;
    data['meal_image'] = mealImage ;
    data['meal_desc'] = mealDesc   ;
    data['meal_desc_en'] = mealDescEn;
    data['meal_name'] = mealName;
    data['meal_name_en'] = mealNameEn;
    data['meal_number'] = mealNumber;
    data['meal_active'] = mealActive;
    data['meal_price'] = mealPrice;
    data['meal_date'] = mealDate;
    data['meal_resturant'] = mealResturant;
    data['meal_offer'] = mealOffer;
    data['meal_service'] = mealService;
    return data;
  }
}
