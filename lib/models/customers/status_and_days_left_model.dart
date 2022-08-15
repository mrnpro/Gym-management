import 'package:json_annotation/json_annotation.dart';
part 'status_and_days_left_model.g.dart';

@JsonSerializable()
class StatusAndDaysLeft {
  final int daysLeft;
  final lastActive;
  final String status;

  StatusAndDaysLeft(this.daysLeft, this.lastActive, this.status);
  factory StatusAndDaysLeft.fromJson(Map<String, dynamic> json) =>
      _$StatusAndDaysLeftFromJson(json);
  Map<String, dynamic> toJson() => _$StatusAndDaysLeftToJson(this);
}
