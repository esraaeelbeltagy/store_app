import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;
 //! to intialize the object of shared prefrences in a function to call it in main function
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
//! to set values in shared prefrences 
  static Future<void> set({required String key, required dynamic value}) async {
    if (value is bool) {
      await sharedPreferences!.setBool(key, value);
    } else if (value is int) {
      await sharedPreferences!.setInt(key, value);
    } else if (value is double) {
      await sharedPreferences!.setDouble(key, value);
    } else if (value is String) {
      sharedPreferences!.getString(key);
    } else if (value is List<String>) {
      await sharedPreferences!.setStringList(key, value);
    }
  }
//! to get the value by the key 
  static Future<dynamic> get({required String key}) async {
    sharedPreferences!.get(key);
  }
//! to remove one element bt its key 
  static Future<void> remove({required String key})async{
    sharedPreferences!.remove(key);
  }

  //! to clear the shared prefrences
  static Future<void> clear()async{
    sharedPreferences!.clear();
  }
}
