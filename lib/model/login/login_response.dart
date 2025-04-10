import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? result;
  final String? message;
  final Data? data;

  LoginResponse({this.result, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  int? id;

  @JsonKey(name: 'firm_name')
  String? firmName;

  @JsonKey(name: 'full_name')
  String? fullName;

  String? email;

  @JsonKey(name: 'whatsapp_no')
  String? whatsappNo;

  @JsonKey(name: 'birth_date')
  String? birthDate;

  @JsonKey(name: 'state_id')
  String? stateId;

  String? city;
  String? address;
  String? pincode;
  int? role;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  User({
    this.id,
    this.firmName,
    this.fullName,
    this.email,
    this.whatsappNo,
    this.birthDate,
    this.stateId,
    this.city,
    this.address,
    this.pincode,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
