import 'package:flutter/material.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv_sport/tvSportViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:mobile/ui/views/tv_sport/tvSportViewModel.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app/app.locator.dart';

class TvSport extends StatefulWidget {
  final String link;
  const TvSport({super.key, required this.link});

  @override
  State<TvSport> createState() => _TvSportState();
}

class _TvSportState extends State<TvSport> {

  late VideoPlayerController videoController;
  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    super.initState();
    _tvService.pausePub();
      videoController = VideoPlayerController.networkUrl(Uri.parse(widget.link));
    DateTime time = DateTime.now();

    videoController.setLooping(true);
    videoController.initialize().then((_) {
      videoController.seekTo(Duration(minutes: time.minute, seconds: time.second));
      setState(() {});
    });
      videoController.addListener(() {
        setState(() {});
      });
    videoController.play();

  }

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<TvSportViewModel>.reactive(
      viewModelBuilder: () => TvSportViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
          body: Center(
            child: AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(videoController, key: UniqueKey(),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/images/exclu.png',)),
                    ),
                  ),
                ],
              ),
            ),

          ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
    _tvService.playPub();
    }

}
