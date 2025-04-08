// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      firmName: json['firm_name'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      birthDate: json['birth_date'] as String?,
      stateId: json['state_id'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      role: (json['role'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firm_name': instance.firmName,
      'full_name': instance.fullName,
      'email': instance.email,
      'whatsapp_no': instance.whatsappNo,
      'birth_date': instance.birthDate,
      'state_id': instance.stateId,
      'city': instance.city,
      'address': instance.address,
      'pincode': instance.pincode,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
