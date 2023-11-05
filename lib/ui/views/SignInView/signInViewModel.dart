import 'dart:async';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel{

  AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  String nom='';
  String prenom='';
  String phone='';
  String mail='';
  String password='';
  bool isDemarcheur =false;


  SignInViewModel();


  Future signIn() async {
    // Users u = await _pyraAPIService.signIn(
    //     username: username,
    //     firstname: user.firstname,
    //     lastname: user.lastname,
    //     password: password,
    //     period: user.period);
    // return u;
  }

  void fakeSignIn(){
    _authService.createFakeUser(nom: nom, prenom: prenom, telephone: phone, password: password, mail: mail, demarcheur: isDemarcheur);
    _navigationService.navigateToProfile();
  }

  @override
  void dispose() {
    super.dispose();
  }
}