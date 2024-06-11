import 'package:drift/drift.dart';

class FormUtil {
  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required *';
    }
    return null;
  }

  static Value<String?> getValue(String? value) {
    if (value == null || value.isEmpty) {
      return Value(null);
    }
    return Value(value);
  }

  static Value<int?> getIntValue(String? value) {
    if (value == null || value.isEmpty) {
      return Value(null);
    }
    return Value(int.parse(value));
  }

  static Value<int> getIntValueWithDefault(String? value, int defaultValue) {
    if (value == null || value.isEmpty) {
      return Value(defaultValue);
    }
    return Value(int.parse(value));
  }

  static int? getInt(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return int.parse(value);
  }
}
