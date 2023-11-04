import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/ebank/versement/versementViewModel.dart';
import 'package:stacked/stacked.dart';

class Versement extends StatefulWidget {
  const Versement({super.key});

  @override
  State<Versement> createState() => _VersementState();
}

class _VersementState extends State<Versement> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VersementViewModel>.reactive(
      viewModelBuilder: () => VersementViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Versement Tela'))
      ),
    );
  }
}
