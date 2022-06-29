import 'package:flutter/material.dart';

// Widget de la route Not Found si errreur, le chemin menant à une page de l'app ne fonctionnerait pas.

class NotFound extends StatelessWidget {
  const NotFound({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child:  const Text(
          'Page Non Trouvée',
          style: TextStyle(
            fontSize: 40.00,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}