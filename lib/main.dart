import 'package:ex_3/providers/provider.dart';
import 'package:ex_3/screens/home.dart';
import 'package:ex_3/screens/login.dart';
import 'package:ex_3/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
   runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home:  Splash()
      );
  }
}

// FutureBuilder(
//       future: SharedPreferences.getInstance() ,
//        builder: (context, snapshot) {
//         if (snapshot.hasData) {
          
//           final sp=snapshot.data!;

//           if (sp.getBool('flag') != null ){
//             return  const home();
//           } else {
//             return  const LoginPage();
//           }
//         } else {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//        })