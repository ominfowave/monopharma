// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SegmentsListingResponse _$SegmentsListingResponseFromJson(
        Map<String, dynamic> json) =>
    SegmentsListingResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SegmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SegmentsListingResponseToJson(
        SegmentsListingResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

SegmentData _$DataFromJson(Map<String, dynamic> json) => SegmentData(
      id: (json['id'] as num?)?.toInt(),
      segmentName: json['segment_name'] as String?,
      divisionId: (json['division_id'] as num?)?.toInt(),
      divisionName: json['division_name'] as String?,
    );

Map<String, dynamic> _$DataToJson(SegmentData instance) => <String, dynamic>{
      'id': instance.id,
      'segment_name': instance.segmentName,
      'division_id': instance.divisionId,
      'division_name': instance.divisionName,
    };
