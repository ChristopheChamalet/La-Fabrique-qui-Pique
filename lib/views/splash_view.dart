import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'Profile/profile_view.dart';
import 'home/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    final bool? isLogggedin = Provider.of<AuthProvider>(context).isLoggedin;
     if (isLogggedin != null) {
     SchedulerBinding.instance.addPostFrameCallback((_) {
        if (isLogggedin == false) {
          Navigator.pushReplacementNamed(context, HomeVieuw.routename);
        } else if (isLogggedin == true) {
          Navigator.pushReplacementNamed(context, ProfileView.routeName);
        }
      });
    }
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  <Widget> [
             const Image(
            image: AssetImage('assets/images/Logo.jpeg'),
            fit: BoxFit.cover,
            ),
            Text(
              'Chargement....',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20.00,
              ),
              ),
          ],
        ),
      ),
    );
  }
}