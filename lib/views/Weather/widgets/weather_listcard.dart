import 'package:flutter/material.dart';

class WeatherListCardView extends StatefulWidget {
  static String routename = '/card';
  const WeatherListCardView({ Key? key }) : super(key: key);

  @override
  State<WeatherListCardView> createState() => _WeatherListCardViewState();
}

class _WeatherListCardViewState extends State<WeatherListCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children:  [
          Card(
            elevation: 4,
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/SunWithCloud.png'),
              ),
              title: const Text('Paris'),
              subtitle: const Text('25 °'),
              trailing: IconButton(
                onPressed: () {},
                 icon: const Icon(Icons.delete, color: Colors.red,),
                 ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
           Card(
             elevation: 4,
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/SunWithCloud.png'),
              ),
              title: const Text('Paris'),
              subtitle: const Text('25 °'),
              trailing: IconButton(
                onPressed: () {},
                 icon: const Icon(Icons.delete, color: Colors.red,),
                 ),
            ),
          
          ),
        ],
      ),
    );
  }
}