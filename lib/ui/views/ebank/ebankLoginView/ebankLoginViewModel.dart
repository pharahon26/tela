import 'dart:async';
import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/bank_profile.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EbankLoginViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String phone='';
  String password='';


  EbankLoginViewModel(){
    getPhone();
    _authService.getAbonnementSaved();
    print('***** Phone $phone ****');
  }

  Future login() async {
    TelaBankProfile? u = await _authService.loginEBank(
        phone: phone,
        password: password)
        .whenComplete(() {
          _sharedPrefs.savePhoneNumber(phone);
          _navigationService.navigateToBank(hasEpargne: _authService.bankProfile?.hasEpargne??false);
        })
    ;
    return u;
  }

  void getPhone() async {
    phone = _sharedPrefs.getPhoneNumber()??'';
    print('***** Phone $phone ****');
    notifyListeners();
  }

  void navigateToProfile(){
    _navigationService.navigateToProfile();
  }

  // void fakeLogin(){C

}