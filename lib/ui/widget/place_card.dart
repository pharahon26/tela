import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/models/programetv.dart';

class PlaceCard extends StatelessWidget {
  final TelaPlace place;
  late final String type;
  final String image;
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
          color: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          elevation: 5,
          child: Container(
            width: mq.size.width/0.9,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
            ),
            child: Image.asset(image,
              fit: BoxFit.fitWidth,
            )
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
