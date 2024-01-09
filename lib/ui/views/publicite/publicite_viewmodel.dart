import 'dart:developer';

import 'package:mobile/app/app.locator.dart';
import 'package:mobile/models/pub_pack.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PubliciteViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  int id = 0;
  String name = '';
  String companyName = '';
  String cardNumber = '';
  String commercial = '';
  PubPack? choosePack;
  bool consentant = false;

 
  List<PubPack>? packs = [
    PubPack(
      id: 1,
      name: 'medium',
      chooseTarif: "75000",
      tarif:[ 
        {
          "value":"75000",
          "text":"FCFA(captures d'images effectuées par BSPRO)"
        },
        {
          "value":"50000",
          "text":"FCFA(le client prospose ses propres images)"
        },
      ],
      particularite: "Prises de vue effectuées par le commercial",
      visibilite: "5 jours",
      avantages: [
        "1- 01 passage publicitaire au cours des films et clips musicaux",
        "2- Passage en continue pendant 01 semaine sur le canal Publicité",
        "3- 01 passage au cours de chaque émission en differé",
        "4- 01 passage publicitaire au cours des films et clips musicaux",
        "5- Passage en continue pendant 01 semaine sur le canal Publicité",
        "6- 01 passage au cours de chaque émission en differé",
      ]
    ),
    PubPack(
      id:2,
      name: 'basic',
      chooseTarif: "50000",
      tarif:[ 
        {
          "value":"50000",
          "text":"FCFA(captures d'images effectuées par BSPRO)"
        },
        {
          "value":"35000",
          "text":"FCFA(le client prospose ses propres images)"
        },
      ],
      particularite: "Prises de vue effectuées par le commercial",
      visibilite: "5 jours",
      avantages: [
        "1- 01 passage publicitaire au cours des films et clips musicaux",
        "2- Passage en continue pendant 01 semaine sur le canal Publicité",
        "3- 01 passage au cours de chaque émission en differé",
      ]
    ),
  ];


  PubliciteViewModel() {
    log("PubliciteViewModel");
    // getPhone();
    _authService.getAbonnementSaved();
    print('***** Phone $name ****');
  }

  PackSouscription? souscription;

  Future souscribe() async {
    log("souscribe");
    souscription = PackSouscription(
        id: id,
      name: name,
      company: companyName,
      cardNumber: cardNumber,
      commercial: commercial,
      pack: choosePack,
    );
   
    
    
  }


}
