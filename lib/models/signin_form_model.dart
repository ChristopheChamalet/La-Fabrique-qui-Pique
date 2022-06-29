
// Class du formulaire de connexion, Les Strings peuvent être nuls car aucune entrée n'est défini par défaut, puis on récupère la donnée en format JSONs

class SigninForm {
  String? email;
  String? password;
  SigninForm({
            this.email,
            this.password,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}