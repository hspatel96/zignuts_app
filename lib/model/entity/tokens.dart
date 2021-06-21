class Tokens {
  String id;
  int userId;
  int clientId;
  String name;
  bool revoked;
  String createdAt;
  String updatedAt;
  String expiresAt;

  Tokens(
      {this.id,
        this.userId,
        this.clientId,
        this.name,
        this.revoked,
        this.createdAt,
        this.updatedAt,
        this.expiresAt});

  Tokens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    name = json['name'];

    revoked = json['revoked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['client_id'] = this.clientId;
    data['name'] = this.name;

    data['revoked'] = this.revoked;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}