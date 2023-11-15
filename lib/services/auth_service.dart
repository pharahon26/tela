
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:rxdart/rxdart.dart';

class AuthService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _SIGN_UP_URL = "api/users/create/";
  static const String _LOGIN_URL = "api/login";
  static const String _COMMUNE_URL = "api/communes";
  static const String _ABONNEMENT_TYPE_URL = "api/type-abonnement";
  static const String _PASS_TYPE_URL = "api/pass-type";

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
        if(user != null){
          _telaSharedPrefs.savePhoneNumber(user!.phone);
          _telaSharedPrefs.saveName(user!.nom + ' ' + user!.prenom);
        }
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
        if(user != null){
          _telaSharedPrefs.savePhoneNumber(user!.phone);
          _telaSharedPrefs.saveName(user!.nom + ' ' + user!.prenom);
        }

        for(var ab in json["abonnements"]){
          Abonnement abonnement = Abonnement.fromJson(ab);
          _abonnement == abonnement;
          _abonnements.add(abonnement);
        }
        print(json["abonnements"]);
        for(var p in json["place"]){
          TelaPlace place = TelaPlace.fromJson(p);
          print(place.toString());
          _myPlaces.add(place);
        }

        print(json["place"]);

        // print('logged In successfully with token $_token');
        _isConnected = true;
        _isConnectedSubject.sink.add(_isConnected);
      }  else {
        if (response.statusCode == 404) {
          throw "Le numero de telephone saisit n'existe pas";

        }
        print('ERROR reponse status code not 200');
      }

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
    // await _telaSharedPrefs.saveAbonnementType(abonnementType);
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