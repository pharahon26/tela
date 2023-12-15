
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tela/ui/views/acceuil/acceuilViewModel.dart';
import 'package:stacked/stacked.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {

  List<String> imgs = [
    'assets/images/acc5.jpg',
    'assets/images/acc2.jpg',
    'assets/images/acc3.jpg',
    'assets/images/acc6.jpg',
    'assets/images/acc4.jpg',
    'assets/images/acc1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<AcceuilViewModel>.reactive(
      viewModelBuilder: () => AcceuilViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/images/logo_2.png',
                width: 30,
                fit: BoxFit.fitWidth,
              ),
                const Text('Tela',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3,
                    color: Colors.white
                  ),
                ),
              ],
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
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()=>model.navigateToProfile(),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.orange, Colors.deepOrange])
                      ),
                      child: const Text('S\'abonner',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.3,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,

                        ),
                        child: const Text('Acceuil',
                          style: TextStyle(
                              color: Colors.white
                          ),)
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
                        child: const Text('Tela TV')
                    ),
                  ]),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: mq.size.height,
              width: mq.size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: mq.size.width*0.9,
                      height: 30,
                      child: Marquee(
                        text:'TELA, la meilleure plateforme de recherche de logements et de bureaux en Côte D\'Ivoire',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                            color: Colors.black
                        ),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 200.0,
                        velocity: 55.0,
                        pauseAfterRound: const Duration(seconds: 4),
                        startPadding: 10.0,
                        accelerationDuration: const Duration(seconds: 10),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mq.size.height * 0.6,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: imgs.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(e,
                          width: mq.size.width-80,
                          fit: BoxFit.fitWidth,),
                      )).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: () => model.navigateToRechercheLogement(),
                          style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary
                          ),
                          child: const Text('Trouver un logement',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Colors.white
                            ),
                          ),
                        ),
                        TextButton(onPressed: () => model.navigateToRechercheBureau(),
                          style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary
                          ),
                          child: const Text('Trouver un Bureau',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset('assets/images/telatv-logo.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
