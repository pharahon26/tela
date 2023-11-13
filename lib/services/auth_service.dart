
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/demacheur.dart';
import 'package:mobile/models/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _SIGN_UP_URL = "api/users/create/";
  static const String _LOGIN_URL = "api/login";
  static const String _COMMUNE_URL = "api/communes";
  static const String _ABONNEMENT_TYPE_URL = "api/type-abonnement";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;
  User? _user;
  Demarcheur? _demarcheur;
  Abonnement? _abonnement;
  Abonnement? _abonnementTV;
  Abonnement? _abonnementPro;
  String _token = '';
  bool _isConnected = false;

  List<Commune> communes = [];
  List<AbonnementType> abonnementType = [];
  List<Abonnement> _abonnements = [];
  final BehaviorSubject<bool> _isConnectedSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isConnected => _isConnectedSubject.stream.asBroadcastStream();

  String get token => _token;
  User? get user => _user;
  Demarcheur? get demarcheur => _demarcheur;
  Abonnement? get abonnementDemarcheur => _abonnementPro;
  Abonnement? get abonnementTV => _abonnementTV;
  Abonnement? get abonnement => _abonnement;


  AuthService();


  /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);
  }


  /// SIGN IN
  Future<User?> signIn({
    required String nom,
    required String prenom,
    required String telephone,
    required String password,
    required String mail,
    required bool isDemarcheur,
  }) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_SIGN_UP_URL)} sign In : $nom $prenom $telephone $mail');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_SIGN_UP_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "X-CSRF-TOKEN": "https://telaci.com",
        },
        body: jsonEncode(<String, dynamic>{
          "nom": nom,
          "prenoms": prenom,
          "phone": telephone,
          "password": password,
          "email": mail,
          "is_demarcheur": isDemarcheur?1:0,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer ' + json["token"]["access_token"];
        _user = User.fromJson(json);
        _isConnected = true;
        _isConnectedSubject.sink.add(_isConnected);
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('auth api service signnin error** $e');
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
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        print('-----------');
        print('TEST');
        print('------------');
        // _token = 'Bearer '+ json["token"]["access_token"];
        _user = User.fromJson(json["user"]);
        print(_user.toString());
        _demarcheur = Demarcheur.fromJson(json["demarcheur"]);
        print(_demarcheur.toString());

        for(var ab in json["abonnement"]){
          Abonnement abonnement = Abonnement.fromJson(ab);
          if (abonnement.type == 'catalogue') {
            _abonnement == abonnement;
          }
          if (abonnement.type == 'demarcheur') {
            _abonnementPro == abonnement;
          }
          if (abonnement.type == 'tv') {
            _abonnementTV == abonnement;
          }
          _abonnements.add(abonnement);
        }

        print(json["abonnement"]);

        // print('logged In successfully with token $_token');
        _isConnected = true;
        _isConnectedSubject.sink.add(_isConnected);
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
    return _user;
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
          print(commune);
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
            print(abt);
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

  void saveCommune() async{
    communes = await getCommunes();
  }

  void saveAbonnementType() async{
    abonnementType = await getAbonnementTypes();
  }

  // List<Commune> getCommunes(){
  //   List<Commune> list = [];
  //   List<String> tt = [
  //     'Abobo',
  //     'Adjamé',
  //     'Anyama',
  //     'Attécoubé',
  //     'Bingerville',
  //     'Cocody',
  //     'Koumassi',
  //     'Marcory',
  //     'Plateau',
  //     'Port bouët',
  //     'Treichville',
  //     'Songon',
  //     'Yopougon',
  //   ];
  //   int i = 1;
  //   for (var element in tt) {
  //     list.add(Commune(id: i, name: element, city: 'Abidjan'));
  //     i++;
  //   }
  //   return  list;
  // }

  void getFakeUser({bool demarcheur = false}){
    User u = User(nom: 'Nombré', prenom: 'Séraphin Elie', phone: '+225 07 00 00 00 00', isDemarcheur: demarcheur);
    _user = u;
    _isConnected =true;
    _isConnectedSubject.sink.add(_isConnected);
  }

  void createFakeUser({
    required String nom,
    required String prenom,
    required String telephone,
    required String password,
    String mail = '',
    bool demarcheur = false}){
    User u = User(nom: nom, prenom: prenom, phone: telephone, mail: mail, isDemarcheur: demarcheur);
    _user = u;
    _isConnected =true;
    _isConnectedSubject.sink.add(_isConnected);
  }

  void close(){
    _isConnectedSubject.close();
  }

}