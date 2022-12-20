class CityModel {
  int?    citiesId     ;
  String? citiesName   ;
  String? citiesNameEn ;

  CityModel({this.citiesId, this.citiesName, this.citiesNameEn});

  CityModel.fromJson(Map<String, dynamic> json) {
    citiesId = json['cities_id'];
    citiesName = json['cities_name'];
    citiesNameEn = json['cities_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cities_id'] = this.citiesId;
    data['cities_name'] = this.citiesName;
    data['cities_name_en'] = this.citiesNameEn;
    return data;
  }
}
