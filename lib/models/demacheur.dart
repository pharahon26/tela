import 'package:mobile/models/user.dart';

class Demarcheur {
  /// a class that will hold the user data need the names and the balance first.
  /// the balance is not mandatory*/

  // Variables
  int id = 0 ;
  double balance = 0;
  int userId = 0;
  User? user;
  bool isSuspended = false;
  DateTime creationDate = DateTime.now();


  // Constructor
  Demarcheur({required this.id,
    required this.balance,
    required this.userId,
    this.user,
    this.isSuspended = false,
  });

  static Demarcheur fromJson(Map<String, dynamic> json){
    Demarcheur u = Demarcheur(
      id : json["id"],
      balance: json["balance"],
      userId: json["user_id"],
      user: json["user"],
      isSuspended: json["isSuspended"],
    );
    u.creationDate = DateTime.parse(json["creationDate"]);
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "balance": balance,
      "user_id": userId,
      "creationDate": creationDate,
      "isSuspended": isSuspended?1:0,
    };
  }

  @override
  String toString() {
    return 'Demarcheur{id: $id, balance: $balance, userId: $userId, isSuspended: $isSuspended, creationDate: $creationDate}';
  }
}