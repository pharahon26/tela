
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/transactions.dart';

import 'package:rxdart/rxdart.dart';

class TransactionService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _ABONNEMENT_CREATE_URL = "api/transactions/buy_abonement";
  static const String _TRANSACTION_CREATE_URL = "api/transactions/create";

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
  Future<Abonnement?> buyAbonnement({required Abonnement abonnement, required TelaTransaction transaction}) async {
    var client = _newClient();
    Map<String, dynamic> js = transaction.toJson();
    js.addAll(abonnement.toJson());
    try{
      print('${Uri.parse(_BASE_URL+_ABONNEMENT_CREATE_URL)} push abonnement : $abonnement');
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
        TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        print(transac.toString());
        print(abon.toString());

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
    return abonnement;
  }

  /// GET COMMUNES
  // Future<List<Commune>> getCommunes() async {
  //   var client = _newClient();
  //   List<Commune> communesList =[];
  //   try{
  //     print('${Uri.parse(_BASE_URL+_COMMUNE_URL)} get communes');
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






}