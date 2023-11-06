import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/models/programetv.dart';
import 'package:mobile/ui/views/acceuil/acceuilViewModel.dart';
import 'package:mobile/ui/widget/tela_t_v_programe_card.dart';
import 'package:stacked/stacked.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
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
            title: const Text('Tela',
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
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,

                        ),
                        child: Text('Acceuil',
                          style: TextStyle(
                              color: Colors.white
                          ),)
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToProfile();
                        },
                        child: Text('profile')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheLogement();
                        },
                        child: Text('Trouver un logement')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheBureau();
                        },
                        child: Text('Trouver un Bureau')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToTV();
                        },
                        child: Text('Tela TV')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToEbank();
                        },
                        child: Text('Tela Banking')
                    ),
                  ]),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Image.asset('assets/images/logo_2.png',
                      width: mq.size.width/2,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const Spacer(),
                const Text('Bienvenue sur la plateforme TELA! \n Le meilleur de l\'immobilier',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.black
                  ),
                ),
                const Spacer(),
                TelaTVProgrameCard(programmeTV: TelaProgrammeTV(id: 1, type: 'Live', link: '', description: 'Live show Gagne un million', dateTournage: DateTime.now(), dateDiffusion: DateTime.now())),
                const Text('Parcourez nos offers de bureaux et logement vous trouverez votre bonheur',
                  style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.black
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
                Spacer(),
              ],
            ),
          )
      ),
    );
  }
}
