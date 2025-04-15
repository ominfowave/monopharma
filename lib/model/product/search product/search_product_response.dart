import 'package:json_annotation/json_annotation.dart';

part 'search_product_response.g.dart';

@JsonSerializable()
class SearchProductResponse {
  final String? result;
  final String? message;
  final List<Data>? data;

  SearchProductResponse({this.result, this.message, this.data});

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int? id;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'product_image')
  final String? productImage;

  @JsonKey(name: 'product_price')
  final String? productPrice;

  Data({
    this.id,
    this.productName,
    this.productImage,
    this.productPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
