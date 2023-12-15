import 'package:flutter/material.dart';
import 'package:tela/models/transactions.dart';
import 'package:tela/ui/views/ebank/epargne/epargneViewModel.dart';
import 'package:stacked/stacked.dart';

class Epargne extends StatefulWidget {
  const Epargne({super.key});

  @override
  State<Epargne> createState() => _EpargneState();
}

class _EpargneState extends State<Epargne> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EpargneViewModel>.reactive(
      viewModelBuilder: () => EpargneViewModel(),
      builder: (context, model, child) => Scrollbar(
        child:  Column(
          children: [
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
            TextButton(onPressed: () => model.verserSurCompte(),
              style: TextButton.styleFrom(
                elevation: 8,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: const StadiumBorder(),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                child: Text('Dépot vers le compte',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<TelaTransaction>>(
                  future: model.authService.getMyEpargneTransactions(),
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
                                child: const Row(
                                  children: [
                                    Text('test')
                                  ],
                                )
                            ),
                          )).toList(),
                        )
                            :
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Pas de transactions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                              ),
                            ),
                          ),
                        );
                      case ConnectionState.done:
                        return snapshot.data!.isNotEmpty? ListView(
                          scrollDirection: Axis.vertical,
                          children: snapshot.data!.map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () => {},
                                child: const Row(
                                  children: [
                                    Text('test')
                                  ],
                                )
                            ),
                          )).toList(),
                        )
                            :
                        const Center(
                          child: Text('Pas de transactions',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),
                          ),
                        );
                    }

                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
