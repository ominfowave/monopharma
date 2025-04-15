import 'package:json_annotation/json_annotation.dart';

part 'user_all_pdf_response.g.dart';

@JsonSerializable()
class UserAllPdfResponse {
  final String? result;
  final String? message;
  final List<Data>? data;

  UserAllPdfResponse({this.result, this.message, this.data});

  factory UserAllPdfResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAllPdfResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserAllPdfResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int? id;
  final String? url;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  Data({this.id, this.url, this.createdAt});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
