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

class BuyPassViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final TransactionService _transactionService = locator<TransactionService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();


  User? get user => _authService.user;

  BuyPassViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }
  void navigateToBack() async{
    _navigationService.navigateToAcceuil();
  }

  Future<String> getTransactioNumber(PassType passType) async {
    return await _transactionService.getTransactionNumber(passType.isVisite? 'Visite' : 'TV');
  }
  Future<PassVisite?> pushTransaction(TelaTransaction transaction, PassType passType) async {
    return await _transactionService.buyPassVisite(transaction: transaction, pass: passType);
  }


}