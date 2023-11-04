import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AcceuilViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  AcceuilViewModel();

  void navigateToEbank() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }


}