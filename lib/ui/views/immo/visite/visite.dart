import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/ui/views/immo/visite/visiteViewModel.dart';
import 'package:stacked/stacked.dart';

class Visite extends StatefulWidget {
  const Visite({super.key, required this.place});
  final TelaPlace place;

  @override
  State<Visite> createState() => _VisiteState();
}

class _VisiteState extends State<Visite> {

  List<String> imgs = [
    'assets/images/p1.webp',
    'assets/images/p2.webp',
    'assets/images/p3.webp',
    'assets/images/p4.webp',
    'assets/images/p5.webp',
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<VisiteViewModel>.reactive(
      viewModelBuilder: () => VisiteViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Visites', style: TextStyle(color: Colors.white)),
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
          body:  Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('${widget.place.isBureau? 'Bureau' : 'Logement'} à louer',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: mq.size.width,
                    height: mq.size.height*0.7,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: imgs.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(e,
                          width: mq.size.width-80,
                          fit: BoxFit.fitWidth,),
                      )).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.place.commune!.name,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                  ),

                  Text('${widget.place.nombrePiece} Pièces',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                    child: Text('${widget.place.price.toString()} FCFA',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14, fontWeight:
                        FontWeight.w600)),
                  ),
                  Visibility(
                    visible: widget.place.isAppartment,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Appartement',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.isMaisonBasse,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Maison Basse',
                          style: TextStyle(
                              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Visibility(
                    visible: widget.place.isDuplex,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Duplex',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.isStudio,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Studio',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Divider(),
                  const Text('Commoditées',
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)

                  ),
                  Text('${widget.place.nombreSalleEau} Salles d\'eau',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                  Visibility(
                    visible: widget.place.isHautStanding,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Haut standing sans piscine',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasPiscine,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Haut standing avec piscine',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Divider(),
                  const Text('Commoditées additionneles',
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)

                  ),
                  Visibility(
                    visible: widget.place.hasGarage,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Garage',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasGardien,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gardien',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasCoursAvant,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Cour avant',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasCoursArriere,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Cour arrière',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasBalconAvant,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Balcon avant',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasBalconArriere,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Balcon arrière',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                    child: Text(widget.place.description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14, fontWeight:
                        FontWeight.w600)),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
