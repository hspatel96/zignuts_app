
class User {
  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String profileImage;
  String aboutUs;
  String policy;
  String status;
  String role;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String accessToken;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.profileImage,
        this.aboutUs,
        this.policy,
        this.status,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profileImage = json['profile_image'];
    aboutUs = json['about_us'];
    policy = json['policy'];
    status = json['status'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_image'] = this.profileImage;
    data['about_us'] = this.aboutUs;
    data['policy'] = this.policy;
    data['status'] = this.status;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['accessToken'] = this.accessToken;
    return data;
  }
}