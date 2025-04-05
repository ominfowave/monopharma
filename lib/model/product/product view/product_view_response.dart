import 'package:json_annotation/json_annotation.dart';

part 'product_view_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductViewResponse {
  final String? result;
  final String? message;
  final List<Data>? data;

  ProductViewResponse({this.result, this.message, this.data});

  factory ProductViewResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductViewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductViewResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int? id;
  @JsonKey(name: 'product_name')
  final String? productName;
  @JsonKey(name: 'composition_name')
  final String? compositionName;
  @JsonKey(name: 'product_image')
  final String? productImage;
  @JsonKey(name: 'product_price')
  final String? productPrice;
  @JsonKey(name: 'product_pack')
  final String? productPack;
  @JsonKey(name: 'is_lbc_visualised')
  final int? isLbcVisualised;
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @JsonKey(name: 'segment_name')
  final String? segmentName;
  @JsonKey(name: 'division_name')
  final String? divisionName;

  Data({
    this.id,
    this.productName,
    this.compositionName,
    this.productImage,
    this.productPrice,
    this.productPack,
    this.isLbcVisualised,
    this.categoryName,
    this.segmentName,
    this.divisionName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
