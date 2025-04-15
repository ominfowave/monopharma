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
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchProductResponseToJson(
        SearchProductResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
      productPrice: json['product_price'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'product_price': instance.productPrice,
    };
