// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomersModel _$CustomersModelFromJson(Map<String, dynamic> json) =>
    CustomersModel(
      json['fullname'] as String,
      json['age'] as String,
      json['phone'] as String,
      json['registereddate'],
      json['photoUrl'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$CustomersModelToJson(CustomersModel instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'age': instance.age,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'id': instance.id,
      'registereddate': instance.registereddate,
    };
