import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/setting.dart';

var settingProvider = StateProvider<SettingModel>((ref) => SettingModel());
