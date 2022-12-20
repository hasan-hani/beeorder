class Address {
  int? addressId;
  String? addressName;
  String? addressRegon;
  String? addressStreet;
  String? addressFlat;
  String? addressNearto;
  String? addressDetails;
  int? addressUser;
  String? addressLat;
  String? addressLang;

  Address(
      {this.addressId,
        this.addressName,
        this.addressRegon,
        this.addressStreet,
        this.addressFlat,
        this.addressNearto,
        this.addressDetails,
        this.addressUser,
        this.addressLat,
        this.addressLang});

  Address.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressRegon = json['address_regon'];
    addressStreet = json['address_street'];
    addressFlat = json['address_flat'];
    addressNearto = json['address_nearto'];
    addressDetails = json['address_details'];
    addressUser = json['address_user'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_regon'] = this.addressRegon;
    data['address_street'] = this.addressStreet;
    data['address_flat'] = this.addressFlat;
    data['address_nearto'] = this.addressNearto;
    data['address_details'] = this.addressDetails;
    data['address_user'] = this.addressUser;
    data['address_lat'] = this.addressLat;
    data['address_lang'] = this.addressLang;
    return data;
  }
}
