import 'package:mobile/models/user.dart';

class TelaBankProfile{
  int id = 0;
  String name = '';
  int userId = 0;
  User? user;


  TelaBankProfile({required this.id, required this.name, required this.userId});

  static TelaBankProfile fromJson(Map<String, dynamic> json){
    TelaBankProfile u = TelaBankProfile(
      id : json["id"],
      name: json["name"],
      userId: json["user_id"],
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "user_id": userId,
    };
  }


  @override
  String toString() {
    return 'TelaBankProfile{id: $id, name: $name, userId: $userId}';
  }
}