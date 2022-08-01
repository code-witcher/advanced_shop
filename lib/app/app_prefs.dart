import 'package:advanced_shop/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences preferences;

  const AppPreferences(this.preferences);

  Future<String> getAppLang() async {
    final language = preferences.getString(langPrefsKey);

    if (language == null || language.isEmpty) {
      return LanguageType.English.value;
    }
    return language;
  }
}

const langPrefsKey = 'language_key';
