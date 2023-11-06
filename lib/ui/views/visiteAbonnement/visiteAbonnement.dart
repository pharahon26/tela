import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/visiteAbonnement/visiteAbonnementViewModel.dart';
import 'package:stacked/stacked.dart';

class VisiteAbonnement extends StatefulWidget {
  const VisiteAbonnement({super.key});

  @override
  State<VisiteAbonnement> createState() => _VisiteAbonnementState();
}

class _VisiteAbonnementState extends State<VisiteAbonnement> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<VisiteAbonnementViewModel>.reactive(
      viewModelBuilder: () => VisiteAbonnementViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text('Abonnements',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white
              ),
            ),
            elevation: 5,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Scrollbar(
              child: StreamBuilder<bool>(
                stream: model.isAuth,
                builder: (context, snapshot) {
                  switch(snapshot.connectionState) {
                    case ConnectionState.none:
                      return  Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.waiting:
                      return  Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                      return snapshot.data!?Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            elevation: 8,
                            color: Theme.of(context).colorScheme.primary,
                            child: InkWell(
                              onTap: () => model.navigateToBuyView('Visite Basic', 5000),
                              child: Container(
                                height: mq.size.height/3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text('5000 FCFA',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2
                                      ),
                                    ),
                                    Text('Basic',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.5
                                      ),
                                    ),
                                    Text('Acces à 2 visites',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          Card(
                            elevation: 8,
                            color: Theme.of(context).colorScheme.primary,
                            child: InkWell(
                              onTap: () => model.navigateToBuyView('Visite Medium : 15.000 FCFA', 15000),
                              child: Container(
                                height: mq.size.height/3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text('15.000 FCFA',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2
                                      ),
                                    ),
                                    Text('Medium',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                    Text('Acces à 10 visites',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          Card(
                            elevation: 8,
                            color: Theme.of(context).colorScheme.primary,
                            child: InkWell(
                              onTap: () => model.navigateToBuyView('Visite Premium : 30.000 FCFA', 30000),
                              child: Container(
                                height: mq.size.height/3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text('30.000 FCFA',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2
                                      ),
                                    ),
                                    Text('Premium',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                    Text('Acces à 50 visites',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        ],
                      )
                      :
                      Center(
                        child: InkWell(
                            onTap: () => model.navigateToProfile(),
                            child: Text('Vous n\'êtes pas connecté! Cliquez ici pour vous connecter ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                        ),
                      );
                    case ConnectionState.done:
                      return snapshot.data!?Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                              elevation: 8,
                              color: Theme.of(context).colorScheme.primary,
                              child: InkWell(
                                onTap: () => model.navigateToBuyView('Visite Basic : 5000 FCFA', 5000),
                                child: Container(
                                  height: mq.size.height/3,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
                                  ),
                                  child: Column(
                                    children: [
                                      Text('5000 FCFA',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                      Text('Basic',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                      Text('Acces à 2 visites',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Card(
                              elevation: 8,
                              color: Theme.of(context).colorScheme.primary,
                              child: InkWell(
                                onTap: () => model.navigateToBuyView('Visite Medium : 15.000 FCFA', 15000),
                                child: Container(
                                  height: mq.size.height/3,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
                                  ),
                                  child: Column(
                                    children: [
                                      Text('15.000 FCFA',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                      Text('Medium',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                      Text('Acces à 10 visites',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Card(
                              elevation: 8,
                              color: Theme.of(context).colorScheme.primary,
                              child: InkWell(
                                onTap: () => model.navigateToBuyView('Visite Premium : 30.000 FCFA', 30000),
                                child: Container(
                                  height: mq.size.height/3,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
                                  ),
                                  child: Column(
                                    children: [
                                      Text('30.000 FCFA',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                      Text('Premium',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                      Text('Acces à 50 visites',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      )
                          :
                      Center(
                        child: InkWell(
                            onTap: () => model.navigateToProfile(),
                            child: Text('Vous n\'êtes pas connecté! Cliquez ici pour vous connecter ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                        ),
                      );
                  }

                }
              ),
            ),
          )
      ),
    );
  }
}
