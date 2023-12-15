import 'dart:math';

import 'package:tela/app/app.locator.dart';
import 'package:tela/services/tv_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

class PubliciteViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final TVService tvService = locator<TVService>();

  // late VideoPlayerController videoController;



  PubliciteViewModel(){
    // initController();
    tvService.pubVideoController.addListener(() {notifyListeners();});
  }
  //
  // initController() {
  //   DateTime dateTime = DateTime.now();
  //   videoController = VideoPlayerController.networkUrl(Uri.parse("https://www.telaci.com/assets/videos/pub_tela.mp4"));
  //   int t = Random().nextInt(8);
  //   videoController.seekTo(Duration(minutes: t)).then((value) => notifyListeners());
  //
  //   videoController.setLooping(true);
  //
  //   videoController.initialize().then((_) {
  //     notifyListeners();
  //   });
  //   videoController.play();
  //
  // }

  @override
  void dispose() {
    super.dispose();
    // videoController.dispose();
  }

  // void initControllers() async {
  //   List<String> urls = await _tvService.getPublicites();
  //   Future.forEach(urls,(element) async {
  //     videoController = VideoPlayerController.networkUrl(Uri.parse(element));
  //     await videoController.initialize();
  //     videoControllers.add(videoController);
  //   });
  // }

}