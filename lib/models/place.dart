import 'package:mobile/models/commune.dart';
import 'package:mobile/models/demacheur.dart';

class TelaPlace{
  int id = 0;
  String proprioName ='';
  String proprioTelephone ='';
  String description ='';
  double latitude = 0;
  double longitude = 0;
  double price = 0;
  int communeId = 0;
  int nombrePiece = 0;
  int nombreSalleEau = 0;
  int demarcheurId = 0;
  bool isStudio = false;
  bool isAppartment  = false;
  bool isBureau = false;
  bool isMaisonBasse = false;
  bool isDuplex = false;
  bool hasPiscine = false;
  bool isHautStanding = false;
  bool hasCoursAvant = false;
  bool hasCoursArriere = false;
  bool hasBalconAvant = false;
  bool hasBalconArriere = false;
  bool hasGardien = false;
  bool hasGarage = false;
  Commune? commune;
  Demarcheur? demarcheur;


  TelaPlace({
      required this.id,
      required this.proprioName,
      required this.proprioTelephone,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.price,
      required this.communeId,
      required this.nombrePiece,
      required this.nombreSalleEau,
      required this.demarcheurId,
      this.isStudio = false,
      this.isAppartment = false,
      this.isBureau = false,
      this.isMaisonBasse = false,
      this.isDuplex = false,
      this.hasPiscine = false,
      this.isHautStanding = false,
      this.hasCoursAvant = false,
      this.hasCoursArriere = false,
      this.hasBalconAvant = false,
      this.hasBalconArriere = false,
      this.hasGardien = false,
      this.hasGarage = false,});

  static TelaPlace fromJson(Map<String, dynamic> json){
    TelaPlace u = TelaPlace(
      id : json["id"],
      proprioName: json["proprio_name"],
      proprioTelephone: json["proprio_telephone"],
      description: json["description"],
      latitude: double.parse(json["latitude"]),
      longitude: double.parse(json["longitude"]),
      price: double.parse(json["price"]),
      communeId: json["commune_id"],
      nombrePiece: json["nombre_piece"],
      nombreSalleEau: json["nombre_salle_eau"],
      demarcheurId: json["demarcheur_id"],
      isBureau: json["is_Bureau"]==1,
      isAppartment: json["is_Appartment"]==1,
      isDuplex: json["is_DUPLEX"]==1,
      isHautStanding: json["is_HAUT_STANDING"]==1,
      isMaisonBasse: json["is_MAISON_BASSE"]==1,
      isStudio: json["is_Studio"]==1,
      hasCoursArriere: json["has_COUR_ARRIERE"]==1,
      hasCoursAvant: json["has_COUR_AVANT"]==1,
      hasBalconAvant: json["has_balcon_avant"]==1,
      hasBalconArriere: json["has_balcon_arriere"]==1,
      hasGarage: json["has_GARAGE"]==1,
      hasGardien: json["has_GARDIEN"]==1,
      hasPiscine: json["has_PISCINE"]==1,
    );
    u.commune = Commune.fromJson(json['commune']);
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "proprio_name": proprioName,
      "proprio_telephone": proprioTelephone,
      "description": description,
      "latitude": latitude,
      "longitude": longitude,
      "price": price,
      "commune_id": communeId,
      "nombre_piece": nombrePiece,
      "nombre_salle_eau": nombreSalleEau,
      "demarcheur_id": demarcheurId,
      "is_bureau": isBureau?1:0,
      "is_appartment": isAppartment?1:0,
      "is_duplex": isDuplex?1:0,
      "is_haut_standing": isHautStanding?1:0,
      "is_maison_basse": isMaisonBasse?1:0,
      "is_studio": isStudio?1:0,
      "has_cours_arriere": hasCoursArriere?1:0,
      "has_cours_avant": hasCoursAvant?1:0,
      "has_balcon_arriere": hasBalconArriere?1:0,
      "has_balcon_avant": hasBalconAvant?1:0,
      "has_garage": hasGarage?1:0,
      "has_gardien": hasGardien?1:0,
      "has_piscine": hasPiscine?1:0,
    };
  }

  @override
  String toString() {
    return 'TelaPlace{id: $id, proprioName: $proprioName, proprioTelephone: $proprioTelephone, description: $description, latitude: $latitude, longitude: $longitude, price: $price, commune: $communeId, nombrePiece: $nombrePiece, nombreSalle_eau: $nombreSalleEau, demarcheur: $demarcheurId, isAppartment: $isAppartment, isBureau: $isBureau}';
  }
}