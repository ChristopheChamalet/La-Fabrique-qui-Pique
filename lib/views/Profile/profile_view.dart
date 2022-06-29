import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../nav/nav_drawer.dart';
import '../../providers/user_provider.dart';


class ProfileView extends StatelessWidget {
  
  const ProfileView({Key? key}) : super(key: key);

  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Compte'),
      ),
     drawer: const DrawerView(),
      body: Container(
        alignment: Alignment.center,
        child: user != null
            ? Text(
                user.username,
                
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}