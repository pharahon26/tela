class User {
  /// a class that will hold the user data need the names and the balance first.
  /// the balance is not mandatory*/

  // Variables
  int id = 0 ;
  String prenom;
  String nom;
  String mail;
  String phone;
  bool isDemarcheur = false;
  bool isStaff = false;
  bool isSuspended = false;
  // String token = '';
  // DateTime tokenDate = DateTime.now();

  // the cash object related to the user will be hold here for the moment
  DateTime creationDate = DateTime.now();


  // Constructor
  User({required this.nom,
    required this.prenom,
    this.mail = '',
    this.phone = '',
    this.isDemarcheur = false,
    this.isStaff = false,
    this.isSuspended = false,
  });

  static User fromJson(Map<String, dynamic> json){
    User u = User(
      nom: json["nom"],
      prenom: json["prenoms"],
      mail: json["email"],
      phone: json["phone"],
      isSuspended: json["is_suspended"]==1,
      isDemarcheur: json["is_demarcheur"]==1,
      isStaff: json["is_staff"]==1,
    );
    u.id = json["id"];
    u.creationDate = DateTime.parse(json["created_at"]);
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
      "creationDate": creationDate,
      "isSuspended": isSuspended?1:0,
      "isDemarcheur": isDemarcheur?1:0,
      "isStaff":isStaff?1:0,
    };
  }

  @override
  String toString() {
    return 'Users{id: $id, prenom: $prenom, nom: $nom, mail: $mail, phone: $phone, isDemarcheur: $isDemarcheur, isStaff: $isStaff, isSuspended: $isSuspended, creationDate: $creationDate}';
  }
}