import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_energise_pro/ui/play_page/play_model_data.dart';
import 'package:test_task_energise_pro/ui/play_page/play_state.dart';

class PlayController extends Cubit<PlayState> {
  PlayController() : super(LoadingPlayState()) {
    emit(PlayStateData(_data));
  }




  final PlayModelData _data = PlayModelData(
    hours: 0,
    minutes: 0,
    seconds: 0,
    isPlayed: false,
  );

  late Timer _timer;

  void _clearTime(){
    _data.hours = 0;
    _data.minutes = 0;
    _data.seconds = 0;
  }

  void onPlayPauseTap() {
    _data.isPlayed == true ? _pause() : _play();
  }

  void _play() {
    if(_data.getIsPlayed){
      return;
    }
    _data.isPlayed = true;
    _clearTime();
     emit(PlayStateData(_data));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _runTime(),
    );
  }

  void dispose(){
    _timer.cancel();
  }

  void _runTime() {
    if (_data.seconds != null && _data.minutes != null && _data.hours != null) {
      if (_data.seconds! < 59) {
        _data.seconds = _data.seconds! + 1;
      } else {
        _data.seconds = 0;
        if (_data.minutes! < 59) {
          _data.minutes = _data.minutes! + 1;
        } else {
          _data.minutes = 0;
          if (_data.hours! < 23) {
            _data.hours = _data.hours! + 1;
          } else {
            _data.hours = 0;
          }
        }
      }
      emit(PlayStateData(_data));
    }
  }



  void _pause() {
    if(!_data.getIsPlayed){
      return;
    }
    _data.isPlayed = false;
    _timer.cancel();
    emit(PlayStateData(_data));
  }
}
