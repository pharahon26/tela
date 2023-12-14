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

class BuyViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  TransactionService _transactionService = locator<TransactionService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  User? get user => _authService.user;

  BuyViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }
  Future<String> getTransactioNumber() async {
    return await _transactionService.getTransactionNumber('Abonnement');
  }
  Future pushTransaction(TelaTransaction transaction, AbonnementType abonnement) async {
    await _transactionService.buyAbonnement(transaction: transaction, abonnement: abonnement, userId: _authService.user!.id).then((value) {
      _authService.abonnement = value;
      navigateToProfile();
    });
  }


}