class User {
  /// a class that will hold the user data need the names and the balance first.
  /// the balance is not mandatory*/

  // Variables
  int id = 0 ;
  String prenom;
  String nom;
  String mail;
  String phone;
  double balance = 0;
  bool isStaff = false;
  bool isSuspended = false;
  bool isValidated = false;
  // String token = '';
  // DateTime tokenDate = DateTime.now();

  // the cash object related to the user will be hold here for the moment
  DateTime creationDate = DateTime.now();


  // Constructor
  User({
    required this.nom,
    required this.prenom,
    this.mail = '',
    this.phone = '',
    this.balance = 0,
    this.isValidated = false,
    this.isStaff = false,
    this.isSuspended = false,
  });

  static User fromJson(Map<String, dynamic> json){

    print('before *********');
    User u = User(
      nom: json["nom"],
      prenom: json["prenoms"],
      mail: json["email"]??'',
      phone: json["phone"],
      balance: double.parse(json["balance"].toString()),
      isValidated: json["is_validated"]==1,
      isSuspended: json["is_suspended"]==1,
      isStaff: json["is_staff"]==1,
    );
    u.id = json["id"];

    print('before id');
    u.creationDate = DateTime.parse(json["created_at"]??'2023-10-10');
    return u;
  }
  static User fromString(Map<String, dynamic> json){
    User u = User(
      nom: json["nom"],
      prenom: json["prenom"],
      mail: json["mail"]??'',
      phone: json["phone"].toString(),
      balance: double.parse(json["balance"]),
      isValidated: bool.parse(json["isValidated"]),
      isSuspended: bool.parse(json["isSuspended"]),
      isStaff: bool.parse(json["isStaff"]),
    );
    u.id = int.parse(json["id"]);
    u.creationDate = DateTime.parse(json["creationDate"]);
    return u;
  }

  // map for database
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "nom": nom,
      "prenom": prenom,
      "mail": mail,
      "phone": phone,
      "balance": balance,
      "creationDate": creationDate,
      "isSuspended": isSuspended?1:0,
      "is_validated": isValidated?1:0,
      "isStaff":isStaff?1:0,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, prenom: $prenom, nom: $nom, mail: $mail, phone: $phone, balance: $balance, isStaff: $isStaff, isSuspended: $isSuspended, isValidated: $isValidated, creationDate: $creationDate}';
  }
}