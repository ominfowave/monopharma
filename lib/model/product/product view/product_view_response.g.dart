// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductViewResponse _$ProductViewResponseFromJson(Map<String, dynamic> json) =>
    ProductViewResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductViewResponseToJson(
        ProductViewResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      compositionName: json['composition_name'] as String?,
      productImage: json['product_image'] as String?,
      productPrice: json['product_price'] as String?,
      productPack: json['product_pack'] as String?,
      isLbcVisualised: (json['is_lbc_visualised'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      segmentName: json['segment_name'] as String?,
      divisionName: json['division_name'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'composition_name': instance.compositionName,
      'product_image': instance.productImage,
      'product_price': instance.productPrice,
      'product_pack': instance.productPack,
      'is_lbc_visualised': instance.isLbcVisualised,
      'category_name': instance.categoryName,
      'segment_name': instance.segmentName,
      'division_name': instance.divisionName,
    };
