// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateListResponse _$StateListResponseFromJson(Map<String, dynamic> json) =>
    StateListResponse(
      result: json['result'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StateListResponseToJson(StateListResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

StateData _$StateDataFromJson(Map<String, dynamic> json) => StateData(
      id: (json['id'] as num?)?.toInt(),
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$StateDataToJson(StateData instance) => <String, dynamic>{
      'id': instance.id,
      'state_name': instance.stateName,
    };
