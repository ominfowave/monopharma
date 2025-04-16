// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratePdfResponse _$GeneratePdfResponseFromJson(Map<String, dynamic> json) =>
    GeneratePdfResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$GeneratePdfResponseToJson(
        GeneratePdfResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };
