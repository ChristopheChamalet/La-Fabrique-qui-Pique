import 'package:flutter/material.dart';
import 'package:lafabp/views/BookRucher/bookrucher_view.dart';
import 'package:lafabp/views/BookRucher/widgets/bookcard.dart';
import 'package:lafabp/views/BookRucher/widgets/bookist.dart';
import 'package:lafabp/views/Extraction/extractionmiell_view.dart';
import 'package:lafabp/views/Weather/weather_view.dart';
import 'package:lafabp/views/Weather/widgets/weather_listcard.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/user_provider.dart';
import 'views/404/not_found.dart';
import 'views/AppHome/app_home_view.dart';
import 'views/Profile/profile_view.dart';
import 'views/auth/signup_view.dart';
import 'views/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LaFabpView());
}

class LaFabpView extends StatefulWidget {
  const LaFabpView({Key? key}) : super(key: key);

  @override
  State<LaFabpView> createState() => _LaFabpViewState();
}

class _LaFabpViewState extends State<LaFabpView> {
  final AuthProvider authProvider = AuthProvider();
  
@override
void initState() {
  authProvider.initAuth();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
     providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
            create: (_) => UserProvider(),
            update: (_, authProvider, oldUserProvider) {
              oldUserProvider!.update(authProvider);
              return oldUserProvider;
            }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'La Fabrique Qui Pique',
        theme: ThemeData(
          primaryColor: Colors.amber, 
          fontFamily: 'RobotoMono',
        ),
        home: const HomeVieuw(),
        onGenerateRoute: (settings){
          if(settings.name == HomeVieuw.routename) {
            return MaterialPageRoute(builder: (_) => const HomeVieuw());
          } else if(settings.name == SignUpView.routeName){
            return MaterialPageRoute(builder: (_) => const SignUpView());
          } else if(settings.name == AppHomeView.routename) {
            return MaterialPageRoute(builder: (_) => const AppHomeView());
          } else if(settings.name == WeatherVieuw.routename) {
            return MaterialPageRoute(builder: (_) => const WeatherVieuw());
          }else if(settings.name == ProfileView.routeName) {
            return MaterialPageRoute(builder: (_) => const ProfileView());
          } else if(settings.name == BookRucherView.routename){
            return MaterialPageRoute(builder: (_) => const BookRucherView());
          } else if(settings.name == ExtractionMielView.routename) {
            return MaterialPageRoute(builder: (_) => const ExtractionMielView());
          } else if(settings.name == WeatherListCardView.routename)  {
            return MaterialPageRoute(builder: (_) => const WeatherListCardView());
          }else if(settings.name == BookList.routeName)  {
            return MaterialPageRoute(builder: (_) => const BookList()); }  
            else {
            return null;
          }
        },
        
         onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => const NotFound()),
      ),
    );
}
}