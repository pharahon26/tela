
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/models/programetv.dart';
import 'package:rxdart/rxdart.dart';

class PlaceService{
  /// URLS
  static const String _BASE_URL = "http://10.0.2.2:8000/";
  static const String _TV_URL = "telaapi/tv_program";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;

  PlaceService();


  /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);
  }
  /// GET tv programs
  Future<List<TelaProgrammeTV>> programs() async {
    var client = _newClient();
    List<TelaProgrammeTV> programes =[];
    try{
      print('${Uri.parse(_BASE_URL+_TV_URL)} get programs');
      http.Response response = await client.get(Uri.parse('$_BASE_URL$_TV_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

        for(var prog in json["images"]){
          programes.add(TelaProgrammeTV.fromJson(prog));
          print(prog);
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
    return programes;
  }

  void close(){
  }

}