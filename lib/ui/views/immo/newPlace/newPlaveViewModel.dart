import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/place_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewPlaceViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  PlaceService _placeService = locator<PlaceService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  bool havePass = false;

  bool isBureau = false;
  late Commune commune;

  String nomProprio='';
  String phone='';

  Stream<bool> get isAuth => _authService.isConnected;
  bool isMaisonBasse = false;
  bool isAppart = false;
  bool isDuplex = false;
  bool isHautStanding = false;
  bool isHautStandingPicine = false;
  bool hasPiscine = false;
  bool hasGardien = false;
  bool hasGarage = false;
  bool hasCoursAvant = false;
  bool hasCoursArriere = false;
  bool hasBalconAvant = false;
  bool hasBalconArriere = false;

  int nombreDePieces = 1;
  int nombreDeSalleDeau = 1;

  List<Commune> communes = [];
  List<DropdownMenuItem<Commune>> dropDownItems = [];

  List<File?> images = [];
  File? img;
  Future<List<DropdownMenuItem<Commune>> > cc() async {
    if (communes.isEmpty) {
      communes = _authService.communes;
      commune = communes.first;
      for (Commune element in communes) {
        dropDownItems.add(DropdownMenuItem(value: element,
          child: Text(element.name,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1
            ),
          ),
        ));
      }
    }

    return dropDownItems ;
  }

  NewPlaceViewModel(){
    communes = _authService.communes;
    commune = communes.first;
    for(int i = 0; i<10; i++) {
      images.add(null);
    }
  }



  void search() async {
    // _placeService.search(
    //     communeId: commune.id,
    //     nombrePiece: nombreDePieces,
    //     nombreSalleEau: nombreDeSalleDeau,
    //     minPrice: null,
    //     maxPrice: null,
    //
    // );
    List<TelaPlace> plac = await _placeService.getAllPlaces();
    navigateToResult(plac);
  }

  void navigateToResult(List<TelaPlace> places) async{
    await _navigationService.navigateToResultat(places: places);
  }
  void navigateToVisiteAbonnement(bool isVisite) async{
    await _navigationService.navigateToBuyVisitePass( isVisite: isVisite);
  }

  void navigateToEbank() async{
    await _navigationService.navigateTo(Routes.bank);
  }
  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }
  void navigateToTV() async{
    await _navigationService.navigateTo(Routes.chanelTv);
  }
  void navigateToRechercheBureau() async{
    await _navigationService.navigateToRecherche(isBureau: true);
  }
  void navigateToRechercheLogement() async{
    await _navigationService.navigateToRecherche(isBureau: false);
  }
  void navigateToGalery() async{
    await _navigationService.navigateTo(Routes.catalogue);
  }
  void navigateToAcceuil() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }
  void chechPass() async{
  }

  Future pickImage(int position) async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      images[position] = File(result.files.single.path!);
    } else {

    }
  }


}