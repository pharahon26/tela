class TelaTransaction{

  int id = 0;
  String type = '';
  String paymentWay = '';
  String transactionNumber = '';
  int userID = 0;
  double amount = 0;
  DateTime date = DateTime.now();


  TelaTransaction(
      {required this.id,
      required this.type,
      required this.paymentWay,
      required this.transactionNumber,
      required this.userID,
      required this.amount,
      required this.date});



  static TelaTransaction fromJson(Map<String, dynamic> json){
    TelaTransaction u = TelaTransaction(
      id : json["id"],
      amount: json["amount"],
      userID: json["user_id"],
      type: json["type"],
      transactionNumber: json["transaction_number"],
      date: DateTime.parse(json["date"]),
      paymentWay: json["payment_way"],
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "amount": amount,
      "user_id": userID,
      "date": date.toIso8601String(),
      "transaction_number": transactionNumber,
      "payment_way": paymentWay,
      "type": type,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TelaTransaction &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          paymentWay == other.paymentWay &&
          transactionNumber == other.transactionNumber &&
          userID == other.userID &&
          amount == other.amount &&
          date == other.date;

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      paymentWay.hashCode ^
      transactionNumber.hashCode ^
      userID.hashCode ^
      amount.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'TelaTransaction{id: $id, type: $type, paymentWay: $paymentWay, TransactionNumber: $transactionNumber, userID: $userID, amount: $amount, date: $date}';
  }
}