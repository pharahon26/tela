class Abonnement{

  int id = 0;
  String type = '';
  int userId = 0;
  int transactionId = 0;
  DateTime start;
  DateTime end;


  Abonnement(
      {required this.id,
      required this.type,
      required this.userId,
      required this.transactionId,
      required this.start,
      required this.end});


  static Abonnement fromJson(Map<String, dynamic> json){
    Abonnement u = Abonnement(
      id : json["id"],
      type: json["type"],
      start: json["start"],
      end: json["end"],
      userId: json["user_id"],
      transactionId: json["transaction_id"],
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "type": type,
      "start": start.toIso8601String(),
      "end": end.toIso8601String(),
      "user_id": userId,
      "transaction_id": transactionId,
    };
  }

  @override
  String toString() {
    return 'Abonnement{id: $id, type: $type, userId: $userId, transactioId: $transactionId, start: $start, end: $end}';
  }
}