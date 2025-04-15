// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_all_pdf_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAllPdfResponse _$UserAllPdfResponseFromJson(Map<String, dynamic> json) =>
    UserAllPdfResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserAllPdfResponseToJson(UserAllPdfResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'created_at': instance.createdAt,
    };
