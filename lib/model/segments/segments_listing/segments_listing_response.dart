import 'package:json_annotation/json_annotation.dart';

part 'segments_listing_response.g.dart';

@JsonSerializable()
class SegmentsListingResponse {
  final String? result;
  final String? message;
  final List<SegmentData>? data;

  SegmentsListingResponse({this.result, this.message, this.data});

  factory SegmentsListingResponse.fromJson(Map<String, dynamic> json) =>
      _$SegmentsListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentsListingResponseToJson(this);
}

@JsonSerializable()
class SegmentData {
  final int? id;

  @JsonKey(name: 'segment_name')
  final String? segmentName;

  @JsonKey(name: 'division_id')
  final int? divisionId;

  @JsonKey(name: 'division_name')
  final String? divisionName;

  SegmentData({
    this.id,
    this.segmentName,
    this.divisionId,
    this.divisionName,
  });

  factory SegmentData.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
