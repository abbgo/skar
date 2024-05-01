class SettingModel {
  final bool isFirstTime;
  final bool isTM;

  SettingModel({this.isFirstTime = true, this.isTM = true});

  SettingModel copyWith({
    bool? isFirstTime,
    bool? isTM,
  }) {
    return SettingModel(
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isTM: isTM ?? this.isTM,
    );
  }
}
