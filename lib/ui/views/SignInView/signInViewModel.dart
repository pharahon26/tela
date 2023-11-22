import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel{

  AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String nom='SEREME';
  String prenom='Habib Seydou Laty 2';
  String phone='+225 07 00 00 00 00';
  String birthPlace='';
  String password='';
  bool isAccepted =false;
  File? photo;


  SignInViewModel();


  Future<User?> signIn() async {
    User? u = await _authService.signIn(nom: nom, prenom: prenom, telephone: phone, password: password, mail: birthPlace);
    _sharedPrefs.savePhoneNumber(phone);
    _navigationService.navigateToProfile();
    return u;
  }
  Future pickPhoto() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      photo = File(result.files.single.path!);
    } else {

    }
  }

  void navigateToCGU() async{
    await _navigationService.navigateTo(Routes.conditionGeneralDUtilisationS);
  }

  @override
  void dispose() {
    super.dispose();
  }
}