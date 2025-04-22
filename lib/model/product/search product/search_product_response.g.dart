// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductResponse _$SearchProductResponseFromJson(
        Map<String, dynamic> json) =>
    SearchProductResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchProductResponseToJson(
        SearchProductResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };
