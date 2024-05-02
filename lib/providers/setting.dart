import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/setting.dart';

class SettingNotifier extends StateNotifier<SettingModel> {
  // SettingNotifier() : super(SettingModel(isFirstTime: true, isTM: true));
  SettingNotifier() : super(SettingModel(isFirstTime: 1, isTM: 1));

  void updateUser(SettingModel newSetting) {
    state = newSetting;
  }
}

var settingProvider = StateNotifierProvider<SettingNotifier, SettingModel>(
    (ref) => SettingNotifier());
