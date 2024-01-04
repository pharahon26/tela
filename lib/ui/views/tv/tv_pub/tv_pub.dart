import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/tv_pub/tvPubViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';


class TvPub extends StatefulWidget {
  const TvPub({super.key});

  @override
  State<TvPub> createState() => _TvPubState();
}

class _TvPubState extends State<TvPub> {

  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<TvPubViewModel>.reactive(
      viewModelBuilder: () => TvPubViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
          body: Center(
            child: AspectRatio(
              aspectRatio: model.tvService.pubVideoController.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(model.tvService.pubVideoController, key: UniqueKey(),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/images/pub.png',)),
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
    _tvService.playPub();
    }

}
