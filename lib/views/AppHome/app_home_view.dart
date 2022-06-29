import 'package:flutter/material.dart';
import 'package:lafabp/views/Extraction/extractionmiell_view.dart';
import 'package:lafabp/views/Profile/profile_view.dart';
import 'package:lafabp/views/Weather/weather_view.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../nav/nav_drawer.dart';
import '../../providers/user_provider.dart';
import '../BookRucher/bookrucher_view.dart';

class AppHomeView extends StatelessWidget {
  static String routename = '/apphome';
  const AppHomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final User? user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title:   Text(
                    'Bienvenue ' + user!.username,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const DrawerView(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 32),
                    Center(
                      child: Image.asset(
                        'assets/images/Logo.jpeg',
                        width: 170,
                        height: 170,
                        scale: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'La Fabrique Qui Pique',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'Outils',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Services(
                          icon: 'assets/images/SunWithCloud.png',
                          title: 'Météo',
                          onTap: () {
                            Navigator.pushNamed(context, WeatherVieuw.routename);
                          }
                        ),
                        Services(
                          onTap: () {
                            Navigator.pushNamed(context, BookRucherView.routename);
                          },
                          icon: 'assets/images/Notes.png',
                          title: 'Notes',
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Services(
                          icon: 'assets/images/Calendar.png',
                          title: 'Extraction',
                          onTap: () {
                            Navigator.pushNamed(context, ExtractionMielView.routename);
                          }
                        ),
                        Services(
                          icon: 'assets/images/acc.png',
                          title: 'Mon Compte',
                          onTap: () {
                            Navigator.pushNamed(context, ProfileView.routeName);
                          }
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  // ignore: non_constant_identifier_names
  Widget Services({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1,),
        width: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image.asset(icon),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            )
          ],
        ),
      ),
    );
  }