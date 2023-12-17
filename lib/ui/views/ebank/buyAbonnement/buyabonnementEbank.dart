
import 'package:flutter/material.dart';
import 'package:tela/ui/views/ebank/buyAbonnement/buyAbonnementEbankViewModel.dart';
import 'package:stacked/stacked.dart';

class BuyAbonnementEbank extends StatefulWidget {


  const BuyAbonnementEbank({super.key, required this.fromEpargne});
  final bool fromEpargne;

  @override
  State<BuyAbonnementEbank> createState() => _BuyAbonnementEbankState();
}

class _BuyAbonnementEbankState extends State<BuyAbonnementEbank> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<BuyAbonnementEbankViewModel>.reactive(
      viewModelBuilder: () => BuyAbonnementEbankViewModel(widget.fromEpargne),
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
              child: const Icon(Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Scrollbar(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () => model.navigateToCGUFinance(),
                        child: const Text('cliquez ICI pour consulter nos conditions générales d\'itulisations liées à gains des démarcheurs',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                        )
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: model.abonnements.map(
                            (e) => Card(
                            elevation: 8,
                            color: Theme.of(context).colorScheme.primary,
                            child: InkWell(
                              onTap: () => model.buyAbonnement(e),
                              child: Container(
                                height: mq.size.height/4,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text('${e.price} FCFA',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                    Text(e.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                    Text('Recevez ${e.pourcentage}% sur chaque visite',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                    ).toList(),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
