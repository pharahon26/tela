import 'package:flutter/material.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/chaneltv/chaneltvViewModel.dart';
import 'package:mobile/ui/views/tv/pubWidget/publicite.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';

class ChanelTv extends StatefulWidget {
  const ChanelTv({super.key});

  @override
  State<ChanelTv> createState() => _ChanelTvState();
}

class _ChanelTvState extends State<ChanelTv> {
  List<String> imgs = [
  'assets/images/live.jpg',
  'assets/images/sport.jpg',
    'assets/images/différé.jpg',
  'assets/images/rediffusion.jpg',
  'assets/images/films.jpg',
];
  Widget pub = const PubliciteWidget();

  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tvService.playPub();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<ChannelTvViewModel>.reactive(
      viewModelBuilder: () => ChannelTvViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
            title: const Text('Tela TV',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white
              ),
            ),
            elevation: 5,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () { Scaffold.of(context).openDrawer(); },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          drawer: Drawer(
            elevation: 5,
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DrawerHeader(child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    )),
                    TextButton(
                        onPressed: (){
                          model.navigateToAcceuil();
                        },
                        child: const Text('Acceuil')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToProfile();
                        },
                        child: const Text('profile')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheLogement();
                        },
                        child: const Text('Trouver un logement')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheBureau();
                        },
                        child: const Text('Trouver un Bureau')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToEbank();
                        },
                        child: const Text('Tela Finance')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToTV();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange,

                        ),
                        child: const Text('Tela TV',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                    ),
                  ]),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                pub,
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: imgs.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          _tvService.pausePub();
                          (e == 'assets/images/sport.jpg')
                              ? model.navigateToLiveTVSport()
                              :
                          (e == 'assets/images/live.jpg')
                              ? model.navigateToLive()
                              : model.navigateToLiveTV();
                                      },
                          child: Image.asset(e,
                            width: mq.size.width-80,
                            fit: BoxFit.fitWidth,)
                      ),
                    )).toList(),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tvService.pausePub();
  }
}
