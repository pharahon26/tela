import 'package:flutter/material.dart';
import 'package:tela/app/app.locator.dart';
import 'package:tela/models/transactions.dart';
import 'package:tela/services/auth_service.dart';
import 'package:tela/ui/views/ebank/epargne/epargneViewModel.dart';
import 'package:stacked/stacked.dart';

class Epargne extends StatefulWidget {
  const Epargne({super.key});

  @override
  State<Epargne> createState() => _EpargneState();
}

class _EpargneState extends State<Epargne> {
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
    return ViewModelBuilder<EpargneViewModel>.reactive(
      viewModelBuilder: () => EpargneViewModel(),
      builder: (context, model, child) => Scrollbar(
        child:  Column(
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
                  Text('X0F ${ _authService.bankEpargne?.balance??0}',
                    style: TextStyle(
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
                  shape: StadiumBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: () => model.depot(),
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.green,
                  shape: StadiumBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                  child: Text('Dépot',
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
            Visibility(
              visible: model.authService.user != null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () => model.renewAbonnement(),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     TextButton(onPressed: () => model.retrait(),
            //       style: TextButton.styleFrom(
            //         elevation: 8,
            //         backgroundColor: Theme.of(context).colorScheme.primary,
            //         shape: StadiumBorder(),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
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
            //         shape: StadiumBorder(),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
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
            // TextButton(onPressed: () => model.verserSurCompte(),
            //   style: TextButton.styleFrom(
            //     elevation: 8,
            //     backgroundColor: Theme.of(context).colorScheme.primary,
            //     shape: const StadiumBorder(),
            //   ),
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
            //     child: Text('envoie vers compte courant',
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //           letterSpacing: 1.2,
            //           color: Colors.white
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
