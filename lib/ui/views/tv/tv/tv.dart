import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/tv/tv/tvViewModel.dart';
import 'package:stacked/stacked.dart';

class Tv extends StatefulWidget {
  const Tv({super.key});

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvViewModel>.reactive(
      viewModelBuilder: () => TvViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('tv tv'))
      ),
    );
  }
}
