import 'package:flutter/material.dart';
import 'package:lafabp/nav/nav_drawer.dart';

class DetailsNotes extends StatefulWidget {
  static const String routename = 'detailsnotes';
  const DetailsNotes({Key? key}) : super(key: key);

  @override
  State<DetailsNotes> createState() => _DetailsNotesState();
}

class _DetailsNotesState extends State<DetailsNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      body: Column(
        children:  const <Widget> [

        ],
      ),
    );
  }
}