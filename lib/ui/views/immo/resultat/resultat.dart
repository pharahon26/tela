import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/ui/views/immo/resultat/resultatViewModel.dart';
import 'package:mobile/ui/widget/place_card.dart';
import 'package:stacked/stacked.dart';

class Resultat extends StatefulWidget {
  const Resultat({super.key, required this.places});

  final List<TelaPlace> places;

  @override
  State<Resultat> createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<ResultatViewModel>.reactive(
      viewModelBuilder: () => ResultatViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Resultats', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            elevation: 5,
          ),
        backgroundColor: Colors.white,
          body:  ListView(
            scrollDirection: Axis.vertical,
            children: widget.places.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () => model.navigateToVisite(e),
                  child: PlaceCard(place: e, image: 'assets/images/p4.webp')
              ),
            )).toList(),
          )
      ),
    );
  }
}
