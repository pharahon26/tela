import 'package:flutter/material.dart';
import 'package:mobile/ui/views/tv/tv_live/tvLiveViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TvLive extends StatefulWidget {
  final String link;
  const TvLive({super.key, required this.link});

  @override
  State<TvLive> createState() => _TvLiveState();
}

class _TvLiveState extends State<TvLive> {

  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
      videoController = VideoPlayerController.networkUrl(Uri.parse(widget.link));
    DateTime time = DateTime.now();

    videoController.setLooping(true);
    videoController.initialize().then((_) {
      setState(() {});
    });
      videoController.addListener(() {
        setState(() {});
      });
    videoController.play();

  }

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<TvLiveViewModel>.reactive(
      viewModelBuilder: () => TvLiveViewModel(),
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
    }

}
