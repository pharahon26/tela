import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/programetv.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/tv_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProgrammeTvViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  TVService _tvService = locator<TVService>();
  AuthService _authService = locator<AuthService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();

  List<TelaProgrammeTV> program = [];
  ProgrammeTvViewModel(){
    program = _tvService.progTest();
  }

  void navigateToEbank() async{
    await _navigationService.navigateToBank(hasEpargne: _authService.bankProfile?.hasEpargne??false);
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
  void navigateToLiveTV(TelaProgrammeTV programmeTV) async{
    await _navigationService.navigateToTv(programmeTV: programmeTV);
  }


}