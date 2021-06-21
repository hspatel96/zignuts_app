


import 'package:zignuts_app/model/entity/contact_detail.dart';
import 'package:zignuts_app/model/entity/tokens.dart';

class LoginResponse {
  final String message;
  final LoginData data;
  final String errorMessage ;

  LoginResponse({this.message, this.data,this.errorMessage});


}

class LoginData {
  String message;
  Data data;

  LoginData({this.message, this.data});

  LoginData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  UserDetail userDetail;
  int isProfileFullfilled;
  String token;

  Data({this.userDetail, this.isProfileFullfilled, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userDetail = json['data'] != null ? new UserDetail.fromJson(json['data']) : null;
    isProfileFullfilled = json['is_profile_fullfilled'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDetail != null) {
      data['data'] = this.userDetail.toJson();
    }
    data['is_profile_fullfilled'] = this.isProfileFullfilled;
    data['token'] = this.token;
    return data;
  }
}

class UserDetail {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String emailToken;
  String deviceToken;
  String deviceType;
  dynamic role;
  int isAppUser;
  int isThirdPartyUser;
  int isVerified;
  int isActive;
  int isNotification;
  int openfireRegistration;
  int contactId;
  String jabberId;
  dynamic registerCode;
  dynamic registerCodeExpireAt;
  dynamic registerCodeVerifiedAt;
  int isDuoLoggedin;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String languageLocale;
  ContactDetail contactDetail;
  List<Tokens> tokens;

  UserDetail(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.emailToken,
        this.deviceToken,
        this.deviceType,
        this.role,
        this.isAppUser,
        this.isThirdPartyUser,
        this.isVerified,
        this.isActive,
        this.isNotification,
        this.openfireRegistration,
        this.contactId,
        this.jabberId,
        this.registerCode,
        this.registerCodeExpireAt,
        this.registerCodeVerifiedAt,
        this.isDuoLoggedin,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.languageLocale,
        this.contactDetail,
        this.tokens});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    emailToken = json['email_token'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    role = json['role'];
    isAppUser = json['is_app_user'];
    isThirdPartyUser = json['is_third_party_user'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    isNotification = json['is_notification'];
    openfireRegistration = json['openfire_registration'];
    contactId = json['contact_id'];
    jabberId = json['jabber_id'];
    registerCode = json['register_code'];
    registerCodeExpireAt = json['register_code_expire_at'];
    registerCodeVerifiedAt = json['register_code_verified_at'];
    isDuoLoggedin = json['is_duo_loggedin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    languageLocale = json['language_locale'];
    contactDetail = json['contact_detail'] != null
        ? new ContactDetail.fromJson(json['contact_detail'])
        : null;
    if (json['tokens'] != null) {
      tokens = new List<Tokens>();
      json['tokens'].forEach((v) {
        tokens.add(new Tokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['email_token'] = this.emailToken;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    data['role'] = this.role;
    data['is_app_user'] = this.isAppUser;
    data['is_third_party_user'] = this.isThirdPartyUser;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    data['is_notification'] = this.isNotification;
    data['openfire_registration'] = this.openfireRegistration;
    data['contact_id'] = this.contactId;
    data['jabber_id'] = this.jabberId;
    data['register_code'] = this.registerCode;
    data['register_code_expire_at'] = this.registerCodeExpireAt;
    data['register_code_verified_at'] = this.registerCodeVerifiedAt;
    data['is_duo_loggedin'] = this.isDuoLoggedin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['language_locale'] = this.languageLocale;
    if (this.contactDetail != null) {
      data['contact_detail'] = this.contactDetail.toJson();
    }
    if (this.tokens != null) {
      data['tokens'] = this.tokens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


