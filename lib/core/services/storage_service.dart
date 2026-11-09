import 'package:injectable/injectable.dart';
import 'package:universitys_gate/core/storage/app_preferences.dart';

@lazySingleton
class StorageService {
  final AppPreferences appPreferences;

  StorageService(this.appPreferences);
}
