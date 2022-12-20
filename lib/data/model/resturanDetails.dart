class ResturantDetails {
  int? servicesId;
  String? servicesName;
  String? servicesNameEn;
  int? resdetailsId;
  int? resdetailsRestaurant;
  int? resdetailsService;

  ResturantDetails(
      {this.servicesId,
        this.servicesName,
        this.servicesNameEn,
        this.resdetailsId,
        this.resdetailsRestaurant,
        this.resdetailsService});

  ResturantDetails.fromJson(Map<String, dynamic> json) {
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesNameEn = json['services_name_en'];
    resdetailsId = json['resdetails_id'];
    resdetailsRestaurant = json['resdetails_restaurant'];
    resdetailsService = json['resdetails_service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    data['services_name_en'] = this.servicesNameEn;
    data['resdetails_id'] = this.resdetailsId;
    data['resdetails_restaurant'] = this.resdetailsRestaurant;
    data['resdetails_service'] = this.resdetailsService;
    return data;
  }
}
