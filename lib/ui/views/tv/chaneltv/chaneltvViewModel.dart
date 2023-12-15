import 'package:tela/app/app.locator.dart';
import 'package:tela/app/app.router.dart';
import 'package:tela/models/programetv.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/tv_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelTvViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();
  final TVService _tvService = locator<TVService>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  List<TelaProgrammeTV> program = [];
  ChannelTvViewModel(){
    program = _tvService.progTest();
  }

  void navigateToEbank() async{
    _tvService.pausePub();
    await _navigationService.navigateToBank(hasEpargne: _authService.bankProfile?.hasEpargne??false);
  }
  void navigateToProfile() async{
    _tvService.pausePub();
    await _navigationService.navigateTo(Routes.profile);
  }
  void navigateToTV() async{
    _tvService.pausePub();
    await _navigationService.navigateTo(Routes.chanelTv);
  }
  void navigateToprogTV() async{
    _tvService.pausePub();
    await _navigationService.navigateTo(Routes.programmeTv);
  }

  void navigateToRechercheBureau() async{
    _tvService.pausePub();
    await _navigationService.navigateToRecherche(isBureau: true);
  }
  void navigateToRechercheLogement() async{
    _tvService.pausePub();
    await _navigationService.navigateToRecherche(isBureau: false);
  }
  void navigateToGalery() async{
    _tvService.pausePub();
    await _navigationService.navigateTo(Routes.catalogue);
  }
  void navigateToAcceuil() async{
    _tvService.pausePub();
    await _navigationService.navigateTo(Routes.acceuil);
  }
  void navigateToLiveTV() async{
    _tvService.pausePub();
    await _navigationService.navigateToBientot();
  }
  void navigateToLiveTVSport() async{
    _tvService.pausePub();
    await _navigationService.navigateToTvSport(link: 'https://www.telaci.com/assets/videos/exclu_tela.mp4');
  }
  void navigateToLive() async{
    _tvService.pausePub();
    await _navigationService.navigateToTvSport(link: 'https://www.telaci.com/assets/videos/annonces/1million.mp4');
  }


}