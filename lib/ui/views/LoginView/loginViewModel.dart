import 'dart:async';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  String phone='';
  String mail='';
  String password='';


  LoginViewModel();

  Future login() async {
    // Users u = await _pyraAPIService.login(
    //     username: username,
    //     password: password);
    // return u;
  }

  void fakeLogin(){
    _authService.getFakeUser(demarcheur: true);
    _navigationService.navigateToProfile();
  }

  @override
  void dispose() {
    super.dispose();
  }
}