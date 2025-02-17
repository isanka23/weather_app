import 'package:shared_preferences/shared_preferences.dart';

class ThemePersistance {
  Future <void> storeTheme (bool isDark)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    prefs.setBool('isDark', isDark);
  }

  Future <bool> getTheme () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    return prefs.getBool('isDark') ?? false;
  }
}