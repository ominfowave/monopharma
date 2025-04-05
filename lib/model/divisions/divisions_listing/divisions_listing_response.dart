import 'package:json_annotation/json_annotation.dart';

part 'divisions_listing_response.g.dart'; // This will be generated

@JsonSerializable()
class DivisionsListingResponse {
  String? result;
  String? message;
  List<Data>? data;

  DivisionsListingResponse({this.result, this.message, this.data});

  factory DivisionsListingResponse.fromJson(Map<String, dynamic> json) =>
      _$DivisionsListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DivisionsListingResponseToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? divisionName;

  Data({this.id, this.divisionName});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}