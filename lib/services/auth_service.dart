
import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:http/io_client.dart';
import 'package:mime/mime.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked_annotations.dart';

class AuthService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _SIGN_UP_URL = "api/users/create";
  static const String _IDENTIFICATION_URL = "api/users/update";
  static const String _LOGIN_URL = "api/login";
  static const String _COMMUNE_URL = "api/communes";
  static const String _ABONNEMENT_TYPE_URL = "api/type-abonnement";
  static const String _PASS_TYPE_URL = "api/pass-type";
  static const String _PASS_VISITE_URL = "api/pass-visite/";
  static const String _PASS_VISITE_VERIF_URL = "api/pass-visite/verif";
  static const String _PASS_VISITE_DECRMENT_URL = "api/pass-visite/one_visite";
  static const String _PASS_VISITE_MAISON_URL = "api/pass-visite/get_pass_visite";
  static const String _PLACE_URL = "api/places";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;
  User? _user;
  Abonnement? _abonnement;
  PassTV? _passTV;
  PassVisite? _passVisite;
  String _token = '';
  bool _isConnected = false;

  List<Commune> communes = [];
  List<AbonnementType> abonnementType = [];
  List<PassType> passType = [];
  List<Abonnement> _abonnements = [];
  List<PassVisite> _passVisites = [];
  List<TelaPlace> _myPlaces = [];
  List<PassTV> _passTvs = [];
  final BehaviorSubject<bool> _isConnectedSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isConnected => _isConnectedSubject.stream.asBroadcastStream();

  String get token => _token;
  User? get user => _user;
  PassVisite? get passVisite => _passVisite;
  PassTV? get passTV => _passTV;
  Abonnement? get abonnement => _abonnement;


  List<TelaPlace> get myPlaces => _myPlaces;
  TelaSharedPrefs _telaSharedPrefs = locator<TelaSharedPrefs>();

  File? _imagetemp;


  File? get imagetemp => _imagetemp;

  setImagetemp(File? value) {
    _imagetemp = value;
  }

  AuthService();


  /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);
  }

  void placeAdded(TelaPlace tp){
    tp.commune = communes.where((element) => element.id == tp.communeId).first;
    _myPlaces.add(tp);
  }

  /// SIGN IN
  Future<User?> signIn({
    required String nom,
    required String prenom,
    required String telephone,
    required String password,
    required String mail,
    required String photo,
  }) async {
    var client = _newClient();
    try{

      File img = File(photo);

      final mimeTypeData = lookupMimeType(img.path, headerBytes: [0xFF, 0xD8])?.split('/');
      String img64 = base64Encode(img.readAsBytesSync());
      print('${Uri.parse(_BASE_URL+_SIGN_UP_URL)} sign In : $nom $prenom $telephone $mail');

      var request = http.MultipartRequest('POST', Uri.parse(_BASE_URL+_SIGN_UP_URL));
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        // 'Authorization': token,
      });
      request.fields['nom'] = nom;
      request.fields['prenoms'] = prenom;
      request.fields['phone'] = telephone;
      request.fields['password'] = password;
      request.fields['email'] = mail;

      request.files.add(
          await http.MultipartFile.fromPath('photo',
              img.path,
              contentType: http_parser.MediaType(mimeTypeData![0], mimeTypeData[1])
          ));

      request.send().then((response) async {
        if (response.statusCode == 200) print("Uploaded!");
        final respStr = await response.stream.bytesToString();

        print('Response status: ${response.statusCode}');
        print('Response body: ${respStr}');
        final json = jsonDecode(respStr);
        if (response.statusCode == 200) {
          print(json);
          // _token = 'Bearer ' + json["token"]["access_token"];
          _user = User.fromJson(json);
          print(_user);

          if(user != null){
            _telaSharedPrefs.savePhoneNumber(user!.phone);
            _telaSharedPrefs.saveName(user!.nom);
            _telaSharedPrefs.saveFirstName( user!.prenom);
            if((json["abonnement"] as List<dynamic>).isEmpty){
              Abonnement? abonnement = _telaSharedPrefs.getAbonnement();
              if (abonnement != null) {
                if (abonnement.userId == _user!.id) {
                  _abonnement = abonnement;
                } else {
                  _abonnement = null;
                }
              }else {
                _abonnement = null;
              }
            } else {
              _abonnement = Abonnement.fromJson(json["abonnement"][0]);
              for(var ab in json["abonnement"]){
                Abonnement abonnement = Abonnement.fromJson(ab);
                _abonnements.add(abonnement);
              }

            }
            print(json["abonnement"]);
            // for(var p in json["places"]){
            //   TelaPlace place = TelaPlace.fromJson(p);
            //   print(place.toString());
            //   _myPlaces.add(place);
            // }
            //
            // print(json["place"]);

            // print('logged In successfully with token $_token');
            _isConnected = true;
            _isConnectedSubject.sink.add(_isConnected);
          }
          // if(user != null){
          //   _telaSharedPrefs.savePhoneNumber(user!.phone);
          //   _telaSharedPrefs.saveName(user!.nom);
          //   _telaSharedPrefs.saveFirstName( user!.prenom);
          // }
          // _isConnected = true;
          // _isConnectedSubject.sink.add(_isConnected);
        }  else {
          if (response.statusCode == 404) {
            throw json['message'];

          }
        }

      });






    }
    finally{
      client.close();
    }
    return _user;
  }


  /// Identifcation
  // Future<void> identification({
  //   required String nom,
  //   required String prenom,
  //   required String telephone,
  //   required String phone2,
  //   required int id,
  //   required String birthDate,
  //   required String birthPlace,
  //   required String genre,
  //   required String nation,
  //   required String pays,
  //   required String villeResi,
  //   required String documentNumber,
  //   required String photo,
  //   required String docRecto,
  //   required String docVerso,
  // }) async {
  //   var client = _newClient();
  //   try{
  //
  //
  //     File img = File(photo);
  //     File rec = File(docRecto);
  //     File ver = File(docVerso);
  //
  //     final photoMimeTypeData = lookupMimeType(img.path, headerBytes: [0xFF, 0xD8])?.split('/');
  //     final rectoMimeTypeData = lookupMimeType(rec.path, headerBytes: [0xFF, 0xD8])?.split('/');
  //     final versooMimeTypeData = lookupMimeType(ver.path, headerBytes: [0xFF, 0xD8])?.split('/');
  //
  //     // String photoImg64 = base64Encode(img.readAsBytesSync());
  //     // String rectoImg64 = base64Encode(rec.readAsBytesSync());
  //     // String versoImg64 = base64Encode(ver.readAsBytesSync());
  //
  //     print('${Uri.parse(_BASE_URL+_IDENTIFICATION_URL)} identification : $nom $prenom $telephone ');
  //
  //     var request = http.MultipartRequest('POST', Uri.parse(_BASE_URL+_IDENTIFICATION_URL));
  //     request.headers.addAll({
  //       'Content-Type': 'multipart/form-data',
  //       'Accept': 'application/json',
  //       // 'Authorization': token,
  //     });
  //     request.fields['name'] = '$nom $prenom';
  //     request.fields['id'] = id.toString();
  //     request.fields['phone1'] = telephone;
  //     request.fields['phone2'] = phone2;
  //     request.fields['lieu_naissance'] = birthPlace;
  //     request.fields['date_naissance'] = birthDate;
  //     request.fields['genre'] = genre;
  //     request.fields['nationalite'] = birthDate;
  //     request.fields['pays'] = pays;
  //     request.fields['domicile'] = villeResi;
  //     request.fields['document_number'] = documentNumber;
  //
  //
  //     request.files.add(
  //         await http.MultipartFile.fromPath('photo',
  //             img.path,
  //             contentType: http_parser.MediaType(photoMimeTypeData![0], photoMimeTypeData[1])
  //         ));
  //     request.files.add(
  //         await http.MultipartFile.fromPath('cni_recto',
  //             rec.path,
  //             contentType: http_parser.MediaType(rectoMimeTypeData![0], rectoMimeTypeData[1])
  //         ));
  //     request.files.add(
  //         await http.MultipartFile.fromPath('cni_verso',
  //             ver.path,
  //             contentType: http_parser.MediaType(versooMimeTypeData![0], versooMimeTypeData[1])
  //         ));
  //
  //     request.send().then((response) async {
  //       if (response.statusCode == 200) print("Uploaded!");
  //       final respStr = await response.stream.bytesToString();
  //
  //       print('Response status: ${response.statusCode}');
  //       print('Response body: ${respStr}');
  //       final json = jsonDecode(respStr);
  //
  //       if (response.statusCode == 200) {
  //         print(json.toString());
  //         // _token = 'Bearer ' + json["token"]["access_token"];
  //       }  else {
  //         if (response.statusCode == 404) {
  //           throw json;
  //
  //         }
  //       }
  //     });
  //
  //   }
  //   finally{
  //     client.close();
  //   }
  // }

  /// Identifcation
  Future<void> identification({
    required String nom,
    required String prenom,
    required String telephone,
    required String phone2,
    required int id,
    required String birthDate,
    required String birthPlace,
    required String genre,
    required String nation,
    required String pays,
    required String villeResi,
    required String documentNumber,
    required String photo,
    required String docRecto,
    required String docVerso,
  }) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_IDENTIFICATION_URL)} Identification : $photo $docRecto $telephone ');

      File img = File(photo);
      File rec = File(docRecto);
      File ver = File(docVerso);

      // final photoMimeTypeData = lookupMimeType(img.path, headerBytes: [0xFF, 0xD8])?.split('/');
      // final rectoMimeTypeData = lookupMimeType(rec.path, headerBytes: [0xFF, 0xD8])?.split('/');
      // final versooMimeTypeData = lookupMimeType(ver.path, headerBytes: [0xFF, 0xD8])?.split('/');

      String photoImg64 = base64Encode(img.readAsBytesSync());
      String rectoImg64 = base64Encode(rec.readAsBytesSync());
      String versoImg64 = base64Encode(ver.readAsBytesSync());
      http.Response response = await client.post(Uri.parse(_BASE_URL+_IDENTIFICATION_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "name": '$nom $prenom',
          "id": id,
          "phone1": telephone,
          "phone2": phone2,
          "lieu_naissance": birthPlace,
          "date_naissance": birthDate,
          "genre": genre,
          "nationalite": nation,
          "pays": pays,
          "domicile": villeResi,
          "document_number": documentNumber,
          "photo": photoImg64,
          "cni_recto": rectoImg64,
          "cni_verso": versoImg64,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(json.toString());
        // _token = 'Bearer ' + json["token"]["access_token"];
        if (json != null) {
          UserIdentity userIdentity = UserIdentity.fromJson(json);
          print('******** User Identity **********');
          print(userIdentity);
          await _telaSharedPrefs.saveIdentity(userIdentity);

        }
      }  else {
        if (response.statusCode == 404) {
          throw json;
        }
      }

    }
    finally{
      client.close();
    }
  }

  /// LOGIN
  Future<User?> login({required String phone, required String password}) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_LOGIN_URL)} Log In : $phone');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_LOGIN_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'phone': phone,
          'password': password,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(json);
        print('-----------');
        print('TEST');
        print('------------');
        // _token = 'Bearer '+ json["token"]["access_token"];
        _user = User.fromJson(json["user"]);
        print(_user.toString());
        if(user != null){
          _telaSharedPrefs.savePhoneNumber(user!.phone);
          _telaSharedPrefs.saveName(user!.nom);
          _telaSharedPrefs.saveFirstName( user!.prenom);
          if((json["abonnement"] as List<dynamic>).isEmpty){
            Abonnement? abonnement = _telaSharedPrefs.getAbonnement();
            if (abonnement != null) {
              if (abonnement.userId == _user!.id) {
                _abonnement = abonnement;
              } else {
                _abonnement = null;
              }
            }else {
              _abonnement = null;
            }
          } else {
            _abonnement = Abonnement.fromJson(json["abonnement"][0]);
            for(var ab in json["abonnement"]){
              Abonnement abonnement = Abonnement.fromJson(ab);
              _abonnements.add(abonnement);
            }

          }
          print(json["abonnement"]);
          // for(var p in json["places"]){
          //   TelaPlace place = TelaPlace.fromJson(p);
          //   print(place.toString());
          //   _myPlaces.add(place);
          // }
          //
          // print(json["place"]);

          // print('logged In successfully with token $_token');
          _isConnected = true;
          _isConnectedSubject.sink.add(_isConnected);
        }
      }  else {
        if (response.statusCode == 404) {
          throw json;

        }
        print('ERROR reponse status code not 200');
      }

    }
    finally{
      client.close();
    }
    return _user;
  }


  /// GET my place
  Future<List<TelaPlace>> getMyPlaces() async {
    var client = _newClient();
    List<TelaPlace> places =[];
    try{
      print('${Uri.parse('$_BASE_URL$_PLACE_URL/${_user!.id}/my_places')} get my places');
      http.Response response = await client.get(Uri.parse('$_BASE_URL$_PLACE_URL/${_user!.id}/my_places'),
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
          TelaPlace tp = TelaPlace.fromJson(pl);
          tp.commune = communes.where((element) => element.id == tp.communeId).first;
          places.add(tp);
          print(pl);
        }
        _myPlaces = places;
      }  else {
        print('ERROR reponse status code not 200');
        throw json.toString();
      }

    }
    catch(e){
      print('place api service images error** $e');
      throw 'Erreur innatendue';
    }
    finally{
      client.close();
    }
    return places;
  }
  /// GET maisons visite
  Future<List<TelaPlace>> getMaisonsVisite() async {
    var client = _newClient();
    List<TelaPlace> places =[];
    try{
      print('${Uri.parse('$_BASE_URL$_PASS_VISITE_MAISON_URL')} get places visited ${_passVisite!.code}');
      http.Response response = await client.post(Uri.parse('$_BASE_URL$_PASS_VISITE_MAISON_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'code': _passVisite!.code,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

        for(var pl in json){
          TelaPlace tp = TelaPlace.fromJson(pl);
          tp.commune = communes.where((element) => element.id == tp.communeId).first;
          places.add(tp);
          print(pl);
        }
        _myPlaces = places;
      }  else {
        print('ERROR reponse status code not 200');
        throw json.toString();
      }

    }
    catch(e){
      print('place api service place visited error** $e');
      throw 'Erreur innatendue';
    }
    finally{
      client.close();
    }
    return places;
  }


  /// GET COMMUNES
  Future<List<Commune>> getCommunes() async {
    var client = _newClient();
    List<Commune> communesList =[];
    try{
      print('${Uri.parse(_BASE_URL+_COMMUNE_URL)} get communes');
      http.Response response = await client.get(Uri.parse(_BASE_URL+_COMMUNE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];

        for(var commune in json){
          communesList.add(Commune.fromJson(commune));
          print(Commune.fromJson(commune));
        }
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service commune error** $e');
    }
    finally{
      client.close();
    }
    return communesList;
  }


  /// GET Abonnement types
  Future<List<AbonnementType>> getAbonnementTypes() async {
    var client = _newClient();
    List<AbonnementType> abtList =[];
    try{
      print('${Uri.parse(_BASE_URL+_ABONNEMENT_TYPE_URL)} get Abonnement types');
      http.Response response = await client.get(Uri.parse(_BASE_URL+_ABONNEMENT_TYPE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];

        for(var abt in json){
          abtList.add(AbonnementType.fromJson(abt));
            print(AbonnementType.fromJson(abt));
        }
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service commune error** $e');
    }
    finally{
      client.close();
    }
    return abtList;
  }

  /// GET Pass types
  Future<List<PassType>> getPassTypes() async {
    var client = _newClient();
    List<PassType> abtList =[];
    try{
      print('${Uri.parse(_BASE_URL+_PASS_TYPE_URL)} get Pass types');
      http.Response response = await client.get(Uri.parse(_BASE_URL+_PASS_TYPE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        for(var abt in json){
          abtList.add(PassType.fromJson(abt));
            print(PassType.fromJson(abt));
        }
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service commune error** $e');
    }
    finally{
      client.close();
    }
    return abtList;
  }


  // /// GET Abonnement
  // Future<List<Commune>> getAbonnements() async {
  //   var client = _newClient();
  //   List<Commune> communesList =[];
  //   try{
  //     print('${Uri.parse(_BASE_URL+_COMMUNE_URL)} get Abonnement types');
  //     http.Response response = await client.get(Uri.parse(_BASE_URL+_COMMUNE_URL),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //     );
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);
  //       print(json);
  //       // _token = 'Bearer '+ json["token"]["access_token"];
  //
  //       for(var commune in json){
  //         communesList.add(Commune.fromJson(commune));
  //         print(commune);
  //       }
  //     }  else {
  //       print('ERROR reponse status code not 200');
  //     }
  //
  //   }
  //   catch(e){
  //     print('auth api service commune error** $e');
  //   }
  //   finally{
  //     client.close();
  //   }
  //   return communesList;
  // }

  /// gestion des pass visite
  ///  ***** sauvegarde la liste des visite ****
  ///  ***** check visites ****

  /// sauvegarde la liste des visites


  void saveCommune() async{
    communes = await getCommunes();
    await _telaSharedPrefs.saveCommunes(communes);
  }

  void saveAbonnementType() async{
    abonnementType = await getAbonnementTypes();
    await _telaSharedPrefs.saveAbonnementType(abonnementType);
  }

  void savePassType() async{
    passType = await getPassTypes();
    await _telaSharedPrefs.saveAbonnementType(abonnementType);
  }

  void getPassSaved() async {
    PassVisite? passVisite = _telaSharedPrefs.getPassVisite();
    print('***************??????pass v????????****************');
    print(passVisite.toString());

    print('***************??????????????****************');
    if (passVisite != null) {
      PassVisite? p = await verifCodeVisite(code: passVisite.code);
      if (p != null) {
        _passVisite = p;
      } else{
        // passVisite.isExpired = true;
        _passVisite = passVisite;
      }
    }

  }
  void deletePass() async {
    PassVisite? passVisite = _telaSharedPrefs.getPassVisite();
    print('***************??????pass v????????****************');
    print(passVisite.toString());

    print('***************??????????????****************');
    if (passVisite != null) {
      _telaSharedPrefs.deletePassVisite();
        _passVisite = null;
    }

  }

  getAbonnementSaved(){
    Abonnement? abonnement = _telaSharedPrefs.getAbonnement();

    print('***************??????????????****************');
    print(abonnement.toString());

    print('***************??????????????****************');

    _abonnement = abonnement;
  }


  ///verifPassCode
  Future<PassVisite?> verifCodeVisite({required String code}) async {
    var client = _newClient();
    late PassVisite passVisite;

    try{
      print('${Uri.parse('$_BASE_URL$_PASS_VISITE_VERIF_URL')} get verif $code');
      http.Response response = await client.post(Uri.parse('$_BASE_URL$_PASS_VISITE_VERIF_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'code': code,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];

        passVisite = PassVisite.fromJson(json);
        await _telaSharedPrefs.savePassVisite(passVisite);
        _passVisite = passVisite;
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service commune error** $e');
      throw('auth api service commune error** $e');
    }
    finally{
      client.close();
    }
    return passVisite;

  }



  ///décrément visite
  Future<PassVisite?> moin1Visite({required String code, required int placeID}) async {
    var client = _newClient();
    late PassVisite passVisite;

    try{
      print('${Uri.parse('$_BASE_URL$_PASS_VISITE_DECRMENT_URL')} minus 1 visite');
      http.Response response = await client.post(Uri.parse('$_BASE_URL$_PASS_VISITE_DECRMENT_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'code': code,
          'place_id': placeID,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];

        passVisite = PassVisite.fromJson(json);
        _passVisite = passVisite;
        await _telaSharedPrefs.savePassVisite(passVisite);
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service commune error** $e');
      throw('auth api service décrement visite error** $e');
    }
    finally{
      client.close();
    }
    return passVisite;

  }







  List<Commune> getFackCommunes(){
    List<Commune> list = [];
    List<String> tt = [
      'Abobo',
      'Adjamé',
      'Anyama',
      'Attécoubé',
      'Bingerville',
      'Cocody',
      'Koumassi',
      'Marcory',
      'Plateau',
      'Port bouët',
      'Treichville',
      'Songon',
      'Yopougon',
    ];
    int i = 1;
    for (var element in tt) {
      list.add(Commune(id: i, name: element, city: 'Abidjan'));
      i++;
    }
    return  list;
  }

  List<AbonnementType> getFackAbonnementType(){
    List<AbonnementType> list = [];
    list.add(AbonnementType(id: 1, title: 'Basic', type: 'demarcheur', price: 5000, pourcentage: 10));
    list.add(AbonnementType(id: 2, title: 'Medium', type: 'demarcheur', price: 15000, pourcentage: 18));
    list.add(AbonnementType(id: 3, title: 'Premium', type: 'demarcheur', price: 30000, pourcentage: 25));
    return  list;
  }
  List<PassType> getFackPassType(){
    List<PassType> list = [];
    list.add(PassType(id: 1, name: 'Basic', price: '2000', isVisite: true, numberOfVisites: 5));
    list.add(PassType(id: 2, name: 'Medium', price: '3000', isVisite: true, numberOfVisites: 10));
    list.add(PassType(id: 3, name: 'Premium', price: '5000', isVisite: true, numberOfVisites: 20));
    list.add(PassType(id: 3, name: 'Pass Tv', price: '300', isVisite: false, numberOfVisites: 0));
    return  list;
  }


  void createFakeUser({
    required String nom,
    required String prenom,
    required String telephone,
    required String password,
    String mail = '',
    bool demarcheur = false}){
    User u = User(nom: nom, prenom: prenom, phone: telephone, mail: mail);
    _user = u;
    _isConnected =true;
    _isConnectedSubject.sink.add(_isConnected);
  }

  void close(){
    _isConnectedSubject.close();
  }

}