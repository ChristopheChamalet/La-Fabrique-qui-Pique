import 'package:flutter/material.dart';
import 'package:lafabp/views/BookRucher/widgets/bookcard.dart';
import '../../../services/notifications_services.dart';
import 'package:lafabp/nav/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:lafabp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../models/book_model.dart';
import '../../../models/user_model.dart';
class BookList extends StatefulWidget {
  static  String routeName = "/booklist";
  const BookList({ Key? key }) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
 
}


class _BookListState extends State<BookList> {


 final String host = 'http://10.0.2.2';

 Future getNotes() async {
    try {
       var response = await http.get(Uri.parse("$host/api/lafabp/notes"),
       headers: {'Content-type': 'application/json',         
       },
       );
        var jsonData = jsonDecode(response.body);
        List<Notes> notes = [];
        for( var i in jsonData) {
          Notes note = Notes(id: i["_id"], user_id: i["user_id"], numRuche: i['numRuche'], date: i['date'], reine: i['reine'], cr: i['cr'], oeufs: i['oeufs'], couvains: i['couvains'], force: i['force'], traitement: i['traitement'], nourissement: i['nourissement'], nbhausse: i['nbhausse'], description: i['description']);
          notes.add(note);
        }
        return notes;
    } catch (e) {
      rethrow;
    }
  }


  Future deleteNote(String _id) async {
    try {
      http.Response response = await http.delete(Uri.parse('$host/api/lafabp/notes/$_id'));
      if(response.statusCode == 200) {
      }
    } catch (e) {
      rethrow;
    }
  }

void setNotifs() async  {
    await showDialog(
    context: context,
     builder: (context) => Dialog(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget> [
           
           ElevatedButton(
             onPressed: () { sendNotificationsDaily(title: 'Rappel Pour vos Ruches' , body: 'N"oubliez pas de visiter vos ruches si nécessaire ou de mettre à jour vos notes');
             Navigator.pop(context , 'save');
             },
             child: const Text("Rappel Ruchers tout les jours"),
              style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                     borderRadius:  BorderRadius.circular(10.0),
                    ),
                  ),
                 ),
             ),
              ElevatedButton(
                 onPressed: () { sendNotificationsWeekly(title: 'Rappel Pour vos Ruches' , body: 'N"oubliez pas de visiter vos ruches si nécessaire ou de mettre à jour vos notes');
             Navigator.pop(context , 'save');
             },
              child: const Text("Rappel Ruchers toutes les semaines"),
              style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                     borderRadius:  BorderRadius.circular(10.0),
                    ),
                  ),
                 ),
             ),
                ElevatedButton(
             onPressed: () { cancelNotifications();
             Navigator.pop(context , 'save');
             },
             child: const Text("Cancel les notifications"),
              style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                     borderRadius:  BorderRadius.circular(10.0),
                    ),
                  ),
                 ),
             ),
         ]
         ),
     ));
}







 
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos Notes'),
        leading: IconButton(
          onPressed: () => setNotifs(), 
           icon: const Icon(Icons.notifications)),
      ),
      drawer: const DrawerView(),
      body: Center(
          child: Card(
            child: FutureBuilder(
              future: getNotes(),
              builder: (context , AsyncSnapshot snapshot) {
                if(snapshot.data == null) {
                  return const Center(
                    child: Text('Pas de Notes.'),
                   );
                // ignore: unrelated_type_equality_checks
                } else if(snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context , index) {
                      if(snapshot.data[index].user_id == user?.id) {
                           return ListTile(
                        title: Text(snapshot.data[index].description),
                        subtitle: Text(snapshot.data[index].date),
                        leading: IconButton(icon: const Icon(Icons.pending),  onPressed: () {  
                        },),
                        trailing: IconButton(icon:  const Icon(Icons.delete , color: Colors.red,) ,  onPressed: () {  deleteNote(snapshot.data[index].id); },),
                      );
                      }  else {
                  return const SizedBox.shrink();
                }
                    } 
                    );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          ),
        ),
    );
  }
}


