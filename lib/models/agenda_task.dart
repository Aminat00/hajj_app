import 'package:json_annotation/json_annotation.dart';

part 'agenda_task.g.dart';

@JsonSerializable()
class AgendaTask {
  final String header;
  final String body;
  bool favourite;
  bool done;

  AgendaTask({required this.header, required this.body, this.favourite = false, this.done = false});

  factory AgendaTask.fromJson(Map<String, dynamic> json) => _$AgendaTaskFromJson(json);

  Map<String, dynamic> toJson() => _$AgendaTaskToJson(this);
}
