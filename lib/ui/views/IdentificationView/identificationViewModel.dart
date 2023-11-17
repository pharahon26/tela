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

class IdentificationViewModel extends BaseViewModel{

  AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String nom='SEREME';
  String prenom='Habib Seydou Laty';
  String phone='+225 07 00 00 00 00';
  String phone2='+225 07 00 00 00 00';
  String birthPlace='';
  DateTime birthDay = DateTime.now();
  String pays='';
  String nationnalite='';
  String villeResidence ='';
  String docNumber ='';
  File? docRecto;
  File? docVerso;
  bool isAccepted =false;


  IdentificationViewModel(){
    phone = _sharedPrefs.getPhoneNumber()??'';
    nom = _sharedPrefs.getName()??'';
    prenom = _sharedPrefs.getFirstName()??'';
  }


  // Future signIn() async {
  //   User? u = await _authService.signIn(nom: nom, prenom: prenom, telephone: phone, password: password, mail: birthPlace, isDemarcheur: isAccepted);
  //   _sharedPrefs.savePhoneNumber(phone);
  //   _navigationService.navigateToProfile();
  // }

  void navigateToCGU() async{
    await _navigationService.navigateTo(Routes.conditionGeneralDUtilisationS);
  }


  Future pickRecto() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      docRecto = File(result.files.single.path!);
    } else {

    }
  }

  Future pickVerso() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      docVerso = File(result.files.single.path!);
    } else {

    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}