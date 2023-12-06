import 'package:flutter/material.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/ui/views/ebank/compte/compteViewModel.dart';
import 'package:stacked/stacked.dart';

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompteViewModel>.reactive(
      viewModelBuilder: () => CompteViewModel(),
      builder: (context, model, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () => model.retrait(),
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Theme.of(context).colorScheme.primary,
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
              TextButton(onPressed: () => model.depot(),
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Theme.of(context).colorScheme.primary,
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
            ],
          ),
          Visibility(
            visible: model.authService.bankProfile?.hasEpargne??false,
            replacement: TextButton(onPressed: () => model.createEpargne(),
              style: TextButton.styleFrom(
                elevation: 8,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: StadiumBorder(),
              ),
              child: const Text('Créer son compte épargne',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.white
                ),
              ),
            ),
            child: TextButton(onPressed: () => model.epargner(),
              style: TextButton.styleFrom(
                elevation: 8,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: StadiumBorder(),
              ),
              child: const Text('Dépot sur le compte épargne',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Visibility(
            visible: model.authService.bankProfile?.isDemarcheur??false,
            child: TextButton(onPressed: () => model.renewAbonnement(),
              style: TextButton.styleFrom(
                elevation: 8,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: StadiumBorder(),
              ),
              child: Text('Payer mon Abonnement par Tela',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.white
                ),
              ),
            ),
          ),
          FutureBuilder<List<TelaEBankTransaction>>(
              future: model.authService.getMyEbankTransactions(),
              builder: (context, snapshot) {
                switch(snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                    return snapshot.data!.isNotEmpty? ListView(
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () => {},
                            child: Row(
                              children: [
                                Text('test')
                              ],
                            )
                        ),
                      )).toList(),
                    )
                        :
                    Center(
                      child: Text('Pas de transactions'),
                    );
                  case ConnectionState.done:
                    return snapshot.data!.isNotEmpty? ListView(
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () => {},
                            child: Row(
                              children: [
                                Text('test')
                              ],
                            )
                        ),
                      )).toList(),
                    )
                        :
                    Center(
                      child: Text('Pas de transactions'),
                    );
                }

              }
          ),
        ],
      ),
    );
  }
}
