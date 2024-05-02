class SettingModel {
  final int isFirstTime;
  final int isTM;

  SettingModel({required this.isFirstTime, required this.isTM});

  factory SettingModel.defaultSetting() {
    return SettingModel(
      isFirstTime: 1,
      isTM: 1,
    );
  }

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      isFirstTime: json['is_first_time'],
      isTM: json['is_tm'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_first_time': isFirstTime,
      'is_tm': isTM,
    };
  }
}
