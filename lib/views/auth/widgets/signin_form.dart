import 'package:flutter/material.dart';
import 'package:lafabp/views/auth/signup_view.dart';
import 'package:provider/provider.dart';
import '../../../models/signin_form_model.dart';
import '../../../models/user_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/user_provider.dart';
import '../../AppHome/app_home_view.dart';

class SignInFormView extends StatefulWidget {
  const SignInFormView({ Key? key }) : super(key: key);

  @override
  State<SignInFormView> createState() => _SignInFormViewState();
}

class _SignInFormViewState extends State<SignInFormView> {
   final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SigninForm signinForm;
  FormState get form => key.currentState!;
  bool hidePassword = true;
  String? error;
  late FocusNode _emailnode;
  late FocusNode _passwordnode;

  @override
  void initState() {
    signinForm = SigninForm(email: null, password: null);
    _emailnode = FocusNode();
    _passwordnode = FocusNode();
    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .signin(signinForm);
      if (response is User) {
        Provider.of<UserProvider>(context, listen: false).updateUser(response);
        Navigator.pushNamed(context, AppHomeView.routename);
      } else {
        setState(() {
          error = response['error'];
        });
      }
    }
  }

  @override
  void dispose() {
    _emailnode.dispose();
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
                    signinForm.email = newValue;
                  },
                   onFieldSubmitted: (_) =>  FocusScope.of(context).requestFocus(_passwordnode),
                    textInputAction: TextInputAction.next,
             ),
           ),
         const SizedBox(
           height: 20,
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
                    focusColor: Colors.amber,
                 iconColor: Colors.amber,
                 border: InputBorder.none,
                 prefixIcon: const Icon(Icons.lock , size: 30, color: Colors.amber,),
                labelText: 'Password',
                labelStyle: const  TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
               ),
               validator: (value) {
                     if(value == null || value.isEmpty) {
                        return 'remplissez un password valide';
                    } else {
                        return null;
                          }
                  },
                  onSaved: (newValue) {
                    signinForm.password = newValue;
                  },
             ),
           ),
       Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           TextButton(onPressed: () {},
            child: const Text('Mot de passe oublié ?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
               ),
            ),
         ],
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
                'Se Connecter',
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20.00,
                 ),
              ),
            ),
          ), 
        const  SizedBox( height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text("Pas de compte ?" , style: TextStyle(fontSize: 18),
            ),
            GestureDetector(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
                 child: const Text("S'inscrire",
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