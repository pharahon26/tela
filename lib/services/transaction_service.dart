
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/services/telaSharedPrefs.dart';

import 'package:rxdart/rxdart.dart';

class TransactionService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _ABONNEMENT_CREATE_URL = "api/abonnements/buy_abonement";
  static const String _PASS_CREATE_URL = "api/pass-visite/buy_pass_visite";
  static const String _TRANSACTION_CREATE_URL = "api/transactions/create";
  static const String _TRANSACTION_URL = "api/transactions/";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;
  Abonnement? _abonnement;
  Abonnement? _abonnementTV;
  Abonnement? _abonnementPro;
  String _token = '';
  bool _isConnected = false;


  String get token => _token;

  set token(String value) {
    _token = value;
  }

  Abonnement? get abonnementDemarcheur => _abonnementPro;
  Abonnement? get abonnementTV => _abonnementTV;
  Abonnement? get abonnement => _abonnement;
  TelaSharedPrefs _telaSharedPrefs = locator<TelaSharedPrefs>();


  TransactionService();


  /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);
  }


  /// pushTransaction
  Future<TelaTransaction?> postTransaction({required TelaTransaction transaction}) async {
    var client = _newClient();
    try{
      print('${Uri.parse(_BASE_URL+_TRANSACTION_CREATE_URL)} push transaction : $transaction');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_TRANSACTION_CREATE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(transaction.toJson()),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        TelaTransaction transac = TelaTransaction.fromJson(json);
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

  /// push abonnement
  Future<Abonnement?> buyAbonnement({required AbonnementType abonnement, required TelaTransaction transaction, required int userId}) async {
    var client = _newClient();
    Map<String, dynamic> js = transaction.toJson();
    js.addAll(abonnement.toJson2());
    js['user_id'] = userId;
    Abonnement? abonnem;
    try{
      print('${Uri.parse(_BASE_URL+_ABONNEMENT_CREATE_URL)} push abonnement : $js');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_ABONNEMENT_CREATE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(js),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        Abonnement abon = Abonnement.fromJson(json['abonnement']);
        // TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        _telaSharedPrefs.saveAbonnement(abon);
        // print(transac.toString());
        print(abon.toString());
        abonnem = abon;

      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('transaction api service buy abonnemet error** $e');
    }
    finally{
      client.close();
    }
    return abonnem;
  }

  /// push buy pass
  Future<PassVisite?> buyPassVisite({required PassType pass, required TelaTransaction transaction}) async {
    var client = _newClient();
    Map<String, dynamic> js = transaction.toJson();
    PassVisite? passVisite;
    js.addAll(pass.toJson2());
    try{
      print('${Uri.parse(_BASE_URL+_PASS_CREATE_URL)} buy pass : $js');
      http.Response response = await client.post(Uri.parse(_BASE_URL+_PASS_CREATE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(js),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        PassVisite pa = PassVisite.fromJson(json['passvisite']);
        TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        print(transac.toString());
        print(pa.toString());
        passVisite = pa;
        await _telaSharedPrefs.savePassVisite(pa);

      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('transaction api service Buy pass error** $e');
    }
    finally{
      client.close();
    }
    return passVisite;
  }

  /// GET TRANSACTION NUMBER
  Future<String> getTransactionNumber(String type) async {
    var client = _newClient();
    String tn = '';
    try{
      print('${Uri.parse('$_BASE_URL$_TRANSACTION_URL$type/getnumber')} get transaction number');
      http.Response response = await client.get(Uri.parse('$_BASE_URL$_TRANSACTION_URL$type/getnumber'),
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

        tn = json['transaction_number'];
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
    return tn;
  }






}