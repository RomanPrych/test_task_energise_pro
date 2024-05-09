
abstract class SharedPreference{

  setStringPreferenceValue(String key, String value);

  setIntPreferenceValue(String key, int value);

  setDoublePreferenceValue(String key, double value);

  setBoolPreferenceValue(String key, bool value) ;

  Future<String> getStringPreferenceValue(String key);

  Future<int> getIntPreferenceValue(String key);

  Future<double?> getDoublePreferenceValue(String key);

  Future<bool> getBoolPreferenceValue(String key);

  Future removePreferenceValue(String key);

}