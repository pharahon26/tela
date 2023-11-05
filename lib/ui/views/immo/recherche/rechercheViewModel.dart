import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/place_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RechercheViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  PlaceService _placeService = locator<PlaceService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  bool isBureau = false;
  late Commune commune;


  bool isMaisonBasse = false;
  bool isAppart = false;
  bool isDuplex = false;
  bool isHautStanding = false;
  bool hasPiscine = false;
  bool hasGardien = false;
  bool hasGarage = false;
  bool hasCoursAvant = false;
  bool hasCoursArriere = false;

  int nombreDePieces = 1;
  int nombreDeSalleDeau = 1;

  List<Commune> communes = [];
  List<DropdownMenuItem<Commune>> dropDownItems = [];
  RechercheViewModel(){
    communes = _authService.getCommunes();
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
    }}

  void search(){
    _placeService.search(
        communeId: commune.id,
        nombrePiece: nombreDePieces,
        nombreSalleEau: nombreDeSalleDeau,
        minPrice: null,
        maxPrice: null,

    );
  }

  void navigateToEbank() async{
    await _navigationService.navigateTo(Routes.bank);
  }
  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }
  void navigateToTV() async{
    await _navigationService.navigateTo(Routes.programmeTv);
  }
  void navigateToRechercheBureau() async{
    await _navigationService.navigateToRecherche(isBureau: true);
  }
  void navigateToRechercheLogement() async{
    await _navigationService.navigateToRecherche(isBureau: false);
  }
  void navigateToGalery() async{
    await _navigationService.navigateTo(Routes.galerie);
  }
  void navigateToAcceuil() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }


}