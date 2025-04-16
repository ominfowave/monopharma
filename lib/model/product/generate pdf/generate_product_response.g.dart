// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateProductResponse _$GenerateProductResponseFromJson(
        Map<String, dynamic> json) =>
    GenerateProductResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$GenerateProductResponseToJson(
        GenerateProductResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };
