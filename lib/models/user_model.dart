// Class d'un User il n'y a pas de password car il sera crypté par un Token, puis ensuite la data est récupérée en format JSON

class User {
  String id;
  String username;
  String email;
  User({required this.email , required this.username, required this.id});

  User.fromJson(Map<String , dynamic> json) : id = json['_id'] , username = json['username'], email = json['email'];
}