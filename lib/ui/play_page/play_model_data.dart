import 'package:test_task_energise_pro/common/extensions/int_extension.dart';

class PlayModelData {
  PlayModelData({
    this.seconds,
    this.minutes,
    this.hours,
    this.isPlayed,
  });

  int? hours;
  int? minutes;
  int? seconds;
  bool? isPlayed;

  String get getHours => hours.asTime;

  bool get getIsPlayed => isPlayed == true ? true : false;

  String get getMinutes => minutes.asTime;

  String get getSeconds => seconds.asTime;
}
