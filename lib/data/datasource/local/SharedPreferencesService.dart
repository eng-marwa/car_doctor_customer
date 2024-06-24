import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService<T extends JsonSerializable> {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  // Save object to shared preferences
  Future<void> saveObject(String key, T? object) async {
    final jsonObject = jsonEncode(object?.toJson());
    await sharedPreferences.setString(key, jsonObject);
  }

  // Retrieve object from shared preferences
  T? getObject(String key, T Function(Map<String, dynamic>) fromJson) {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }
}