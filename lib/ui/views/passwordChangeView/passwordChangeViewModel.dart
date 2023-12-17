import 'dart:async';
import 'dart:io';
import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/user.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PasswordChangeViewModel extends BaseViewModel{

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String passwordn='';
  String password='';


  PasswordChangeViewModel();


  Future changeMDP() async {
    User? u = await _authService.changeMDP(password: passwordn, oldPassword: password, phone: _authService.user!.phone);
    _navigationService.navigateToProfile();
    return u;
  }


}