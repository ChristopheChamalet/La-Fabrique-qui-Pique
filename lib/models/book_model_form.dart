

// ignore_for_file: non_constant_identifier_names

class BookFormModel {
  String?  user_id;
  String? numRuche;
  String? date;
  String? reine;
  String? cr;
  String? oeufs;
  String? couvains;
  String? force;
  String? traitement;
  String? nourissement;
  String? nbhausse;
  String? description;
  

  BookFormModel({this.user_id , this.numRuche ,this.date , this.reine , this.cr , this.oeufs , this.couvains , this.force , this.traitement , this.nourissement , this.nbhausse ,  this.description});

  Map<String, dynamic> toJson() {
    return {
      'user_id':user_id,
      'numRuche': numRuche,
      'date' : date,
      'reine': reine,
      'cr': cr,
      'oeufs': oeufs,
      'force': force,
      'couvains': couvains,
      'traitement': traitement,
      'nourissement': nourissement,
      'nbhausse': nbhausse,
      'description': description
    };

  }
}