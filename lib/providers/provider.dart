import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeProvider extends ChangeNotifier {

  int punteggio = 0;

  void getPreferences() async{

    final sp= await SharedPreferences.getInstance();

     punteggio = sp.getInt('punteggio') ?? 0;
     print(punteggio);
     notifyListeners();

  }

// questo chiama la funzione quando il provider nasce con il changeNotifyProvider. Nel caso specifico il provider nasce nella home.
  HomeProvider()  {
    getPreferences();
  }



}