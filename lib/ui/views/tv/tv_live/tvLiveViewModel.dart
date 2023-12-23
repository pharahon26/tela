import 'package:mobile/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mobile/services/tv_service.dart';

class TvLiveViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final TVService tvService = locator<TVService>();


  TvLiveViewModel(){
    tvService.pause();
    tvService.playLive();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tvService.pause();
    tvService.playPub();

  }

}