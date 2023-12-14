import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VersementViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  AuthService authService = locator<AuthService>();
  TransactionService transactionService = locator<TransactionService>();

  double montant = 0;


  VersementViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }

  void navigateToBank() async{
    await _navigationService.navigateToBank(hasEpargne: authService.bankProfile?.hasEpargne??false);
  }


}