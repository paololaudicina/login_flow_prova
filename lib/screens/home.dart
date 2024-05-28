import 'package:ex_3/providers/provider.dart';
import 'package:ex_3/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //  void livello () async {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( create:(context) => HomeProvider(),
    
      child: Scaffold(
        appBar: AppBar(
            title: Consumer<HomeProvider>(
              builder: (context, provider, child) {
                if (provider.punteggio < 2) {
                  return Text('ciao sono soft');
                } else {
                  return Text('ciao sono hard');
                }
              },
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        final sp = await SharedPreferences.getInstance();
                        await sp.remove('accessToken');
                        await sp.remove('refreshToken');
                        await sp.remove('DatiPersonali');
                        await sp.remove('punteggio');
      
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                const LoginPage())); // perchè il pushReplacemente e non il pop?
                      },
                      icon: const Icon(Icons.logout)),
                  const Text('LOG-OUT')
                ],
              )
            ]),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Text('HomePage')],
          ),
        ),
      ),
    );
  }
}
