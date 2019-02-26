import 'package:shared_preferences/shared_preferences.dart';

const String ACCOUNT_INFO = 'account';
const String PERSONAL_INFO = 'personal';

class SharePreferenceUtil {
    static dynamic get(String key) async {
        return (await SharedPreferences.getInstance()).get(key);
    }

    static Future set(String key, String value) async {
        var sp = await SharedPreferences.getInstance();
        sp.setString(key, value);
        return null;
    }

    static remove(List<String> keys) async {
        var preferences = await SharedPreferences.getInstance();
        keys.forEach((key) async {
            await preferences.remove(key);
        });
    }
}