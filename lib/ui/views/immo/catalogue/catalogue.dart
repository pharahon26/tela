import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/ui/views/immo/catalogue/catalogueViewModel.dart';
import 'package:mobile/ui/widget/place_card.dart';
import 'package:stacked/stacked.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({super.key, required this.places});
  /// this list should come from a call done in the model remmove  it when implemented
  final List<TelaPlace> places;

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CatalogueViewModel>.reactive(
      viewModelBuilder: () => CatalogueViewModel(),
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
