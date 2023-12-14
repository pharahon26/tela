import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tela/models/programetv.dart';
import 'package:tela/ui/views/tv/pubWidget/publiciteViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PubliciteWidget extends StatefulWidget {
  const PubliciteWidget({super.key});

  @override
  State<PubliciteWidget> createState() => _PubliciteWidgetState();
}

class _PubliciteWidgetState extends State<PubliciteWidget> {
  bool muted = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  void deactivate() {
    super.deactivate();
    print('desactivé');
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PubliciteViewModel>.reactive(
      viewModelBuilder: () => PubliciteViewModel(),
      builder: (context, model, child) => SafeArea(
          child: AspectRatio(
            aspectRatio: 16/8,
            child: Stack(children: [
              VideoPlayer(model.videoController, key: UniqueKey(),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 30,
                        width: 30,
                        child: Image.asset('assets/images/pub.png',)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        muted = !muted;
                        muted? model.videoController.setVolume(0):model.videoController.setVolume(50);
                        setState(() {

                        });
                      },
                      child: Icon(muted? Icons.volume_off : Icons.volume_up, color: Colors.white,),
                    ),
                  ),
                ),
                ]),
          )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
