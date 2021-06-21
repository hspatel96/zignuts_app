import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/PrefKeyConst.dart';
import 'local_data_source_exception.dart';

class PreferenceHelper  {
  const PreferenceHelper();


// save setIsLogged in preference
  Future<void> setIsLogged({bool isLogged}) async {
    bool result;
    try {
      final sharedPreference = await SharedPreferences.getInstance();
      result = await sharedPreference.setBool(PrefKeyConst.isLoggedUser, isLogged);

    } catch (e) {
      throw LocalDataSourceException('Cannot save isLogged ', e);
    }

    if (!result) {
      throw LocalDataSourceException('Cannot save isLogged ');
    }else{
      print('isLogged==> ');

    }
  }

  // get IsLogged from preference
  Future<bool> getIsLogged() async {
    try {
      final sharedPreference = await SharedPreferences.getInstance();
      var isLogged =  sharedPreference.getBool(PrefKeyConst.isLoggedUser);
      if (isLogged == null) {
        return null;
      }
      return isLogged;
    } catch (e) {
      throw LocalDataSourceException('Cannot get isLogged', e);
    }
  }

  //delete isLogged
  Future<void> deleteIsLogged() async {
    bool result;
    try {
      final sharedPreference = await SharedPreferences.getInstance();
      result = await sharedPreference.remove(PrefKeyConst.isLoggedUser);
    } catch (e) {
      throw LocalDataSourceException('Cannot delete isLoggedUser', e);
    }

    if (!result) {
      throw LocalDataSourceException('Cannot delete isLoggedUser');
    }
  }


}
