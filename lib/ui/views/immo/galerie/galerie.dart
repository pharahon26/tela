import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/immo/galerie/galerieViewModel.dart';
import 'package:stacked/stacked.dart';

class Galerie extends StatefulWidget {
  const Galerie({super.key});

  @override
  State<Galerie> createState() => _GalerieState();
}

class _GalerieState extends State<Galerie> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GalerieViewModel>.reactive(
      viewModelBuilder: () => GalerieViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Acceuil Tela'))
      ),
    );
  }
}
