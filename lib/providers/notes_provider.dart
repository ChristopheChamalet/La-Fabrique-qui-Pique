import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lafabp/models/book_model_form.dart';
import 'dart:convert';


class NotesProvider with ChangeNotifier {
  final String host = 'http://10.0.2.2';
 // late Notes notes;

 Future<dynamic> addNotes(BookFormModel bookFormModel) async {
    try {
      http.Response response = await http.post(Uri.parse("$host/api/lafabp/notes"),
         headers: {'Content-type': 'application/json'},
         body: json.encode(bookFormModel.toJson()),
      );
        if(response.statusCode == 201) {
          return json.decode(response.body);
        }
        return null;
      
    } catch (e) {
      rethrow;
    }
  }


}