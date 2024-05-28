import 'package:ex_3/providers/provider.dart';
import 'package:ex_3/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashQuiz extends StatelessWidget {
  const SplashQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => home())),
    );
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => Scaffold(
        body: Center(
            child: Consumer<HomeProvider>(builder: (context, provider, child) {
          if (provider.punteggio < 4) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    child: Icon(Icons.nat),
                  ),
                  Container(
                    child: Text('Il tuo livello consigliato è Soft'),
                  ),
                ]
                );
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    child: Icon(Icons.nat),
                  ),
                  Container(
                    child: Text('Il tuo livello consigliato è Hard'),
                  ),
                ]
                );

          }
        })),
      ),
    );
  }
}
