import 'package:json_annotation/json_annotation.dart';

part 'state_list_response.g.dart';

@JsonSerializable()
class StateListResponse {
  final String? result;
  final String? message;
  final List<StateData>? data;

  StateListResponse({this.result, this.message, this.data});

  factory StateListResponse.fromJson(Map<String, dynamic> json) =>
      _$StateListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StateListResponseToJson(this);
}

@JsonSerializable()
class StateData {
  final int? id;

  @JsonKey(name: 'state_name')
  final String? stateName;

  StateData({this.id, this.stateName});

  factory StateData.fromJson(Map<String, dynamic> json) => _$StateDataFromJson(json);

  Map<String, dynamic> toJson() => _$StateDataToJson(this);
}
