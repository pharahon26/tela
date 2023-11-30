import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/ui/views/immo/myVisite/myVisiteViewModel.dart';
import 'package:stacked/stacked.dart';

class MyVisite extends StatefulWidget {
  const MyVisite({super.key, required this.place});
  final TelaPlace place;

  @override
  State<MyVisite> createState() => _MyVisiteState();
}

class _MyVisiteState extends State<MyVisite> {

  static const String _BASE_URL = "http://10.0.2.2:8000/";

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
    print('******${widget.place.images}************');
    return ViewModelBuilder<VisiteViewModel>.reactive(
      viewModelBuilder: () => VisiteViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Détails', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () => model.navigateToModifPlace(widget.place),
                    child: const Icon(Icons.edit, size: 24, color: Colors.white,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () => showDialog(context: context, builder: (buildContext) => Dialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                            child: Text('Voulez vous vraiment supprimer cette maison de votre catalogue de maison?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.1
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('Annuler',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ),
                                TextButton(
                                    onPressed: () => model.deletePlace(widget.place),
                                    child: Text('Supprimer',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )

                        ],
                      ),

                    )),
                    child: const Icon(Icons.delete_outline, size: 24, color: Colors.white,)
                ),
              ),
            ],
            elevation: 5,
          ),
        backgroundColor: Colors.white,
          body:  Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('${widget.place.isBureau? 'Bureau' : 'Logement'} à louer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, fontSize: 32, fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: mq.size.width,
                    height: mq.size.height*0.6,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.place.images.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network('$_BASE_URL$e',
                          width: mq.size.width-80,
                          fit: BoxFit.fitWidth,),
                      )).toList(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                    child: Text('${widget.place.price.toString()} FCFA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 32, fontWeight:
                        FontWeight.w600)),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                    child: Text('${widget.place.visites.toString()} Visites',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24, fontWeight:
                        FontWeight.w600)),
                  ),
                  Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Démarcheur',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                  ),

                  Divider(),
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset('assets/images/logo_2.png',
                                width: 50,
                                fit: BoxFit.fitWidth,
                              ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('${widget.place.demarcheur?.nom ?? ''} ${widget.place.demarcheur?.prenom ?? ''}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(widget.place.demarcheur?.phone??'',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),


                  Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Commune',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.place.commune!.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                  ),


                  Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Type',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                  ),
                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox.shrink(),
                      Visibility(
                        visible: widget.place.isAppartment,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Appartement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isMaisonBasse,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Maison Basse',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isDuplex,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Duplex',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isStudio,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Résidence',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(' de ${widget.place.nombrePiece} Pièces',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox.shrink(),
                    ],

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox.shrink(),
                      Visibility(
                        visible: widget.place.isHautStanding,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Haut standing sans piscine',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.hasPiscine,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Haut standing avec piscine',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('avec ${widget.place.nombreSalleEau} Salles d\'eau',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                  Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Commoditées additionneles',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)

                    ),
                  ),
                  Divider(),
                  Visibility(
                    visible: widget.place.hasGarage,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Garage',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasGardien,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gardien',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasCoursAvant,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Cour avant',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,  fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasCoursArriere,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Cour arrière',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasBalconAvant,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Balcon avant',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,  fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                  ),
                  Visibility(
                    visible: widget.place.hasBalconArriere,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Balcon arrière',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Description',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                    child: Text(widget.place.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16, fontWeight:
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
