import 'package:flutter/material.dart';
import 'package:lafabp/views/auth/widgets/signup_form.dart';



class SignUpView extends StatefulWidget {
  static String routeName = '/signup';
  const SignUpView({ Key? key }) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {



  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.00),
          child:  Center(
            child: Container(
              color: Colors.white,
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:  CrossAxisAlignment.stretch,
                    children:  const [
                  SizedBox(height: 70,),
                  Image(
                    image: AssetImage('assets/images/FABP_Logo.jpg'),
                    fit: BoxFit.cover,
                    ),
                     SizedBox(
                       height: 20,
                     ),
                        Padding(
                         padding:  EdgeInsets.only(left: 40.0 ),
                         child: Text('Inscription',
                          style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 35,
                          color: Color(0xff0C2551),
                          fontWeight: FontWeight.bold,
                                ),
                            ),
                       ),      
                        SizedBox(
                         height: 30,
                       ),
                       SignUpFormVieuw(),
                    ],
                  ),
            ),
          ),
            ),
        
    );
  }
}