// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status-change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusChange _$StatusChangeFromJson(Map<String, dynamic> json) {
  return StatusChange(
    oldState: json['oldState'] as String,
    newState: json['newState'] as String,
    timestamp: json['timestamp'] as String,
    uid: json['uid'] as String,
  );
}

Map<String, dynamic> _$StatusChangeToJson(StatusChange instance) =>
    <String, dynamic>{
      'oldState': instance.oldState,
      'newState': instance.newState,
      'timestamp': instance.timestamp,
      'uid': instance.uid,
    };
