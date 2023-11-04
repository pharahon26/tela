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
      this.hasGardien = false,
      this.hasGarage = false,});

  static TelaPlace fromJson(Map<String, dynamic> json){
    TelaPlace u = TelaPlace(
      id : json["id"],
      proprioName: json["proprio_name"],
      proprioTelephone: json["proprio_telephone"],
      description: json["description"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      price: json["price"],
      communeId: json["commune_id"],
      nombrePiece: json["nombre_piece"],
      nombreSalleEau: json["nombre_salle_eau"],
      demarcheurId: json["demarcheur_id"],
      isBureau: json["is_bureau"],
      isAppartment: json["is_appartment"],
      isDuplex: json["is_duplex"],
      isHautStanding: json["is_haut_standing"],
      isMaisonBasse: json["is_maison_basse"],
      isStudio: json["is_studio"],
      hasCoursArriere: json["has_cours_arriere"],
      hasCoursAvant: json["has_cours_avant"],
      hasGarage: json["has_garage"],
      hasGardien: json["has_gardien"],
      hasPiscine: json["has_piscine"],
    );
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
      "is_bureau": isBureau,
      "is_appartment": isAppartment,
      "is_duplex": isDuplex,
      "is_haut_standing": isHautStanding,
      "is_maison_basse": isMaisonBasse,
      "is_studio": isStudio,
      "has_cours_arriere": hasCoursArriere,
      "has_cours_avant": hasCoursAvant,
      "has_garage": hasGarage,
      "has_gardien": hasGardien,
      "has_piscine": hasPiscine,
    };
  }

  @override
  String toString() {
    return 'TelaPlace{id: $id, proprioName: $proprioName, proprioTelephone: $proprioTelephone, description: $description, latitude: $latitude, longitude: $longitude, price: $price, commune: $communeId, nombrePiece: $nombrePiece, nombreSalle_eau: $nombreSalleEau, demarcheur: $demarcheurId, isAppartment: $isAppartment, isBureau: $isBureau}';
  }
}