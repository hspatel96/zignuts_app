

class ContactDetail {
  int id;
  int categoryId;
  dynamic officeId;
  dynamic difficultyLevelId;
  dynamic preferPaymentMethodId;
  dynamic salutation;
  String firstName;
  dynamic middleName;
  String lastName;
  String email;
  dynamic mobile1;
  dynamic mobile2;
  dynamic nationality;
  dynamic designation;
  dynamic dob;
  dynamic gender;
  dynamic profilePic;
  String colorCode;
  dynamic skiingLevel;
  dynamic instructorNumber;
  int qRNumber;
  dynamic insuranceNumber;
  int displayInApp;
  int isActive;
  dynamic subcategoryId;
  dynamic serviceName;
  dynamic otherAddress;
  dynamic contactPersonEmail;
  dynamic contactPersonName;
  dynamic joiningDate;
  dynamic lastBookingDate;
  dynamic additionComments;
  int totalFeedback;
  String averageRating;
  dynamic signature;
  dynamic accommodationId;
  dynamic accomodation;
  int isSki;
  int isSnowboard;
  dynamic createdBy;
  dynamic updatedBy;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String languageLocale;

  ContactDetail(
      {this.id,
        this.categoryId,
        this.officeId,
        this.difficultyLevelId,
        this.preferPaymentMethodId,
        this.salutation,
        this.firstName,
        this.middleName,
        this.lastName,
        this.email,
        this.mobile1,
        this.mobile2,
        this.nationality,
        this.designation,
        this.dob,
        this.gender,
        this.profilePic,
        this.colorCode,
        this.skiingLevel,
        this.instructorNumber,
        this.qRNumber,
        this.insuranceNumber,
        this.displayInApp,
        this.isActive,
        this.subcategoryId,
        this.serviceName,
        this.otherAddress,
        this.contactPersonEmail,
        this.contactPersonName,
        this.joiningDate,
        this.lastBookingDate,
        this.additionComments,
        this.totalFeedback,
        this.averageRating,
        this.signature,
        this.accommodationId,
        this.accomodation,
        this.isSki,
        this.isSnowboard,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.languageLocale,
      });

  ContactDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    officeId = json['office_id'];
    difficultyLevelId = json['difficulty_level_id'];
    preferPaymentMethodId = json['prefer_payment_method_id'];
    salutation = json['salutation'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    nationality = json['nationality'];
    designation = json['designation'];
    dob = json['dob'];
    gender = json['gender'];
    profilePic = json['profile_pic'];
    colorCode = json['color_code'];
    skiingLevel = json['skiing_level'];
    instructorNumber = json['instructor_number'];
    qRNumber = json['QR_number'];
    insuranceNumber = json['insurance_number'];
    displayInApp = json['display_in_app'];
    isActive = json['is_active'];
    subcategoryId = json['subcategory_id'];
    serviceName = json['service_name'];
    otherAddress = json['other_address'];
    contactPersonEmail = json['contact_person_email'];
    contactPersonName = json['contact_person_name'];
    joiningDate = json['joining_date'];
    lastBookingDate = json['last_booking_date'];
    additionComments = json['addition_comments'];
    totalFeedback = json['total_feedback'];
    averageRating = json['average_rating'];
    signature = json['signature'];
    accommodationId = json['accommodation_id'];
    accomodation = json['accomodation'];
    isSki = json['is_ski'];
    isSnowboard = json['is_snowboard'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    languageLocale = json['language_locale'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['office_id'] = this.officeId;
    data['difficulty_level_id'] = this.difficultyLevelId;
    data['prefer_payment_method_id'] = this.preferPaymentMethodId;
    data['salutation'] = this.salutation;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['nationality'] = this.nationality;
    data['designation'] = this.designation;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['profile_pic'] = this.profilePic;
    data['color_code'] = this.colorCode;
    data['skiing_level'] = this.skiingLevel;
    data['instructor_number'] = this.instructorNumber;
    data['QR_number'] = this.qRNumber;
    data['insurance_number'] = this.insuranceNumber;
    data['display_in_app'] = this.displayInApp;
    data['is_active'] = this.isActive;
    data['subcategory_id'] = this.subcategoryId;
    data['service_name'] = this.serviceName;
    data['other_address'] = this.otherAddress;
    data['contact_person_email'] = this.contactPersonEmail;
    data['contact_person_name'] = this.contactPersonName;
    data['joining_date'] = this.joiningDate;
    data['last_booking_date'] = this.lastBookingDate;
    data['addition_comments'] = this.additionComments;
    data['total_feedback'] = this.totalFeedback;
    data['average_rating'] = this.averageRating;
    data['signature'] = this.signature;
    data['accommodation_id'] = this.accommodationId;
    data['accomodation'] = this.accomodation;
    data['is_ski'] = this.isSki;
    data['is_snowboard'] = this.isSnowboard;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['language_locale'] = this.languageLocale;

    return data;
  }
}
