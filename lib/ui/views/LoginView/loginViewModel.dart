import 'dart:async';
import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/user.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String phone='';
  String password='';


  LoginViewModel(){
    getPhone();
    _authService.getAbonnementSaved();
    print('***** Phone ${phone} ****');
  }

  Future login() async {
    User? u = await _authService.login(
        phone: phone,
        password: password)
        .whenComplete(() {
          _sharedPrefs.savePhoneNumber(phone);

        })
    ;
    return u;
  }

  void getPhone() async {
    phone = _sharedPrefs.getPhoneNumber()??'';
    print('***** Phone ${phone} ****');
    notifyListeners();
  }

  void navigateToProfile(){
    _navigationService.navigateToProfile();
  }

  // void fakeLogin(){C

  @override
  void dispose() {
    super.dispose();
  }
}