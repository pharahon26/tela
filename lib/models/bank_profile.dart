import 'package:mobile/models/user.dart';

class TelaBankProfile{
  int? id = 0;
  String? mail;
  String phone;
  double balance = 0;
  bool isStaff = false;
  bool isDemarcheur = false;
  bool isSuspended = false;
  bool isValidated = false;
  bool hasEpargne = false;
  // String token = '';
  // DateTime tokenDate = DateTime.now();

  // the cash object related to the user will be hold here for the moment
  DateTime? creationDate;
  int? userId = 0;
  int userIdentityId = 0;
  User? user;
  UserIdentity? userIdentity;


  TelaBankProfile({
    required this.phone,
    required this.balance,
    required this.userIdentityId,
    this.mail,
    this.hasEpargne = false,
    this.isValidated = false,
    this.isDemarcheur = false,
    this.isStaff = false,
    this.isSuspended = false,
    this.userId,
    this.user,
    this.userIdentity,
    this.creationDate,
  });

  static TelaBankProfile fromJson(Map<String, dynamic> json){
    TelaBankProfile u = TelaBankProfile(
      userId: json["user_id"],
      phone: json["phone"],
      balance: double.parse(json["balance"]),
      userIdentityId: json["information_identity_id"],
      mail: json["email"],
      isValidated: json["is_validated"]==1,
      isSuspended: json["is_suspended"]==1,
      isStaff: json["is_staff"]==1,
      isDemarcheur: json["is_demarcheur"]==1,
      hasEpargne: json["has_epargne"]==1,
    );
    u.id = json["id"];
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "information_identity_id": userIdentityId,
      "mail": mail,
      "phone": phone,
      "balance": balance,
      "creationDate": creationDate,
      "isSuspended": isSuspended?1:0,
      "is_validated": isValidated?1:0,
      "isStaff":isStaff?1:0,
      "is_demarcheur":isDemarcheur?1:0,
      "has_epargne":hasEpargne?1:0,
    };
  }

  @override
  String toString() {
    return 'TelaBankProfile{id: $id, mail: $mail, phone: $phone, balance: $balance, isStaff: $isStaff, isDemarcheur: $isDemarcheur, isSuspended: $isSuspended, isValidated: $isValidated, hasEpargne: $hasEpargne, creationDate: $creationDate, userId: $userId, userIdentityId: $userIdentityId}';
  }
}

/// Epargne profile
class TelaBankEpargne{
  int? id = 0;
  double balance = 0;
  double amountFrezze = 0;
  DateTime? debutEpargne;
  DateTime? finEpargne;
  DateTime? creationDate;
  int eBankId = 0;
  TelaBankProfile? eBankProfile;


  TelaBankEpargne({
    required this.debutEpargne,
    required this.finEpargne,
    required this.balance,
    required this.amountFrezze,
    required this.eBankId,
    this.eBankProfile,
    this.creationDate,
  });

  static TelaBankEpargne fromJson(Map<String, dynamic> json){
    TelaBankEpargne u = TelaBankEpargne(
      eBankId: json["ebank_profil_id"],
      balance: double.parse(json["balance"]),
      amountFrezze: double.parse(json["amount_freeze"]),
      eBankProfile: json["ebank_profil"],
      debutEpargne: DateTime.parse(json["debut_epargne"]),
      finEpargne: DateTime.parse(json["fin_epargne"]),
    );
    u.id = json["id"];
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "ebank_profil_id": eBankId,
      "debut_epargne": debutEpargne?.toIso8601String(),
      "fin_epargne": finEpargne?.toIso8601String(),
      "balance": balance,
      "amount_freeze": amountFrezze,
    };
  }

  @override
  String toString() {
    return 'TelaBankEpargne{id: $id, balance: $balance, amountFrezze: $amountFrezze, debutEpargne: $debutEpargne, finEpargne: $finEpargne, creationDate: $creationDate, eBankId: $eBankId, eBankProfile: $eBankProfile}';
  }
}