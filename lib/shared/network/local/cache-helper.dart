import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sp ; // sp = shared preferences
  static init () async {
  sp = await SharedPreferences.getInstance() ;
  }

  static Future <bool> putBoolean ({
    required String key ,
    required bool value ,
  }) async => await sp.setBool(key, value);

  static bool? getBoolean ({required String key ,})=> sp.getBool(key);

}