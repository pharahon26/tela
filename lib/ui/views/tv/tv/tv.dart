import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/models/programetv.dart';
import 'package:mobile/ui/views/tv/tv/tvViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tv extends StatefulWidget {
  final TelaProgrammeTV programmeTV;
  const Tv({super.key, required this.programmeTV});

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {

  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            print( '**** ERROR **** $error');
          },
          onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.programmeTV.link));
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvViewModel>.reactive(
      viewModelBuilder: () => TvViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(child: WebViewWidget(controller: controller))
      ),
    );
  }

}
