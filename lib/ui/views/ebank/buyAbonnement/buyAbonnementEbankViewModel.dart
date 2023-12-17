import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/abonnementType.dart';
import 'package:tela/models/user.dart';
import 'package:tela/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tela/services/transaction_service.dart';

class BuyAbonnementEbankViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();

  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final TransactionService _transactionService = locator<TransactionService>();

  final bool _isA = false;
  final bool fromEpargne;
  List<AbonnementType> abonnements = [];

  Stream<bool> get isAuth => _authService.isConnected;
  User? get user => _authService.user;

  BuyAbonnementEbankViewModel(this.fromEpargne){
    abonnements = _authService.abonnementType;
  }

  Future buyAbonnement( AbonnementType abonnement) async{
    await _transactionService.buyAbonnementFromEbank(abonnement: abonnement, profile: _authService.bankProfile!, user: _authService.user!, fromEpargne: fromEpargne);
  }

  void navigateToCGUFinance() async{
    await _navigationService.navigateTo(Routes.conditionGeneralDUtilisationSFinance);
  }
}