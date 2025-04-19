// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListingResponse _$ProductListingResponseFromJson(
        Map<String, dynamic> json) =>
    ProductListingResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductListingResponseToJson(
        ProductListingResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: (json['id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
      productPrice: json['product_price'] as String?,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'product_price': instance.productPrice,
    };
