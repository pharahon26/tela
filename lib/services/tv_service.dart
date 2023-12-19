
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/models/programetv.dart';
import 'package:video_player/video_player.dart';

class TVService{
  /// URLS
  static const String _BASE_URL = "http://office.telaci.com";
  static const String _PUB_URL2 = "https://office.telaci.com/public/programmes_tv/liens_pub/";
  static const String _TV_URL = "telaapi/tv_program";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;
  List<String> publicites =[];
  late VideoPlayerController pubVideoController;
  late VideoPlayerController reportagesVideoController;
  bool playing = false;

  TVService();



  Future<void> init() async {
    pubVideoController = VideoPlayerController.networkUrl(Uri.parse("https://www.telaci.com/assets/videos/pub_tela.mp4"));
    // pubVideoController.seekTo(Duration(minutes: t));
    pubVideoController.setLooping(true);
    pubVideoController.setVolume(0);

    pubVideoController.initialize().then((_) {
    });
  }

   playPub(){
      pubVideoController.play();
  }
  pausePub(){
    pubVideoController.pause();
  }

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

  /// GET Publicitées links
  Future<List<String>> getPublicites() async {
    var client = _newClient();
    try{
      print('${Uri.parse(_PUB_URL2)} get programs');
      http.Response response = await client.get(Uri.parse(_PUB_URL2),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);

        for(var prog in json){
          publicites.add(prog['link']);
          print(prog);
        }
      }  else {
        print('ERROR reponse status code not 200');
      }

    }
    catch(e){
      print('publicite api service pub error** $e');
    }
    finally{
      client.close();
    }
    return publicites;
  }

  List<TelaProgrammeTV> progTest(){
    List<TelaProgrammeTV> list = [];
    list.add(TelaProgrammeTV(id: 1, type: 'Jeux tv', link: 'https://youtu.be/PY_N1XdFp4w?si=KisXUS31Nj44Wavm', webview: true, description: 'jeux', dateTournage: DateTime(2023, 7, 12), dateDiffusion: DateTime(2023, 7, 12)));
    list.add(TelaProgrammeTV(id: 2, type: 'Exemple', link: "assets/video/venez_voir.mp4", description: 'Live DIDI B ', dateTournage: DateTime(2022, 10, 20), dateDiffusion: DateTime(2022, 12, 20)));
    list.add(TelaProgrammeTV(id: 3, type: 'Exemple', link: "https://telaci.com/assets/videos/venez_voir.mp4", description: 'camer ', dateTournage: DateTime(2022, 10, 20), dateDiffusion: DateTime(2022, 12, 20)));
    list.add(TelaProgrammeTV(id: 4, type: 'live', link: 'https://www.facebook.com/video.php?v={837083301751759}', webview: true,  description: '???? ', dateTournage: DateTime(2022, 10, 20), dateDiffusion: DateTime(2022, 12, 20)));
    return list;
  }
  void close(){
  }

}