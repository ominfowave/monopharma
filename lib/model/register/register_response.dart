import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  String? result;
  String? message;
  Data? data;

  RegisterResponse({this.result, this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
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
  String? role;

  @JsonKey(name: 'gst_no')
  String? gstNo;

  @JsonKey(name: 'dl_no')
  String? dlNo;

  @JsonKey(name: 'pancard_no')
  String? pancardNo;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'created_at')
  String? createdAt;

  int? id;

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
    this.gstNo,
    this.dlNo,
    this.pancardNo,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
