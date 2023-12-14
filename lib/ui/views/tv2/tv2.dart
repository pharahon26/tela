import 'package:flutter/material.dart';
import 'package:tela/ui/views/tv2/tv2ViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tv2 extends StatefulWidget {
  final String link;
  const Tv2({super.key, required this.link});

  @override
  State<Tv2> createState() => _Tv2State();
}

class _Tv2State extends State<Tv2> {

  late WebViewController controller;
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
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

    return ViewModelBuilder<Tv2ViewModel>.reactive(
      viewModelBuilder: () => Tv2ViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
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
    if(videoController != null){
      videoController.dispose();
    }
  }

}
