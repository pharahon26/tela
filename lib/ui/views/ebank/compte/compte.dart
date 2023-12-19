import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/ui/views/ebank/compte/compteViewModel.dart';
import 'package:stacked/stacked.dart';

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {


  bool ep = false;
  final AuthService _authService = locator<AuthService>();
  bool isShowDay = false;

  double balance(){
    double d = 0;
    if (_authService.user != null) {
      d = isShowDay? _authService.user?.balance??0 : 0;
    }  else{
      d = _authService.bankProfile?.balance??0;
    }
    return d;
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompteViewModel>.reactive(
      viewModelBuilder: () => CompteViewModel(),
      builder: (context, model, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Solde disponible',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.grey
                    ),
                  ),
                ),
                Text('X0F ${_authService.bankProfile?.balance??0}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: () => model.retrait(),
              style: TextButton.styleFrom(
                elevation: 8,
                backgroundColor: Colors.deepOrange,
                shape: const StadiumBorder(),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                child: Text('Retrait',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     TextButton(onPressed: () => model.retrait(),
          //       style: TextButton.styleFrom(
          //         elevation: 8,
          //         backgroundColor: Theme.of(context).colorScheme.primary,
          //         shape: const StadiumBorder(),
          //       ),
          //       child: const Padding(
          //         padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
          //         child: Text('Retrait',
          //           style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //               letterSpacing: 1.2,
          //               color: Colors.white
          //           ),
          //         ),
          //       ),
          //     ),
          //     TextButton(onPressed: () => model.depot(),
          //       style: TextButton.styleFrom(
          //         elevation: 8,
          //         backgroundColor: Theme.of(context).colorScheme.primary,
          //         shape: const StadiumBorder(),
          //       ),
          //       child: const Padding(
          //         padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
          //         child: Text('Dépot',
          //           style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //               letterSpacing: 1.2,
          //               color: Colors.white
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: model.authService.bankProfile?.hasEpargne??false,
              replacement: TextButton(onPressed: () {



                showDialog(context: context, builder: (buildContext) => Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                        child: Text('En confirmant vous validez la création de votre compte épargne voulez vous continuer,?',
                          textAlign: TextAlign.center,
                          maxLines: 20,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                                onPressed: () => Navigator.of(buildContext).pop(),
                                child: Text('Non',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    ep = true;
                                  });
                                  model.createEpargne().then((value) {
                                    setState(() {
                                      ep = false;
                                    });
                                    model.navigateToBank();
                                  });
                                },
                                child: Text('Oui',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                                )
                            ),
                          ),
                        ],
                      )

                    ],
                  ),

                )
                );

              },
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                  child: ep? CircularProgressIndicator(color: Colors.white,) : Text('Créer son compte épargne',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              child: TextButton(onPressed: () => model.epargner(),
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                  child: Text('Envoie vers épargne',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: model.authService.user != null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: () => ((model.authService.bankProfile?.balance??0) > 5000) && (_authService.abonnement != null) ?
              model.renewAbonnement()
                  :
              showDialog(context: context, builder: (buildContext) => Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text(_authService.abonnement != null? 'Vos fonds sont insuffisants' : 'Vous avez déja un abonnement en cours',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () => Navigator.pop(buildContext),
                          child: Text('Retour',
                            maxLines: 2,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                          )
                      ),
                    )

                  ],
                ),

              )),
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: const StadiumBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Reabonnement',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
