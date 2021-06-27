import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class FeatureToggle {
  factory FeatureToggle() {
    return _instance;
  }
  FeatureToggle._privateConstractor();

  static final FeatureToggle _instance = FeatureToggle._privateConstractor();

  List? data;

  Future<bool> loadJsonData() async {
    final jsonText = await rootBundle.loadString('assets/features.json');
    data = json.decode(jsonText);
    return true;
  }

  bool getFeatureStatus({required String key}) {
    final itemCount = data == null ? 0 : (data?.length ?? 0);

    for (var index = 0; index < itemCount; index++) {
      final _key = data?[index]['name'];
      if (_key != null) {
        if (_key == key) {
          return data?[index]['visible'] ?? false;
        }
      }
    }

    return false;
  }
}
