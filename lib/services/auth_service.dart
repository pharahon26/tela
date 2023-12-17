
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:tela/app/app.locator.dart';
import 'package:tela/models/abonnement.dart';
import 'package:tela/models/abonnementType.dart';
import 'package:tela/models/bank_profile.dart';
import 'package:tela/models/commune.dart';
import 'package:tela/models/place.dart';
import 'package:tela/models/transactions.dart';
import 'package:tela/models/user.dart';
import 'package:tela/services/telaSharedPrefs.dart';
import 'package:rxdart/rxdart.dart';

class AuthService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _BASE_URL_final = "http://office.telaci.com/";
  static const String _SIGN_UP_URL = "api/users/create";
  static const String _SIGN_UP_BANK_URL = "api/ebanking-profil/create";
  static const String _LOGIN_BANK_URL = "api/ebanking-profil/login";
  static const String _IDENTIFICATION_URL = "api/users/update";
  static const String _CHANGE_MDP_URL = "api/users/changeMdp";
  static const String _CHANGE_PIC_URL = "api/users/changePhoto";
  static const String _LOGIN_URL = "api/login";
  static const String _COMMUNE_URL = "api/communes";
  static const String _ABONNEMENT_TYPE_URL = "api/type-abonnement";
  static const String _PASS_TYPE_URL = "api/pass-type";
  static const String _PASS_VISITE_URL = "api/pass-visite/";
  static const String _PASS_VISITE_VERIF_URL = "api/pass-visite/verif";
  static const String _PASS_VISITE_DECRMENT_URL = "api/pass-visite/one_visite";
  static const String _PASS_VISITE_MAISON_URL = "api/pass-visite/get_pass_visite";
  static const String _PLACE_URL = "api/places";
  static const String _BANK_EPARGNE_URL = "api/ebanking-profil/epargner";
  static const String _BANK_EPARGNE_INVERSE_URL = "api/ebanking-profil/epargne_inverse";

  static const String _BANK_TRANSACTIONS_URL = "api/ebanking-profil/ebank_transactions";
  static const String _BANK_EPARGNE_TRANSACTIONS_URL = "api/ebanking-profil/epargne_transactions";
  static const String _BANK_EPARGNE_CREATION_URL = "api/ebanking-profil/create_epargne";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;
  User? _user;
  UserIdentity? _userIdentity;
  TelaBankProfile? _bankProfile;
  TelaBankEpargne? _bankEpargne;
  Abonnement? _abonnement;
  PassTV? _passTV;
  PassVisite? _passVisite;
  final String _token = '';
  bool _isConnected = false;

  List<Commune> communes = [];
  List<AbonnementType> abonnementType = [];
  List<PassType> passType = [];
  final List<Abonnement> _abonnements = [];
  final List<PassVisite> _passVisites = [];
  List<TelaPlace> _myPlaces = [];
  final List<TelaTransaction> _myBankTransactions = [];
  List<TelaTransaction> _myBankEbankTransactions = [];
  final List<TelaTransaction> _myEpargneTransactions = [];
  List<TelaTransaction> _myBankEpargneTransactions = [];
  final List<PassTV> _passTvs = [];
  final BehaviorSubject<bool> _isConnectedSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isConnected => _isConnectedSubject.stream.asBroadcastStream();

  String get token => _token;
  User? get user => _user;
  UserIdentity? get userIdentity => _userIdentity;
  TelaBankProfile? get bankProfile => _bankProfile;
  TelaBankEpargne? get bankEpargne => _bankEpargne;
  PassVisite? get passVisite => _passVisite;
  PassTV? get passTV => _passTV;
  Abonnement? get abonnement => _abonnement;
  set abonnement(Abonnement? value) {
    _abonnement = value;
  }

  List<TelaPlace> get myPlaces => _myPlaces;
  final TelaSharedPrefs _telaSharedPrefs = locator<TelaSharedPrefs>();

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


      print('${Uri.parse(_BASE_URL+_SIGN_UP_URL)} sign In : $nom $prenom $telephone $mail');

      File img = File(photo);
      String photoImg64 = base64Encode(img.readAsBytesSync());
      http.Response response = await client.post(Uri.parse(_BASE_URL+_SIGN_UP_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "nom": nom,
          "prenoms": prenom,
          "phone": telephone,
          "password": password,
          "email": mail,
          "photo": photoImg64,
        }),
      );
      if (response.statusCode == 200) print("Uploaded!");

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        try{

          print(json);
          // _token = 'Bearer ' + json["token"]["access_token"];
          _user = User.fromJson(json['profil']);
          _bankProfile = TelaBankProfile.fromJson(json['ebank']);
          print(_user);

          if(user != null){
            _telaSharedPrefs.savePhoneNumber(user!.phone);
            _telaSharedPrefs.saveName(user!.nom);
            _telaSharedPrefs.saveFirstName( user!.prenom);
            _telaSharedPrefs.deleteAbonnement();
            _isConnected = true;
            _isConnectedSubject.sink.add(_isConnected);
          }

        }catch(e){
          print(e);
          throw 'Une erreur est survenue';

        }
      }  else {
        if (response.statusCode == 401) {
          throw 'Le numero de telephone saisit existe deja';

        }else{
          throw 'Une erreur est survenue';
        }
      }

    }
    finally{
      client.close();
    }
    return _user;
  }

  /// SIGN IN BANK
  Future<TelaBankProfile?> signInEBank({
    required String nom,
    required String prenom,
    required String telephone,
    required String password,
    required String mail,
    required String photo,
  }) async {
    var client = _newClient();
    try{

      print('${Uri.parse(_BASE_URL+_SIGN_UP_BANK_URL)} sign In : $nom $prenom $telephone $mail');

      File img = File(photo);
      String photoImg64 = base64Encode(img.readAsBytesSync());
      http.Response response = await client.post(Uri.parse(_BASE_URL+_SIGN_UP_BANK_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "nom": nom,
          "prenoms": prenom,
          "phone": telephone,
          "password": password,
          "email": mail,
          "photo": photoImg64,
        }),
      );


      if (response.statusCode == 200) print("Uploaded!");

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        try{
          print(json);
          // _token = 'Bearer ' + json["token"]["access_token"];
          _bankProfile = TelaBankProfile.fromJson(json['profil']);
          print(_bankProfile);

          if(_bankProfile != null){
            _telaSharedPrefs.savePhoneNumber(_bankProfile!.phone);
            _telaSharedPrefs.saveName(_bankProfile!.nom??'');
            _telaSharedPrefs.saveFirstName( _bankProfile!.prenom??'');

          }
        }catch(e){
          print(e);
          throw 'Une erreur est survenue';

        }
      } else {
        if (response.statusCode == 401) {
          throw response.body;
        }else{
          throw 'Une erreur est survenue';
        }
      }

    }
    finally{
      client.close();
    }
    return _bankProfile;
  }

  void logout(){
    _user = null;
    _bankEpargne = null;
    _bankProfile = null;
    _abonnement = null;
    _isConnected = false;
    _isConnectedSubject.sink.add(_isConnected);
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
    required String docRecto,
    required String docVerso,
  }) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_IDENTIFICATION_URL)} Identification');

      File rec = File(docRecto);
      File ver = File(docVerso);

      // final photoMimeTypeData = lookupMimeType(img.path, headerBytes: [0xFF, 0xD8])?.split('/');
      // final rectoMimeTypeData = lookupMimeType(rec.path, headerBytes: [0xFF, 0xD8])?.split('/');
      // final versooMimeTypeData = lookupMimeType(ver.path, headerBytes: [0xFF, 0xD8])?.split('/');

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
          if (json['user'] != null) {
            User? user = User.fromJson(json['user']);
            _user = user;
          }
          print('******** User Identity **********');
          print(userIdentity);
          await _telaSharedPrefs.saveIdentity(userIdentity);

        }
      }  else {
        throw 'Une erreur est survenue';
      }

    }
    finally{
      client.close();
    }
  }

  /// change mot de passe
  Future<User?> changeMDP({required String oldPassword, required String password, required String phone}) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_CHANGE_MDP_URL)} Change mdp');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_CHANGE_MDP_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'old_password': oldPassword,
          'password': password,
          'phone': phone,
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
        _user = User.fromJson(json);
        print(_user.toString());
        // _bankProfile = TelaBankProfile.fromJson(json["ebank"]);
        // print(json["ebank"]);
        // print(_bankProfile.toString());
        //
        // print(json["epargne"]);
        // if ((json["epargne"] as Map<String, dynamic>).isNotEmpty) {
        //   _bankEpargne = TelaBankEpargne.fromJson(json["epargne"]);
        //   print(_bankEpargne.toString());
        // }
        // if(_user != null){
        //   _telaSharedPrefs.savePhoneNumber(user!.phone);
        //   _telaSharedPrefs.saveName(user!.nom);
        //   _telaSharedPrefs.saveFirstName( user!.prenom);
        //   print(json["abonnement"]);
        //   if((json["abonnement"] as List<dynamic>).isEmpty){
        //     Abonnement? abonnement = _telaSharedPrefs.getAbonnement();
        //     if (abonnement != null) {
        //       print(abonnement);
        //       if (abonnement.userId == _user!.id) {
        //         _abonnement = abonnement;
        //       } else {
        //         _abonnement = null;
        //       }
        //     }else {
        //       _abonnement = null;
        //     }
        //   } else {
        //     _abonnement = Abonnement.fromJson(json["abonnement"][0]);
        //     for(var ab in json["abonnement"]){
        //       Abonnement abonnement = Abonnement.fromJson(ab);
        //       _abonnements.add(abonnement);
        //     }
        //
        //   }
        //   print(json["abonnement"]);
        //   print(json["places"]);
        //
        //   for(var p in json["places"]){
        //     TelaPlace place = TelaPlace.fromJson(p);
        //     print(place.toString());
        //     _myPlaces.add(place);
        //   }
        //
        //   print(json["places"]);
        //
        //   // print('logged In successfully with token $_token');
        //   _isConnected = true;
        //   _isConnectedSubject.sink.add(_isConnected);
        // }
      } else {
        if (response.statusCode == 401) {
          throw 'errur lors de l\'enregistrement';
        }else{
          throw 'Une erreur est survenue';
        }
      }

    }
    finally{
      client.close();
    }
    return _user;
  }


  /// change photo
  Future<User?> changePhoto({
    required String phone,
    required String photo,
  }) async {
    var client = _newClient();
    try{


      print('${Uri.parse(_BASE_URL+_CHANGE_PIC_URL)}');

      File img = File(photo);
      String photoImg64 = base64Encode(img.readAsBytesSync());
      http.Response response = await client.post(Uri.parse(_BASE_URL+_CHANGE_PIC_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "phone": phone,
          "photo": photoImg64,
        }),
      );
      if (response.statusCode == 200) print("Uploaded!");

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        try{

          print(json);
          // _token = 'Bearer ' + json["token"]["access_token"];
          if (json['profil'] != null) {
            _user = User.fromJson(json['profil']);
            
          }
          if (json['ebank'] != null) {
            _bankProfile = TelaBankProfile.fromJson(json['ebank']);

          }
          print(_user);

          if(user != null){
            _telaSharedPrefs.savePhoneNumber(user!.phone);
            _telaSharedPrefs.saveName(user!.nom);
            _telaSharedPrefs.saveFirstName( user!.prenom);
            _isConnected = true;
            _isConnectedSubject.sink.add(_isConnected);
          }

        }catch(e){
          print(e);
          throw 'Une erreur est survenue';

        }
      }  else {
        if (response.statusCode == 401) {
          throw 'erreur lors de l\'enregistrement de votre photo';

        }else{
          throw 'Une erreur est survenue';
        }
      }

    }
    finally{
      client.close();
    }
    return _user;
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
        _bankProfile = TelaBankProfile.fromJson(json["ebank"]);
        print(json["ebank"]);
        print(_bankProfile.toString());

        print(json["epargne"]);
        if ((json["epargne"] as Map<String, dynamic>).isNotEmpty) {
          _bankEpargne = TelaBankEpargne.fromJson(json["epargne"]);
          print(_bankEpargne.toString());
        }
        if(_user != null){
          _telaSharedPrefs.savePhoneNumber(user!.phone);
          _telaSharedPrefs.saveName(user!.nom);
          _telaSharedPrefs.saveFirstName( user!.prenom);
          print(json["abonnement"]);
          if((json["abonnement"] as List<dynamic>).isEmpty){
            Abonnement? abonnement = _telaSharedPrefs.getAbonnement();
            if (abonnement != null) {
              print(abonnement);
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
          print(json["places"]);

          for(var p in json["places"]){
            TelaPlace place = TelaPlace.fromJson(p);
            print(place.toString());
            _myPlaces.add(place);
          }

          print(json["places"]);

          // print('logged In successfully with token $_token');
          _isConnected = true;
          _isConnectedSubject.sink.add(_isConnected);
        }
      } else {
        if (response.statusCode == 401) {
          throw response.body;
        }else{
          throw 'Une erreur est survenue';
        }
      }

    }
    finally{
      client.close();
    }
    return _user;
  }


  /// LOGIN BANK
  Future<TelaBankProfile?> loginEBank({required String phone, required String password}) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_LOGIN_BANK_URL)} Log In : $phone');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_LOGIN_BANK_URL),
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
        _bankProfile = TelaBankProfile.fromJson(json["ebank_profile"]);
        print(_bankProfile.toString());
        if(_bankProfile != null){
          _telaSharedPrefs.savePhoneNumber(_bankProfile!.phone);
          _telaSharedPrefs.saveName(_bankProfile!.nom??'');
          _telaSharedPrefs.saveFirstName( _bankProfile!.prenom??'');
          }

          if (json["epargne"] != null) {
            print('epargne: ${json["epargne"]}');
            _bankEpargne = TelaBankEpargne.fromJson(json["epargne"]);
          }
          if (json["user"] == null) {
            print('login: $phone');
            await login(phone: phone, password: password);
          }
        } else {
        if (response.statusCode == 401) {
          throw response.body;
        }else{
          throw 'Une erreur est survenue';
        }
      }

    }
    finally{
      client.close();
    }
    return _bankProfile;
  }

  /// BANK CREATE EPARGNE
  Future<TelaBankEpargne?> createEpargne({required String phone}) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_BANK_EPARGNE_CREATION_URL)} Create épargne');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_BANK_EPARGNE_CREATION_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'phone': phone,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        _bankEpargne = TelaBankEpargne.fromJson(json['epargne']);
        _bankProfile = TelaBankProfile.fromJson(json['profil']);
        print(_bankEpargne.toString());
      } else {
        if (response.statusCode == 401) {
          throw response.body;
        }else{
          throw 'Une erreur est survenue';
        }
      }

    }
    finally{
      client.close();
    }
    return _bankEpargne;
  }


  /// GET bank transactions
  Future<List<TelaTransaction>> getMyEbankTransactions() async {
    var client = _newClient();
    List<TelaTransaction> transactions =[];
    try{
      print('${Uri.parse('$_BASE_URL$_BANK_TRANSACTIONS_URL')} get my transactions');
      http.Response response = await client.post(Uri.parse('$_BASE_URL$_BANK_TRANSACTIONS_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'phone': _bankProfile?.phone,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

        for(var pl in json){
          TelaTransaction tp = TelaTransaction.fromJson(pl);
          transactions.add(tp);
          print(pl);
        }
        _myBankEbankTransactions = transactions;
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
    return transactions;
  }
  /// GET bank epargne transactions
  Future<List<TelaTransaction>> getMyEpargneTransactions() async {
    var client = _newClient();
    List<TelaTransaction> transactions =[];
    try{
      print('${Uri.parse('$_BASE_URL$_BANK_EPARGNE_TRANSACTIONS_URL')} get my epargne transactions');
      http.Response response = await client.post(Uri.parse('$_BASE_URL$_BANK_EPARGNE_TRANSACTIONS_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'phone': _bankProfile?.phone,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

        for(var pl in json){
          TelaTransaction tp = TelaTransaction.fromJson(pl);
          transactions.add(tp);
          print(pl);
        }
        _myBankEpargneTransactions = transactions;
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
    return transactions;
  }


  /// push epargne
  Future<TelaTransaction?> postVersementToEpargne({required amount, required TelaBankProfile profile}) async {
    var client = _newClient();
    late TelaTransaction transaction ;
    try{
      print('${Uri.parse(_BASE_URL+_BANK_EPARGNE_URL)} versement epargne');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_BANK_EPARGNE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'montant' : amount,
          'phone' : profile.phone,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        _bankProfile = TelaBankProfile.fromJson(json['profil']);
        _bankEpargne = TelaBankEpargne.fromJson(json['epargne']);
        print(transac.toString());
        transaction = transac;
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service login error** $e');
    }
    finally{
      client.close();
    }
    return transaction;
  }

  /// push epargne inverse
  Future<TelaTransaction?> postVersementFromEpargne({required amount, required TelaBankProfile profile}) async {
    var client = _newClient();
    late TelaTransaction transaction ;
    try{
      print('${Uri.parse(_BASE_URL+_BANK_EPARGNE_INVERSE_URL)} push epargne reverse : ');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_BANK_EPARGNE_INVERSE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'montant' : amount,
          'phone' : profile.phone,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        TelaTransaction transac = TelaTransaction.fromJson(json["transaction"]);
        _bankProfile = TelaBankProfile.fromJson(json['profil']);
        _bankEpargne = TelaBankEpargne.fromJson(json['epargne']);
        print(transac.toString());
        transaction = transac;
        print(transac.toString());

      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service login error** $e');
    }
    finally{
      client.close();
    }
    return transaction;
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
      }  else if (response.statusCode == 404){
        places = [];
      }
      else{
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


  /// GET maisons visite


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
        deletePass();
        _passVisite = null;
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
        if (response.body != '{}') {
          passVisite = PassVisite.fromJson(json);
          await _telaSharedPrefs.savePassVisite(passVisite);
          _passVisite = passVisite;

        }
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service verif code error** $e');

      throw('auth api service verif code error** $e');
    }
    finally{
      client.close();
    }
    return _passVisite;

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
    int i = 0;
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


  // void createFakeUser({
  //   required String nom,
  //   required String prenom,
  //   required String telephone,
  //   required String password,
  //   String mail = '',
  //   bool demarcheur = false}){
  //   User u = User(nom: nom, prenom: prenom, phone: telephone, mail: mail);
  //   _user = u;
  //   _isConnected =true;
  //   _isConnectedSubject.sink.add(_isConnected);
  // }

  void close(){
    _isConnectedSubject.close();
  }

}