import 'package:flutter/material.dart';
import 'package:mobile/ui/views/immo/catalogue/catalogueViewModel.dart';
import 'package:stacked/stacked.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CatalogueViewModel>.reactive(
      viewModelBuilder: () => CatalogueViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Acceuil Tela'))
      ),
    );
  }
}
