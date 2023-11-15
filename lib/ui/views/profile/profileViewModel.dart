import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();

  AuthService _authService = locator<AuthService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();

  bool _isA = false;


  Stream<bool> get isAuth => _authService.isConnected;
  User? get user => _authService.user;
  Abonnement? get abonnement => _authService.abonnement;
  String get stra => _authService.abonnement != null?_authService.abonnement!.startSTR():'Du ...';
  String get enda => _authService.abonnement != null?_authService.abonnement!.endSTR():'Au ...';
  String get strd => _authService.passVisite != null?_authService.passVisite!.startSTR():'Du ...';
  String get endd => _authService.passVisite != null?_authService.passVisite!.endSTR():'Au ...';
  PassVisite? get passVisite => _authService.passVisite;

  ProfileViewModel();

  void navigateToEbank() async{
    await _navigationService.navigateTo(Routes.bank);
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
    await _navigationService.navigateToCatalogue(places: _authService.myPlaces);
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
  void navigateToVisitePass() async{
    await _navigationService.navigateToBuyVisitePass(isVisite: true);
  }
  void navigateToAbonnement() async{
    await _navigationService.navigateToBuyAbonnement();
  }
  void navigateToIdentification() async{
    await _navigationService.navigateToIdentificationView();
  }
  void chechPass() async{
  }

}