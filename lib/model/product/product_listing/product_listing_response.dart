import 'package:json_annotation/json_annotation.dart';

part 'product_listing_response.g.dart';

@JsonSerializable()
class ProductListingResponse {
  final String? result;
  final String? message;

  @JsonKey(name: 'data')
  final List<ProductData>? data;

  ProductListingResponse({this.result, this.message, this.data});

  factory ProductListingResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListingResponseToJson(this);
}

@JsonSerializable()
class ProductData {
  final int? id;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'product_image')
  final String? productImage;

  @JsonKey(name: 'product_price')
  final String? productPrice;

  ProductData({this.id,this.productName, this.productImage, this.productPrice});

  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
