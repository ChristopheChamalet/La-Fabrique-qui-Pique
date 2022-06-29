import 'package:flutter/material.dart';
import 'package:lafabp/views/home/home_view.dart';
import 'package:provider/provider.dart';

import '../../../models/signup_form_model.dart';
import '../../../providers/auth_provider.dart';

class SignUpFormVieuw extends StatefulWidget {
  const SignUpFormVieuw({ Key? key }) : super(key: key);

  @override
  State<SignUpFormVieuw> createState() => _SignUpFormVieuwState();
}

class _SignUpFormVieuwState extends State<SignUpFormVieuw> {

final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SignUpForm signupForm;
  FormState? get form => key.currentState;
  late FocusNode _emailnode;
  late FocusNode _usernamenode;
  late FocusNode _passwordnode;
  bool hidePassword = true;
  

   @override
  void initState() {
   signupForm = SignUpForm(email: null, username: null, password: null);
    _emailnode = FocusNode();
    _usernamenode = FocusNode();
    _passwordnode = FocusNode();
    super.initState();
  }

  Future<void> submitForm() async {
    if(form!.validate()) {
      form!.save();
      final error = await Provider.of<AuthProvider>(context, listen: false)
          .signup(signupForm);
      if (error == null) {
        Navigator.pushNamed(context, HomeVieuw.routename);
      }
    }
  }

  @override
  void dispose() {
    _emailnode.dispose();
    _usernamenode.dispose();
    _passwordnode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
   // var scrWidth = MediaQuery.of(context).size.width;
   // var scrHeight = MediaQuery.of(context).size.height;
   return Form(
     key: key,
     child: Column(
       children:  [
         const SizedBox(
           height: 10,
         ),
         Container(
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
               focusNode: _emailnode,
               style:  TextStyle(
                 fontSize: 22,
                 color: Theme.of(context).primaryColor,
                 fontWeight: FontWeight.bold,
               ),
               decoration: const InputDecoration(
                 focusColor: Colors.amber,
                 iconColor: Colors.amber,
                 border: InputBorder.none,
                prefixIcon:  Icon(Icons.mail , size: 30, color: Colors.amber,),
                labelText: 'E-mail',
                labelStyle:  TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
               ),
               validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'remplissez une adresse e-mail valide';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    signupForm.email = newValue;
                  },
                   onFieldSubmitted: (_) =>  FocusScope.of(context).requestFocus(_usernamenode),
                   textInputAction: TextInputAction.next,
             ),
           ),
         const SizedBox(
           height: 15,
         ),
         Container(
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
             focusNode: _usernamenode,
                 style:  TextStyle(
                 fontSize: 22,
                 color: Theme.of(context).primaryColor,
                 fontWeight: FontWeight.bold,
               ),
             decoration: const InputDecoration(
                 focusColor: Colors.amber,
                 iconColor: Colors.amber,
                 border: InputBorder.none,
                prefixIcon:  Icon(Icons.person, size: 30, color: Colors.amber,),
                labelText: 'Username',
                labelStyle:  TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
               ),
             validator: (value) {
                   if(value == null || value.isEmpty) {
                      return 'remplissez un username valide';
                  } else {
                      return null;
                        }
                },
                onSaved: (newValue) {
                  signupForm.username = newValue;
                },
                 onFieldSubmitted: (_) =>  FocusScope.of(context).requestFocus(_passwordnode),
                  textInputAction: TextInputAction.next,
           ),
         ),
         const SizedBox(
           height: 15,
         ),
         Container(
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
             focusNode: _passwordnode,
             obscureText: hidePassword == true ? true : false,
               style:  TextStyle(
                 fontSize: 22,
                 color: Theme.of(context).primaryColor,
                 fontWeight: FontWeight.bold,
               ),
             decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: hidePassword == true
                          ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                          : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                  focusColor: Colors.amber,
                 iconColor: Colors.amber,
                 border: InputBorder.none,
                prefixIcon: const  Icon(Icons.lock , size: 30, color: Colors.amber,),
                labelText: 'Password',
                labelStyle: const  TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
             ),
             validator: (value) {
                   if(value == null || value.isEmpty) {
                      return 'remplissez un password valide';
                  } else {
                      return null;
                        }
                },
                onSaved: (newValue) {
                  signupForm.password = newValue;
                },
           ),
         ),
        const SizedBox(
           height: 30,
         ),
         const Text('--En Créeant votre compte, vous acceptez que nous enregistrons vos donnés dans notre base de données--',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'RobotoMno',
            fontWeight: FontWeight.w500,
          ),
         ),
           const SizedBox(height: 20,),  
              SizedBox(
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
               onPressed: submitForm,
               child:  const Text(
                'Créez un compte',
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20.00,
                 ),
              ),
            ),
          ), 
                  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text("Déjà un compte ?" , style: TextStyle(fontSize: 18),
            ),
            GestureDetector(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeVieuw.routename);
                },
                 child: const Text("Se Connecter",
                 style: TextStyle(
                   color: Colors.amber,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ),
                 ),
               ),
            ),
          ],
        ),
       ],
     ),
   );
  }
}