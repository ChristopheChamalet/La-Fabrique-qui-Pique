
// Class du formulaire d'inscription, Les Strings peuvent être nuls car aucune entrée n'est défini par défaut, puis on récupère la donnée en format JSONs

class SignUpForm {
  String? email;
  String? username;
  String? password;

  SignUpForm({ this.email,  this.password ,  this.username});

    Map<String , dynamic> toJson() {
      return {
        'email': email,
        'username': username,
        'password': password
      };
    }

}