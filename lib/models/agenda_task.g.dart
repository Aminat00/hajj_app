// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaTask _$AgendaTaskFromJson(Map<String, dynamic> json) => AgendaTask(
      header: json['header'] as String,
      body: json['body'] as String,
      favourite: json['favourite'] as bool? ?? false,
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$AgendaTaskToJson(AgendaTask instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
      'favourite': instance.favourite,
      'done': instance.done,
    };
