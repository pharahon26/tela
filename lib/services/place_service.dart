
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/models/images.dart';
import 'package:mobile/models/place.dart';

class PlaceService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _PLACE_URL = "api/places";
  static const String _IMAGE_URL = "api/images";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;

  PlaceService();


  /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);
  }

  /// SIGN IN
  Future<List<TelaPlace>> search({
    required int? communeId,
    required int? nombrePiece,
    required int? nombreSalleEau,
    required int? minPrice,
    required int? maxPrice,
    bool? isBureau,
    bool? isHautStanding,
    bool? isStudio,
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
      print('${Uri.parse(_BASE_URL+_PLACE_URL)}');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_PLACE_URL),
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
          "is_appartment": isAppartment,
          "is_duplex": isDuplex,
          "is_haut_standing": isHautStanding,
          "is_maison_basse": isMaisonBasse,
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
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print(json);

        for(var place in json["result"]){
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