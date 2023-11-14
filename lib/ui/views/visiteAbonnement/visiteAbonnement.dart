
import 'package:flutter/material.dart';
import 'package:mobile/ui/views/visiteAbonnement/visiteAbonnementViewModel.dart';
import 'package:stacked/stacked.dart';

class VisiteAbonnement extends StatefulWidget {

  final String type;

  VisiteAbonnement({super.key, required this.type});

  @override
  State<VisiteAbonnement> createState() => _VisiteAbonnementState();
}

class _VisiteAbonnementState extends State<VisiteAbonnement> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<VisiteAbonnementViewModel>.reactive(
      viewModelBuilder: () => VisiteAbonnementViewModel(type: widget.type),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: model.abonnements.map(
                        (e) => Card(
                        elevation: 8,
                        color: Theme.of(context).colorScheme.primary,
                        child: InkWell(
                          onTap: () => model.navigateToBuyView(e),
                          child: Container(
                            height: mq.size.height/4,
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
                                Text('${e.price} FCFA',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2
                                  ),
                                ),
                                Text('${e.title}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2
                                  ),
                                ),
                                Text('Acces ${e.type}',
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
                        ))
                ).toList(),
              ),
            ),
          )
      ),
    );
  }
}
