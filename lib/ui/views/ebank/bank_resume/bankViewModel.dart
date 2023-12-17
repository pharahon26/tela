import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BankViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();
  AuthService authService = locator<AuthService>();
  TransactionService transactionService = locator<TransactionService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();


  BankViewModel();

  void navigateToEbank() async{
    await _navigationService.navigateToBank(hasEpargne: authService.bankProfile?.hasEpargne??false);
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

  void navigateToIdentification() async{
    await _navigationService.navigateToIdentificationView();
  }

  void navigateToSignIn() async{
    await _navigationService.navigateToEbankSignInView();
  }

  void navigateToLogin() async{
    await _navigationService.navigateToEbankLoginView();
  }
  void navigateTochangePhoto() async{
    await _navigationService.navigateToPhotoChangeView(fromBank: true);
  }
  changeMDP(){
    _navigationService.navigateToPasswordChangeView(fromBank: true);
  }

  deconnection() {
    authService.logout();
    navigateToAcceuil();
  }
}