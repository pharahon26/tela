import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/immo/visite/visiteViewModel.dart';
import 'package:stacked/stacked.dart';

class Visite extends StatefulWidget {
  const Visite({super.key});

  @override
  State<Visite> createState() => _VisiteState();
}

class _VisiteState extends State<Visite> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VisiteViewModel>.reactive(
      viewModelBuilder: () => VisiteViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Acceuil Tela'))
      ),
    );
  }
}
