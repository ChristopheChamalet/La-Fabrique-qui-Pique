import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:lafabp/views/BookRucher/widgets/bookist.dart';
import 'package:provider/provider.dart';
import "package:select_form_field/select_form_field.dart";
import 'package:http/http.dart' as http;
import 'package:lafabp/models/book_model_form.dart';
import 'dart:convert';
import '../../../models/book_model_form.dart';
import '../../../models/user_model.dart';
import '../../../providers/user_provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class BookFormView extends StatefulWidget {
  
  const BookFormView({ Key? key }) : super(key: key);

  @override
  State<BookFormView> createState() => _BookFormViewState();
}

class _BookFormViewState extends State<BookFormView> {
  late BookFormModel bookFormModel;
  late FocusNode _dateRuche;
  late FocusNode _numRuche;
  late FocusNode _ouvertureRuche;
  late FocusNode _description;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  FormState get form => key.currentState!;
  final dateController = TextEditingController();
  final numRucheController= TextEditingController();
  final reineController = TextEditingController();
  final crController = TextEditingController();
  final oeufsController = TextEditingController();
  final couvainsController = TextEditingController();
  final forceController = TextEditingController();
  final traitementController = TextEditingController();
  final nourissementController = TextEditingController();
  final nbHausseController = TextEditingController();
  final descriptionController = TextEditingController();




    final List<Map<String, dynamic>> _force = [
  {
    'value': '0',
    'label': '0',
    'icon': const Icon(Icons.stop),
  },
  {
    'value': '1',
    'label': '1',
    'icon': const Icon(Icons.stop),
  },
  {
    'value': '2',
    'label': '2',
    'icon': const Icon(Icons.grade),
  },
    {
    'value': '3',
    'label': '3',
    'icon': const Icon(Icons.grade),
  },
    {
    'value': '4',
    'label': '4',
    'icon': const Icon(Icons.grade),
  },
    {
    'value': '5',
    'label': '5',
    'icon': const Icon(Icons.grade),
  },
];

final List<Map<String , dynamic>> _traitement = [
  {
      'value': 'Oui',
      'label': 'Oui',
      'icon': const Icon(Icons.arrow_back),
  },
  {
    'value': 'Non',
    'label': 'Non',
    'icon': const Icon(Icons.arrow_back),
  }

];



@override
void initState() {
  bookFormModel = BookFormModel(numRuche: null, date:  null , reine: null, cr: null, oeufs: null, couvains: null, force: null, traitement: null, nourissement: null, nbhausse: null, description: null);
  _dateRuche = FocusNode();
   _numRuche = FocusNode();
  _ouvertureRuche = FocusNode();
  _description = FocusNode();
  super.initState();
}

@override
void dispose() {
  _dateRuche.dispose();
  _numRuche.dispose();
  _ouvertureRuche.dispose();
  _description.dispose();
  numRucheController.dispose();
  reineController.dispose();
  crController.dispose();
  oeufsController.dispose();
  couvainsController.dispose();
  forceController.dispose();
  traitementController.dispose();
  nourissementController.dispose();
  nbHausseController.dispose();
  descriptionController.dispose();
  dateController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final format = DateFormat.yMMMMd();
    const String host = 'http://10.0.2.2';
   final User? user = Provider.of<UserProvider>(context).user;


  Future<dynamic> addNotes(BookFormModel bookFormModel) async {
    try { 
        bookFormModel = BookFormModel( user_id: user!.id, numRuche: numRucheController.text, date: dateController.text,  reine: crController.text, cr: crController.text,
         oeufs: oeufsController.text, couvains: couvainsController.text, force: forceController.text, traitement: traitementController.text, nourissement: nourissementController.text,
         nbhausse: nbHausseController.text, description: descriptionController.text);
      http.Response response = await http.post(Uri.parse("$host/api/lafabp/notes"),
         headers: {'Content-type': 'application/json'},
         body: json.encode(bookFormModel.toJson()),
      );
        if(response.statusCode == 201) {
          return json.decode(response.body);
        }
        return null;
    } catch (e) {
      return e;
    }
  }
    return Form(
      key: key,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
            child: DateTimeField(
                  controller: dateController,
                  format: format,
            style:  TextStyle(
                   fontSize: 22,
                   color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold,
                 ),
                 decoration: const InputDecoration(
                   focusColor: Colors.amber,
                   iconColor: Colors.amber,
                   border: InputBorder.none,
                  prefixIcon:  Icon(Icons.calendar_month , size: 30, color: Colors.amber,),
                  labelText: 'Date',
                  labelStyle:  TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
                  onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
                  },
                 validator: (value) {
                     if(value == null) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                ),
          ),
          const SizedBox(height: 15,),
          Container(
            margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
            child: TextFormField(
                controller: numRucheController,
               // focusNode: _description,
                     style:  TextStyle(
                   fontSize: 22,
                   color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold,
                 ),
                 decoration: const InputDecoration(
                   focusColor: Colors.amber,
                   iconColor: Colors.amber,
                   border: InputBorder.none,
                  prefixIcon:  Icon(Icons.numbers , size: 30, color: Colors.amber,),
                  labelText: 'Num Ruche',
                  labelStyle:  TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
                      validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    bookFormModel.numRuche = newValue;
                  }
              ),
          ),
           const SizedBox(height: 15,),
                Container(
                margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
                  child: TextFormField(
                  controller: reineController,
                  // focusNode: _description,
                        style:  TextStyle(
                   fontSize: 22,
                   color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold,
                 ),
                   decoration: const InputDecoration(
                   focusColor: Colors.amber,
                   iconColor: Colors.amber,
                   border: InputBorder.none,
                  prefixIcon:  Icon(Icons.cabin , size: 30, color: Colors.amber,),
                  labelText: 'Avez vous-vu votre reine ?',
                  labelStyle:  TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
                      validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    bookFormModel.reine = newValue;
                  }
                            ),
                ),
                 const SizedBox(height: 15,),
                Container(
                  margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
               decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
                  child: TextFormField(
                  controller: crController,
                              //focusNode: _description,
                   style:  TextStyle(
                   fontSize: 22,
                   color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold,
                 ),
                    decoration: const InputDecoration(
                   focusColor: Colors.amber,
                   iconColor: Colors.amber,
                   border: InputBorder.none,
                  prefixIcon:  Icon(Icons.expand_circle_down, size: 30, color: Colors.amber,),
                  labelText: 'CR',
                  labelStyle:  TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
                      validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    bookFormModel.cr = newValue;
                  }
                            ),
                ),
                 const SizedBox(height: 15,),
                 Container(
                  margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
                   child: TextFormField(
                               controller: oeufsController,
                              // focusNode: _description,
                     style:  TextStyle(
                     fontSize: 22,
                     color: Theme.of(context).primaryColor,
                     fontWeight: FontWeight.bold,
                   ),
                     decoration: const InputDecoration(
                     focusColor: Colors.amber,
                     iconColor: Colors.amber,
                     border: InputBorder.none,
                    prefixIcon:  Icon(Icons.egg , size: 30, color: Colors.amber,),
                    labelText: 'Oeufs',
                    labelStyle:  TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                      validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                                 },
                                 onSaved: (newValue) {
                    bookFormModel.oeufs = newValue;
                                 }
                             ),
                 ),
                  const SizedBox(height: 15,),
                Container(
                  margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
                  child: TextFormField(
                              controller: couvainsController,
                              //focusNode: _description,
                     style:  TextStyle(
                     fontSize: 22,
                     color: Theme.of(context).primaryColor,
                     fontWeight: FontWeight.bold,
                   ),
                     decoration: const InputDecoration(
                     focusColor: Colors.amber,
                     iconColor: Colors.amber,
                     border: InputBorder.none,
                    prefixIcon:  Icon(Icons.egg , size: 30, color: Colors.amber,),
                    labelText: 'Couvains',
                    labelStyle:  TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                      validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    bookFormModel.couvains = newValue;
                  }
                            ),
                ),
                 const SizedBox(height: 15,),
            Container(
              margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
              child: SelectFormField(
                controller: forceController,
                type: SelectFormFieldType.dropdown,
                items: _force,
                labelText: 'force',
                 style:  TextStyle(
                     fontSize: 22,
                     color: Theme.of(context).primaryColor,
                     fontWeight: FontWeight.bold,
                   ),
                 decoration: const InputDecoration(
                     focusColor: Colors.amber,
                     iconColor: Colors.amber,
                     border: InputBorder.none,
                    prefixIcon:  Icon(Icons.egg , size: 30, color: Colors.amber,),
                    labelText: 'Force',
                    labelStyle:  TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                   validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                onSaved: (newValue) {
                  bookFormModel.force = newValue;
                },
              ),
            ),
             const SizedBox(height: 15,),
                    Container(
              margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
                      child: SelectFormField(
              controller: traitementController ,
              type: SelectFormFieldType.dropdown,
              items: _traitement,
              labelText: 'Traitement ',
                  style:  TextStyle(
                   fontSize: 22,
                   color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold,
                 ),
               decoration: const InputDecoration(
                   focusColor: Colors.amber,
                   iconColor: Colors.amber,
                   border: InputBorder.none,
                  prefixIcon:  Icon(Icons.egg , size: 30, color: Colors.amber,),
                  labelText: 'Traitement',
                  labelStyle:  TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  ),
                 ),
                 validator: (value) {
                   if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                  } else {
                        return null;
                          }
                },
              onSaved: (newValue) {
                bookFormModel.traitement = newValue;
              },
            ),
                    ),
                     const SizedBox(height: 15,),
                Container(
                margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
                  child: SelectFormField(
              controller: nourissementController,
              type: SelectFormFieldType.dropdown,
              items: _traitement,
                  style:  TextStyle(
                     fontSize: 22,
                     color: Theme.of(context).primaryColor,
                     fontWeight: FontWeight.bold,
                   ),
               decoration: const InputDecoration(
                     focusColor: Colors.amber,
                     iconColor: Colors.amber,
                     border: InputBorder.none,
                    prefixIcon:  Icon(Icons.egg , size: 30, color: Colors.amber,),
                    labelText: 'Nourrissement',
                    labelStyle:  TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                   validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
              onSaved: (newValue) {
                  bookFormModel.nourissement = newValue;
              },
            ),
                ),
                 const SizedBox(height: 15,),
            Container(
              margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
              child: TextFormField(
                controller: nbHausseController,
                //focusNode: _description,
                   style:  TextStyle(
                     fontSize: 22,
                     color: Theme.of(context).primaryColor,
                     fontWeight: FontWeight.bold,
                   ),
                 decoration: const InputDecoration(
                     focusColor: Colors.amber,
                     iconColor: Colors.amber,
                     border: InputBorder.none,
                    prefixIcon:  Icon(Icons.egg , size: 30, color: Colors.amber,),
                    labelText: 'Nb Hausses',
                    labelStyle:  TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                      validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    bookFormModel.nbhausse = newValue;
                  }
              ),
            ),
             const SizedBox(height: 15,),
            Container(
              margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(5.0, 5.0)
                  ),
              ]  
                  ),
              child: TextFormField(
                controller: descriptionController,
                focusNode: _description,
                   style:  TextStyle(
                     fontSize: 22,
                     color: Theme.of(context).primaryColor,
                     fontWeight: FontWeight.bold,
                   ),
                 decoration: const InputDecoration(
                     focusColor: Colors.amber,
                     iconColor: Colors.amber,
                     border: InputBorder.none,
                    prefixIcon:  Icon(Icons.egg , size: 30, color: Colors.amber,),
                    labelText: 'Description',
                    labelStyle:  TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                      validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'Veuillez Remplir tout les champs';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    bookFormModel.description = newValue;
                  }
              ),
            ),
            const SizedBox(height: 15,),
            Container(
               margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15),
              child: SizedBox(
                 height: 55,
                  width: double.infinity,
                child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        onPressed: () {
                          addNotes(bookFormModel);
                          setState(() {
                            dateController.clear();
                            numRucheController.clear();
                            reineController.clear();
                            crController.clear();
                            oeufsController.clear();
                            couvainsController.clear();
                            forceController.clear();
                            traitementController.clear();
                            nourissementController.clear();
                            nbHausseController.clear();
                            descriptionController.clear();
                          });
                        },
                        child:  const Text(
                         'Enregistrer',
                         style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.00,
                     ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0,),
               Container(
                 margin: const EdgeInsets.only( left:  15 , right:  15 , top: 15 , bottom:  15),
                 child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton( 
                  style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),     
                 onPressed: () {
                  Navigator.pushNamed(context, BookList.routeName);
                 },
                 child:  const Text(
                  'Vos Notes',
                   style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20.00,
                   ),
              ),
            ),
          ),
               ), 
        ]
        ),
    );
  }
}