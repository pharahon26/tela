import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResultatViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  PassVisite? get passVisite => _authService.passVisite;
  ResultatViewModel();

  void navigateToVisite(TelaPlace place) async{
    // await _authService.moin1Visite(code: passVisite!.code, placeID: place.id);

    await _navigationService.navigateToVisite(place: place);
  }


}