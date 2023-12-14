import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/place.dart';
import 'package:tela/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MaisonVisiteViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  AuthService _authService = locator<AuthService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  Future<List<TelaPlace>> get getMyPlaces => _authService.getMaisonsVisite();

  MaisonVisiteViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateToProfile();
  }

  void navigateToMyVisite(TelaPlace place) async{
    await _navigationService.navigateToVisite(place: place);
  }
}