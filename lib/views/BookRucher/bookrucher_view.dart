import 'package:flutter/material.dart';
import 'package:lafabp/nav/nav_drawer.dart';
import './widgets/book_form_view.dart';

class BookRucherView extends StatefulWidget {
  static String routename = '/book';
  const BookRucherView({ Key? key }) : super(key: key);

  @override
  State<BookRucherView> createState() => _BookRucherViewState();
}

class _BookRucherViewState extends State<BookRucherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerView(),
          body: Column(
            children: <Widget> [
            Expanded(
            flex: 1,
            child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Livre.jpg"),
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
                    title:  const Text("Notes"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
            const SizedBox(height: 10,),  
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      BookFormView(),
                    ],
                    ),
                ),
            ),
          ],
          ),
        
    );
  }
}