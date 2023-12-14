import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/abonnement.dart';
import 'package:tela/models/abonnementType.dart';
import 'package:tela/models/transactions.dart';
import 'package:tela/models/user.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RenewPassViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  TransactionService _transactionService = locator<TransactionService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  User? get user => _authService.user;

  RenewPassViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }
  void navigateToBack() async{
    _navigationService.navigateToAcceuil();
  }

  Future<String> getTransactioNumber(PassType passType) async {
    return await _transactionService.getTransactionNumber(passType.isVisite? 'Visite' : 'TV');
  }
  Future<PassVisite?> pushTransaction(TelaTransaction transaction, PassType passType, PassVisite passVisite) async {
    return await _transactionService.renewPassVisite(transaction: transaction, pass: passType, passVisit: passVisite);
  }


}