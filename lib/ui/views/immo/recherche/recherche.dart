import 'package:flutter/material.dart';
import 'package:mobile/ui/views/immo/recherche/rechercheViewModel.dart';
import 'package:stacked/stacked.dart';

class Recherche extends StatefulWidget {
  const Recherche({super.key});

  @override
  State<Recherche> createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RechercheViewModel>.reactive(
      viewModelBuilder: () => RechercheViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Acceuil Tela'))
      ),
    );
  }
}
