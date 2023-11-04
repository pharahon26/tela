import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/tv/programmetv/programmetvViewModel.dart';
import 'package:stacked/stacked.dart';

class ProgrammeTv extends StatefulWidget {
  const ProgrammeTv({super.key});

  @override
  State<ProgrammeTv> createState() => _ProgrammeTvState();
}

class _ProgrammeTvState extends State<ProgrammeTv> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProgrammeTvViewModel>.reactive(
      viewModelBuilder: () => ProgrammeTvViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('ProgrammeTv Tela'))
      ),
    );
  }
}
