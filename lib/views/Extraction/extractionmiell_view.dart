import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lafabp/nav/nav_drawer.dart';
import 'package:http/http.dart' as http;


class ExtractionMielView extends StatefulWidget {
  static String routename = '/extraction';
  const ExtractionMielView({ Key? key }) : super(key: key);

  @override
  State<ExtractionMielView> createState() => _ExtractionMielViewState();
}

class _ExtractionMielViewState extends State<ExtractionMielView> {


@override
  void initState() {
  super.initState();
}
 DateTime? _dateResa;

 Future sendEmail( date) async {
      const serviceId = "service_h1f2ysk";
      const templateId = "template_pmxe3sk";
      const userId = '4VSzqvMx-_qKHbn8V';
  try {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
     await http.post(
      url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id' : serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template-params': {
          'user_date': date
        },
      }),   
    );
  } catch (e) {
    rethrow;
  }
}



  @override
  Widget build(BuildContext context) {
  final format = DateFormat("yyyy MM dd");
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerView(), 
      body: Column(
        children:[
        Expanded(
            flex: 1,
            child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Miel.jpg"),
                fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: <Widget> [
                  AppBar(
                    title:  const Text("Extraction Miellerie"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children:   [
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
                   ],
                  ),
              child: DateTimeField(
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
                  ),
            ),
            
              ],
            ),
          ),
          FloatingActionButton(
              child: const Icon(Icons.save),
          onPressed: (() => sendEmail(_dateResa)),
           ),
        ] 
      ),
    );
  }
}