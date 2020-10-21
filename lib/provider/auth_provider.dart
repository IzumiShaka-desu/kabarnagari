import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:kabarnagari/models/profile.dart';
import 'package:kabarnagari/service/network_service.dart';
import 'package:kabarnagari/service/sharepref_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin;
  String _email;
  int _idUser;
  Profile _profile;
  SPrefService _sPrefService = SPrefService();
  NetworkService _networkService = NetworkService();

  Profile get profile => _profile;
  bool get loginStatus => _isLogin;
  String get email => _email;
  int get uid => _idUser;

  AuthProvider.initWithStateLogin() {
    loadLoginStatus();
  }

  Future<void> loadLoginStatus() async {
    _isLogin = await _sPrefService.getLoginStatus();
    if (_isLogin) {
      Map data = await _sPrefService.getLoginDetails();
      _email = data['email'];
      _idUser = data['idUser'];
      try {
        _profile = await _networkService.getProfile(data['idUser']);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    Map result;
    try {
      result = await _networkService.login(email, password);
      if (result['result']) {
        _sPrefService.saveLoginDetails(
            email, int.tryParse(result['data']['id_user']));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    Timer(Duration(milliseconds: 250), () {
      loadLoginStatus();
      notifyListeners();
    });
    return result['result'] ?? false;
  }

  Future<void> logOut() async {
    _sPrefService.removeLoginDetails();
    _email = null;
    _idUser = null;
    _profile = null;
    loadLoginStatus();
    notifyListeners();
  }
}
