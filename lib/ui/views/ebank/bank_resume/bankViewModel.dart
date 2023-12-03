import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BankViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  BankViewModel();

  void navigateToEbank() async{
    await _navigationService.navigateTo(Routes.bank);
  }
  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }
  void navigateToTV() async{
    await _navigationService.navigateTo(Routes.chanelTv);
  }
  void navigateToprogTV() async{
    await _navigationService.navigateTo(Routes.programmeTv);
  }
  void navigateToRechercheBureau() async{
    await _navigationService.navigateToRecherche(isBureau: true);
  }
  void navigateToRechercheLogement() async{
    await _navigationService.navigateToRecherche(isBureau: false);
  }
  void navigateToDepot() async{
    await _navigationService.navigateToDepot();
  }
  void navigateToGalery() async{
    await _navigationService.navigateTo(Routes.catalogue);
  }
  void navigateToAcceuil() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }
  void navigateToCGUFinance() async{
    await _navigationService.navigateTo(Routes.conditionGeneralDUtilisationSFinance);
  }

}