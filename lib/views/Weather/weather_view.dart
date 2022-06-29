import 'package:flutter/material.dart';
import 'package:lafabp/models/weather_model.dart';
import 'package:lafabp/nav/nav_drawer.dart';
import 'package:lafabp/services/weather_service.dart';

class WeatherVieuw extends StatefulWidget {
  static String routename = '/weather';
  const WeatherVieuw({ Key? key }) : super(key: key);

  @override
  State<WeatherVieuw> createState() => _WeatherVieuwState();
}

class _WeatherVieuwState extends State<WeatherVieuw> {
  final _cityTextController = TextEditingController();
  final _dataService = WeatherDataSerivce();
    WeatherResponse? _response;

    void _search() async {
      final response = await _dataService.getWeather(_cityTextController.text);
            setState(() => _response = response);
    }
    
    @override
    void initState() {
      super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerView(),
      body:Column(
        children:  <Widget> [
          Expanded(
            flex: 1,
            child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Sky.jpg"),
                fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: <Widget> [
                  AppBar(
                    title:  const Text("Météo"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Container(
                    padding: const EdgeInsets.only( top: 100, left: 20 , right: 20),
                    child: TextField(
                      controller: _cityTextController,
                      decoration:  InputDecoration(
                        hintText: "City",
                        suffixIcon: const Icon(Icons.search , color: Colors.white,),
                        hintStyle:const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                         ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                         ),
                        ),
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
     const SizedBox(height: 10,),  
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton( 
                  style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),     
                 onPressed: _search,
                 child:  const Text(
                  'Search',
                   style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                   fontSize: 20.00,
                   ),
                ),
                          ),
                        ),
              ), 
          Expanded(
              flex: 2,
            child: Align(
              child: SizedBox(
            height: 10,
            width: 10,
            child: OverflowBox(
              minWidth: 0.0,
              maxWidth: MediaQuery.of(context).size.width,
              minHeight: 0.0,
              maxHeight: MediaQuery.of(context).size.height / 4,
              child: Stack(
                children: <Widget> [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: double.infinity,
                    child: Builder(
                      builder: (BuildContext context) { 
                        if(_response != null) {
                          return SingleChildScrollView(
                            child: Card(
                               color: Colors.white,
                               elevation: 5,
                               shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                              ),
                            child: Column(
                            children: <Widget> [
                              Image.network(_response!.iconUrl),
                               Text('${_response!.tempInfo.temperature}°', style: const TextStyle(fontSize: 40.00),),
                               Text(_response!.weatherInfo.description),
                               Text(_response!.countryInfo.country),
                            ],
                                ),
                              ),
                          );
                        }
                        else {
                          return  const Center(child:  Text("Aucune Météo affichée"));
                        }
                       },                  
                    ),
                  ),
               ],
              ),
            ),
            ),
            ),
          ),
         ],
        ),
    );
 }
}
