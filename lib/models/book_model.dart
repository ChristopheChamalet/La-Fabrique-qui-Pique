

// ignore_for_file: non_constant_identifier_names

class Notes {
    String user_id;
    String id;
    String numRuche;
    String date;
    String reine;
    String cr;
    String oeufs;
    String couvains;
    String force;
    String traitement;
    String nourissement;
    String nbhausse;
    String description;

  Notes({  required this.user_id,  required this.id , required this.numRuche,   required this.date, required this.reine , required this.cr , required this.oeufs , required this.couvains , required this.force , required this.traitement , required this.nbhausse, required this.nourissement , required this.description});

Notes.fromJson(Map< String , dynamic> json) :
  id = json['_id'],
  user_id = json['user_id'], 
  numRuche = json['numRuche'],
  date = json['date'],
  reine = json['reine'],
  cr = json['cr'],
  oeufs = json['oeufs'],
  couvains = json['couvains'],
  force = json['force'],
  traitement = json['traitement'],
  nourissement = json['nourissement'],
  nbhausse = json['nbhausse'],
  description = json['description'];
}