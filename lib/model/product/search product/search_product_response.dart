import 'package:json_annotation/json_annotation.dart';

import '../product_listing/product_listing_response.dart';

part 'search_product_response.g.dart';

@JsonSerializable()
class SearchProductResponse {
  final String? result;
  final String? message;
  final List<ProductData>? data;

  SearchProductResponse({this.result, this.message, this.data});

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductResponseToJson(this);
}

