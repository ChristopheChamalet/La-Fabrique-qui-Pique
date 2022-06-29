import 'package:flutter/material.dart';
import 'package:lafabp/views/BookRucher/bookrucher_view.dart';
import 'package:lafabp/views/Extraction/extractionmiell_view.dart';
import 'package:lafabp/views/Weather/weather_view.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import '../views/AppHome/app_home_view.dart';
import '../views/Profile/profile_view.dart';
import '../views/home/home_view.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

       final User? user = Provider.of<UserProvider>(context).user;
    return SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
            child: ListView(
              reverse: false,
              children: <Widget> [
                 DrawerHeader(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[
                       const  Image(
                          image: AssetImage('assets/images/FABP_Logo.jpg'),
                          fit: BoxFit.cover,
                          ),
                        Text(
                      "Bonjour" " " +  user!.username,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                      ),
                      ),
                          Text(
                      "Votre Email :" " " +  user.email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                      ),
                      ),
                      ],
                      ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home , color: Colors.amber,),
                  title:  const Text('Accueil' , style: TextStyle( color: Colors.amber),),
                  onTap: () {
                    Navigator.pushNamed(context, AppHomeView.routename);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.cloud , color: Colors.amber,),
                  title:  const Text('Météo', style: TextStyle( color: Colors.amber , fontWeight:  FontWeight.bold),),
                  onTap: () {
                    Navigator.pushNamed(context, WeatherVieuw.routename);
                  },
                ),
                  ListTile(
                  leading: const Icon(Icons.book , color: Colors.amber,),
                  title:  const Text('Cahier de Rucher',style: TextStyle( color: Colors.amber, fontWeight:  FontWeight.bold), ),
                  onTap: () {
                    Navigator.pushNamed(context, BookRucherView.routename);
                     },
                ),
                  ListTile(
                  leading: const Icon(Icons.calendar_month , color: Colors.amber,),
                  title:  const Text('Extraction Mielerie' , style: TextStyle( color: Colors.amber , fontWeight:  FontWeight.bold),),
                  onTap: () {
                    Navigator.pushNamed(context, ExtractionMielView.routename);
                  },
                ),
                   ListTile(
                  leading: const Icon(Icons.verified_user , color: Colors.amber,),
                  title:  const Text('Mon Compte',style: TextStyle( color: Colors.amber , fontWeight:  FontWeight.bold),),
                  onTap: () {
                    Navigator.pushNamed(context, ProfileView.routeName);
                  },
                ),
                 ListTile(
                      title:  const Text(
                        'Deconnexion', style: TextStyle( color: Colors.amber , fontWeight:  FontWeight.bold),
                      ),
                      leading: const Icon(Icons.logout , color: Colors.amber,),
                      onTap: () {
                        Provider.of<AuthProvider>(context, listen: false).signout();
                        Navigator.pushNamed(context, HomeVieuw.routename);
                      },
                ),
              ],
            ),
          ),
      );
  }
}