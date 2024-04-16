import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragde with ChangeNotifier {
  static late SharedPreferences _sharedPrefOject;
  bool _isFirstTime = true;
  bool _isTM = true;

  createSharedPrefObject() async {
    _sharedPrefOject = await SharedPreferences.getInstance();
  }

  // LANGUAGE FUNCTIONS
  bool getLang() => _isTM;

  void changeLang() {
    _isTM = !_isTM;
    saveLangtoSharedPref(_isTM);
    notifyListeners();
  }

  saveLangtoSharedPref(bool value) {
    _sharedPrefOject.setBool("lang", value);
  }

  getLangFromSharedPref() {
    if (_sharedPrefOject.getBool("lang") == null) {
      _isTM = true;
    } else {
      _isTM = _sharedPrefOject.getBool("lang")!;
    }
  }

  // FIRST TIME FUNCTIONS
  bool getFirstTime() => _isFirstTime;

  void changeFirstTime() {
    _isFirstTime = !_isFirstTime;
    saveFirstTimetoSharedPref(_isFirstTime);
    notifyListeners();
  }

  saveFirstTimetoSharedPref(bool value) {
    _sharedPrefOject.setBool("first_time", value);
  }

  getFirstTimeFromSharedPref() {
    if (_sharedPrefOject.getBool("first_time") == null) {
      _isFirstTime = true;
    } else {
      _isFirstTime = _sharedPrefOject.getBool("first_time")!;
    }
  }
}
