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
  String nom='SEREME';
  String prenom='Habib Seydou Laty 2';
  String phone='+225 07 00 00 00 00';
  String mail='mail2@mail.com';
  String password='';
  bool isDemarcheur =false;


  SignInViewModel();


  Future signIn() async {
    User? u = await _authService.signIn(nom: nom, prenom: prenom, telephone: phone, password: password, mail: mail, isDemarcheur: isDemarcheur);
    _navigationService.navigateToProfile();
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