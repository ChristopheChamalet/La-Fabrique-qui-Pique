import 'package:flutter/material.dart';
import 'package:lafabp/animation.dart';
import 'package:lafabp/views/auth/widgets/signin_form.dart';
class HomeVieuw extends StatelessWidget {
  static String routename = '/';
  const HomeVieuw({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.00),
        child: Center(
          child: Container(
            color: Colors.white,
            child: AnimationWidget(
              delay: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:   const <Widget>[
                  SizedBox(height: 70,),
                  Image(
                    image: AssetImage('assets/images/FABP_Logo.jpg'),
                    fit: BoxFit.cover,
                    ),
                     SizedBox(
                       height: 20,
                     ),
                       Padding(
                         padding:  EdgeInsets.only(left: 80.0 , bottom: 25.0),
                         child: Text('Bienvenue ! ',
                          style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                                ),
                            ),
                       ),
                       SignInFormView(),
                ],
              ),
            ),
          ),
        ),
       ),
     );
  }
}