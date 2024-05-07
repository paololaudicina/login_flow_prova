// this route manages the request on Impact Server

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Impact {
  static String baseUrl = 'https://impact.dei.unipd.it/bwthw/';
  static String pingEndpoint = 'gate/v1/ping/';
  static String tokenEndpoint = 'gate/v1/token/';
  static String refreshEndpoint = 'gate/v1/refresh/';

  Future<int> getAndStoreToken(String username, String password) async{
    final url= baseUrl + tokenEndpoint;
    final body= {'username': username,'password': password};

    final response = await http.post(Uri.parse(url),body: body) ;

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', decodedResponse['access']);
      sp.setString('refreshToken', decodedResponse['refresh']);
      
    }
    return response.statusCode;
  }

  Future<int> refreshToken () async{
    // quando faccio la chiamata post al server questo mi ritorna dei nuovi token se e solo se il refresh che ho inserito è ancora attivo?
     
    final url= baseUrl + refreshEndpoint;
    final sp = await SharedPreferences.getInstance();
    final refresh= sp.getString('refreshToken');
    if (refresh != null) {
      final body= {'refreshToken' : refresh};
      final response = await http.post(Uri.parse(url),body: body);
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final sp = await SharedPreferences.getInstance();
        await sp.setString('accessToken', decodedResponse['access']);
        await sp.setString('refreshToken', decodedResponse['refresh']);
      } //if

      //Just return the status code
      return response.statusCode;
    }
    return 401;

  }








}
