// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divisions_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DivisionsListingResponse _$DivisionsListingResponseFromJson(
        Map<String, dynamic> json) =>
    DivisionsListingResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DivisionsListingResponseToJson(
        DivisionsListingResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      divisionName: json['divisionName'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'divisionName': instance.divisionName,
    };
