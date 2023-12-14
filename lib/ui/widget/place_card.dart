import 'package:flutter/material.dart';
import 'package:tela/models/place.dart';
import 'package:tela/models/programetv.dart';

class PlaceCard extends StatelessWidget {
  final TelaPlace place;
  late final String type;
  final String image;
  static const String _BASE_URL = "http://office.telaci.com/public/";
  PlaceCard({Key? key, required this.place, required this.image}) : super(key: key){
    place.isDuplex? type = 'Duplex': place.isStudio?  type = 'Studio':  type = 'Appartement';
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          // color: Theme.of(context).colorScheme.primary,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(25)
          // ),
          elevation: 5,
          child: SizedBox(
            width: mq.size.width+0.9,
            height: mq.size.width*0.9,
            child: Image.network('$_BASE_URL$image',
              fit: BoxFit.contain,),
            ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Text('$type à ${place.commune!.name}',
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${place.nombrePiece} Pièces',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
              Text('${place.nombreSalleEau} Salles d\'eau',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Text('Prix: ${place.price.toString()} FCFA',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14, fontWeight:
              FontWeight.w600)),
        ),
      ],
    );
  }
}
