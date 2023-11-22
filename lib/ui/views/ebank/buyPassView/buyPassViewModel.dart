import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyPassViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  TransactionService _transactionService = locator<TransactionService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  User? get user => _authService.user;

  BuyPassViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }

  Future<String> getTransactioNumber(PassType passType) async {
    return await _transactionService.getTransactionNumber(passType.isVisite? 'Visite' : 'TV');
  }
  Future<PassVisite?> pushTransaction(TelaTransaction transaction, PassType passType) async {
    return await _transactionService.buyPassVisite(transaction: transaction, pass: passType);
  }


}