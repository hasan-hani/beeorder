class UserModel {
  int?    usersId    ;
  String? usersName  ;
  String? usersPhone ;
  String? usersGender;
  String? usersCity  ;
  String? usersmail    ;
  int?    usersVervicationcode ;
  int?    usersValid;

  UserModel(
      {this.usersId               ,
        this.usersName            ,
        this.usersPhone           ,
        this.usersGender          ,
        this.usersCity            ,
        this.usersVervicationcode ,
        this.usersValid           ,
        this.usersmail            ,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    usersId              = json['users_id']                          ;
    usersName            = json['users_name']                        ;
    usersPhone           = json['users_phone'].toString()            ;
    usersGender          = json['users_gender'].toString()           ;
    usersCity            = json['users_city'].toString()             ;
    usersVervicationcode = json['users_vervicationcode']             ;
    usersValid           = json['users_valid']                       ;
    usersmail            = json['users_email']                       ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id']              =  this.usersId               ;
    data['users_name']            =  this.usersName             ;
    data['users_phone']           =  this.usersPhone            ;
    data['users_gender']          =  this.usersGender           ;
    data['users_city']            =  this.usersCity             ;
    data['users_vervicationcode'] =  this.usersVervicationcode  ;
    data['users_valid']           =  this.usersValid            ;
    return data                                                 ;
  }
}
