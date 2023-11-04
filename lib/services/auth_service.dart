
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/demacheur.dart';
import 'package:mobile/models/user.dart';
import 'package:rxdart/rxdart.dart';

class PyraAPIService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _SIGN_UP_URL = "register";
  static const String _LOGIN_URL = "login";
  static const String _COMMUNE_URL = "tela_api/communes";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;
  User? _user;
  Demarcheur? _demarcheur;
  Abonnement? _abonnement;
  String _token = '';
  bool _isConnected = false;
  final BehaviorSubject<bool> _isConnectedSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isConnected => _isConnectedSubject.stream.asBroadcastStream();

  String get token => _token;
  User? get user => _user;
  Demarcheur? get demarcheur => _demarcheur;
  Abonnement? get abonnement_demarcheur => _abonnement;


  PyraAPIService();


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
      print('${Uri.parse(_BASE_URL+_SIGN_UP_URL)} sign In : $nom $prenom $telephone');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_SIGN_UP_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "nom": nom,
          "prenom": prenom,
          "telephone": telephone,
          "password": password,
          "mail": mail,
          "isDemarcheur": isDemarcheur,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer ' + json["token"]["access_token"];
        _user = User.fromJson(json["user"]);
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
        // _token = 'Bearer '+ json["token"]["access_token"];
        _user = User.fromJson(json["user"]);
        print(_user.toString());
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
  Future<List<Commune>> communes() async {
    var client = _newClient();
    List<Commune> communesList =[];
    try{
      print('${Uri.parse(_BASE_URL+PyraAPIService._COMMUNE_URL)} get communes');
      http.Response response = await client.get(Uri.parse(_BASE_URL+_LOGIN_URL),
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

        for(var commune in json["communes"]){
          communesList.add(Commune.fromJson(commune));
          print(commune);
        }
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
    return communesList;
  }

  void close(){
    _isConnectedSubject.close();
  }

}