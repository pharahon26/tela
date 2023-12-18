
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:tela/models/images.dart';
import 'package:tela/models/place.dart';

class PlaceService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _PLACE_URL = "api/places";
  static const String _PLACE_ADD_URL = "api/places/create";
  static const String _PLACE_MODIF_URL = "api/places/";
  static const String _SEARCH_LOGEMENT_URL = "api/places/searchplace";
  static const String _IMAGE_URL = "api/images";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;

  PlaceService();


  /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);
  }

  /// SIGN IN
  Future<List<TelaPlace>> searchLogement({
    required int? communeId,
    required int? nombrePiece,
    required int? nombreSalleEau,
    required int? minPrice,
    required int? maxPrice,
    bool? isBureau,
    bool? isHautStanding,
    bool? isHautStandingPiscine,
    bool? isStudio,
    bool? isChambre,
    bool? isResidence,
    bool? isMaisonBasse,
    bool? isDuplex,
    bool? isAppartment,
    bool? hasCoursArriere,
    bool? hasCoursAvant,
    bool? hasGarage,
    bool? hasGardien,
    bool? hasPiscine,
  }) async {
    var client = _newClient();
    List<TelaPlace> places =[];
    try{
      print('${Uri.parse(_BASE_URL+_SEARCH_LOGEMENT_URL)}');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_SEARCH_LOGEMENT_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "commune_id": communeId,
          "nombre_piece": nombrePiece,
          "nombre_salle_eau": nombreSalleEau,
          "min_price": minPrice,
          "max_price": maxPrice,
          "is_bureau": isBureau,
          "is_Appartment": isAppartment,
          "is_duplex": isDuplex,
          "is_haut_standing": isHautStanding,
          "is_MAISON_BASSE": isMaisonBasse,
          "is_studio": isStudio,
          "has_cours_arriere": hasCoursAvant,
          "has_cours_avant": hasCoursAvant,
          "has_garage": hasGarage,
          "has_gardien": hasGardien,
          "has_piscine": hasPiscine,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('deceode errror *****');
        print((json as List).length);

        for(var place in json){
          places.add(TelaPlace.fromJson(place));
          print(place);
        }
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('place api service search error** $e');
    }
    finally{
      client.close();
    }
    return places;
  }

  /// add place
  Future<TelaPlace?> addPlace({required TelaPlace place, required List<File?> images}) async {
    var client = _newClient();
    TelaPlace? pl;
    Map<String, dynamic> toSend = place.toJson();
    List<String> img = [];

    for(int i = 0; i<10; i++){
      if (images[i] != null) {
        String photoImg64 = base64Encode(images[i]!.readAsBytesSync());
        img.add(photoImg64);
      }
    }
    toSend['images'] = img;

    try{
      print('${Uri.parse(_BASE_URL+_PLACE_ADD_URL)} add place : \n $toSend');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_PLACE_ADD_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(toSend),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        pl = TelaPlace.fromJson(json);
        print(pl.toString());

      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('place api service Add place error** \n $e');
    }
    finally{
      client.close();
    }
    return pl;
  }

  /// modif place
  Future<TelaPlace?> modifPlace({required TelaPlace place, required Map<String, File> imgc}) async {
    var client = _newClient();
    TelaPlace? pl;
    Map<String, dynamic> toSend = place.toJson();

    Map<String, String> img = {};
    int i =1 ;
    imgc.forEach((key, value) {
      String photoImg64 = base64Encode(value.readAsBytesSync());
      if (key == '') {
        key = i.toString();
      }
      img[key] = photoImg64;
      i++;
    });
    toSend['image_change'] = img;
    try{
      print('${Uri.parse('$_BASE_URL$_PLACE_MODIF_URL${place.id}/updateplace')} modif place : \n ${toSend}');
      http.Response response = await client.post(Uri.parse('$_BASE_URL$_PLACE_MODIF_URL${place.id}/updateplace'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(toSend),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        pl = TelaPlace.fromJson(json);
        print(pl.toString());

      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('place api service Modif place error** \n $e');
    }
    finally{
      client.close();
    }
    return pl;
  }

  /// push buy pass

  /// delete place
  Future deletePlace({required TelaPlace place}) async {
    var client = _newClient();

    try{
      print('${Uri.parse('$_BASE_URL$_PLACE_MODIF_URL${place.id}/deleteplace')} delete place : \n ${place.toJson()}');
      http.Response response = await client.get(Uri.parse('$_BASE_URL$_PLACE_MODIF_URL${place.id}/deleteplace'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('place api service Modif place error** \n $e');
    }
    finally{
      client.close();
    }
  }


  /// Décrement Visites

  /// GET images
  Future<List<TelaImage>> images(int placeId) async {
    var client = _newClient();
    List<TelaImage> images =[];
    try{
      print('${Uri.parse(_BASE_URL+_IMAGE_URL)} get image');
      http.Response response = await client.get(Uri.parse('$_BASE_URL$_IMAGE_URL/$placeId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

        for(var image in json["images"]){
          images.add(TelaImage.fromJson(image));
          print(image);
        }
      }  else if (response.statusCode == 500) {
        print('ERROR reponse status code 500');
        throw'Une erreur inattendue est survenu';
      } else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('place api service images error** $e');
    }
    finally{
      client.close();
    }
    return images;
  }

  /// GET all place
  Future<List<TelaPlace>> getAllPlaces() async {
    var client = _newClient();
    List<TelaPlace> places =[];
    try{
      print('${Uri.parse(_BASE_URL+_PLACE_URL)} get places');
      http.Response response = await client.get(Uri.parse('$_BASE_URL$_PLACE_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

        for(var pl in json){
          places.add(TelaPlace.fromJson(pl));
          print(pl);
        }
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('place api service images error** $e');
    }
    finally{
      client.close();
    }
    return places;
  }

  void close(){
  }

}