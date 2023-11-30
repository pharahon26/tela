import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/place_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VisiteViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  PlaceService _placeService = locator<PlaceService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  VisiteViewModel();

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }
  void navigateToModifPlace(TelaPlace place) async{
    await _navigationService.navigateToModifPlace(place: place);
  }
  void deletePlace(TelaPlace place) async{
    await _placeService.deletePlace(place: place).whenComplete(() => _navigationService.popRepeated(1));

  }


}