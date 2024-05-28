import 'package:ex_3/screens/home.dart';
import 'package:ex_3/screens/login.dart';
import 'package:ex_3/services/Impact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  void _refreshControl(BuildContext context) async{
    final sp = await SharedPreferences.getInstance();
    var refresh = sp.getString("refreshToken");

    if(refresh!= null){
      bool hasExpired = JwtDecoder.isExpired(refresh);
      if(hasExpired== true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      }else{
        final response = Impact().refreshToken();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      }
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context){
    Future.delayed(const Duration(seconds: 3), () => _refreshControl(context));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 50,
              child: Icon(Icons.nat),
            ),
            Container(
              child: Text('Splash'),
            )
          ]
        )

      )
    );
  }
}