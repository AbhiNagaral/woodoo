import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/app_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences not initialized');
});

final appPreferencesProvider = Provider<AppPreferences>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return AppPreferences(prefs);
});
