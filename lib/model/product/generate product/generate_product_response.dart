import 'package:json_annotation/json_annotation.dart';

part 'generate_product_response.g.dart';

@JsonSerializable()
class GeneratePdfResponse {
  final String? result;
  final String? message;
  final String? data;

  GeneratePdfResponse({this.result, this.message, this.data});

  factory GeneratePdfResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneratePdfResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratePdfResponseToJson(this);
}
