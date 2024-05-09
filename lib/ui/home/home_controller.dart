import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_energise_pro/common/constants.dart';
import 'package:test_task_energise_pro/common/di/di.dart';
import 'package:test_task_energise_pro/common/enums/supported_locales.dart';
import 'package:test_task_energise_pro/common/extensions/string_extension.dart';
import 'package:test_task_energise_pro/data/repo/shared_preferences/shared_preference.dart';
import 'package:test_task_energise_pro/ui/home/home_model_data.dart';
import 'package:test_task_energise_pro/ui/home/home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(LoadingHomeState()) {
    _getSavedLocale();

  }
  final SharedPreference _sharedPreference = locator.get<SharedPreference>();

  final HomeModelData _data = HomeModelData(
    indexPage: 0,
    appLocale: SupportedLocales.en,
  );

  Future<void> _getSavedLocale() async {
    String localeSaved =
    await _sharedPreference.getStringPreferenceValue(Const.localeLng);
    _data.appLocale = localeSaved.appLocaleFromString();
    emit(HomeStateData(_data));
  }

  void changeData({int? index, SupportedLocales? appLocale}) {
    if (index != null) {
      _data.indexPage = index;
    }
    if (appLocale != null) {
      _data.appLocale = appLocale;
    }
    emit(HomeStateData(_data));
  }
}
