// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_and_days_left_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusAndDaysLeft _$StatusAndDaysLeftFromJson(Map<String, dynamic> json) =>
    StatusAndDaysLeft(
      json['daysLeft'] as int,
      json['lastActive'],
      json['status'] as String,
    );

Map<String, dynamic> _$StatusAndDaysLeftToJson(StatusAndDaysLeft instance) =>
    <String, dynamic>{
      'daysLeft': instance.daysLeft,
      'lastActive': instance.lastActive,
      'status': instance.status,
    };
