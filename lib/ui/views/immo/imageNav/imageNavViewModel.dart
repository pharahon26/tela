import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImageNavViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  ImageNavViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }


}