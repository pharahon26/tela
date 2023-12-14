import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TvViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  TvViewModel();


}