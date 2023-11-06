import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VisiteAbonnementViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();

  AuthService _authService = locator<AuthService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();

  bool _isA = false;


  Stream<bool> get isAuth => _authService.isConnected;
  User? get user => _authService.user;

  VisiteAbonnementViewModel();

  void navigateToEbank() async{
    await _navigationService.navigateTo(Routes.bank);
  }
  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.profile);
  }
  void navigateToTV() async{
    await _navigationService.navigateTo(Routes.programmeTv);
  }
  void navigateToRechercheBureau() async{
    await _navigationService.navigateToRecherche(isBureau: true);
  }
  void navigateToRechercheLogement() async{
    await _navigationService.navigateToRecherche(isBureau: false);
  }
  void navigateToGalery() async{
    await _navigationService.navigateTo(Routes.galerie);
  }
  void navigateToAcceuil() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }
  void navigateToSignIn() async{
    await _navigationService.navigateTo(Routes.signInView);
  }
  void navigateToLogIn() async{
    await _navigationService.navigateTo(Routes.loginView);
  }
  void navigateToBuyView( String abonnement, double price,) async{
    await _navigationService.navigateToBuyView(abonement: 'Payer Abonnement \n $abonnement', prix: price);
  }

}