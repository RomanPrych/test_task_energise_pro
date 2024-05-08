import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_energise_pro/ui/home/home_model_data.dart';
import 'package:test_task_energise_pro/ui/home/home_state.dart';

class HomeController extends Cubit <HomeState>{
  HomeController() : super(LoadingHomeState()){
    emit(HomeStateData(data));
  }
  HomeModelData data = HomeModelData(indexPage: 0);

  void changeIndex(int index) {
    data.indexPage = index;
    emit(HomeStateData(data));
  }

}