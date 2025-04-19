import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String? result;
  final String? message;
  final Data? data;

  RegisterResponse({this.result, this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class Data {
  final String? token;
  final User? user;

  Data({this.token, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: 'firm_name')
  final String? firmName;

  @JsonKey(name: 'full_name')
  final String? fullName;

  final String? email;

  @JsonKey(name: 'whatsapp_no')
  final String? whatsappNo;

  @JsonKey(name: 'birth_date')
  final String? birthDate;

  @JsonKey(name: 'state_id')
  final String? stateId;

  final String? city;
  final String? address;
  final String? pincode;
  final String? role;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  final int? id;

  User({
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
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
