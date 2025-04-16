import 'package:json_annotation/json_annotation.dart';

part 'generate_product_response.g.dart';

@JsonSerializable()
class GenerateProductResponse {
  final String? result;
  final String? message;
  final String? data;

  GenerateProductResponse({this.result, this.message, this.data});

  factory GenerateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateProductResponseToJson(this);
}
