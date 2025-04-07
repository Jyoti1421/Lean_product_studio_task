// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  year: (json['year'] as num).toInt(),
  color: json['color'] as String,
  pantoneValue: json['pantone_value'] as String,
);

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'year': instance.year,
  'color': instance.color,
  'pantone_value': instance.pantoneValue,
};
