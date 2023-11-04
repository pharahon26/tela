import 'package:flutter/material.dart';
import 'package:mobile/ui/views/ebank/depot/depotViewModel.dart';
import 'package:stacked/stacked.dart';

class Depot extends StatefulWidget {
  const Depot({super.key});

  @override
  State<Depot> createState() => _DepotState();
}

class _DepotState extends State<Depot> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DepotViewModel>.reactive(
      viewModelBuilder: () => DepotViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Bank depot Tela'))
      ),
    );
  }
}
