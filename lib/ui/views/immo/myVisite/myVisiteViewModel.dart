import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/place.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/place_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VisiteViewModel extends BaseViewModel{

  NavigationService _navigationService = locator<NavigationService>();
  PlaceService _placeService = locator<PlaceService>();
  AuthService authService = locator<AuthService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  VisiteViewModel(){
    print('+***********USER PHOTO');
    print('${authService.user!.photo}');
  }

  void navigateToProfile() async{
    await _navigationService.navigateTo(Routes.acceuil);
  }
  void navigateToModifPlace(TelaPlace place) async{
    await _navigationService.navigateToModifPlace(place: place);
  }
  void navigateToImageNav(List<String> images, int index) async{
    await _navigationService.navigateToImageNav(images: images, startIndex: index);
  }

  void deletePlace(TelaPlace place) async{
    await _placeService.deletePlace(place: place).whenComplete(() => _navigationService.popRepeated(1));

  }


}