import 'package:flutter/material.dart';
import 'package:mobile/ui/views/immo/resultat/resultatViewModel.dart';
import 'package:stacked/stacked.dart';

class Resultat extends StatefulWidget {
  const Resultat({super.key});

  @override
  State<Resultat> createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultatViewModel>.reactive(
      viewModelBuilder: () => ResultatViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Acceuil Tela'))
      ),
    );
  }
}
