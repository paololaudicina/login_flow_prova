
import 'dart:ui';

import 'package:ex_3/screens/datipersonali.dart';
import 'package:ex_3/screens/questionario.dart';
import 'package:ex_3/services/Impact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
    const LoginPage({super.key});
   static const routename = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
 
}

class _LoginPageState extends State<LoginPage> {
   bool _passwordView = true;
   
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    void _chenageViewPassword() {
      setState(() {
        _passwordView = !_passwordView;
      });
    }
    
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
            
            child: Stack(
              children: 
                 [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 25, 22, 234),
                        Color.fromARGB(255, 124, 140, 232)
                      ])
                    
                                
                    ),
                    
                    child: Image.asset('images/welcome.jpeg', fit: BoxFit.cover)
                    ),
              
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100,bottom: 100),
                      child: Container(
                        height: 350,
                        decoration:const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)
                      )
                      ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [ const Padding(
                            padding:  EdgeInsets.all(20),
                            child: Text(
                                  
                              'Welcome User',
                              style: TextStyle(color: Colors.black,
                              
                              fontSize: 35),
                              textAlign:TextAlign.center
                            ),
                          ),
                            Form(
                              key: _formKey,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                  Padding(
                                   padding: const  EdgeInsets.all(20.0),
                                   child:  TextFormField(
                                    
                                    
                                     validator: (String? value) {
                                      if (value == null || value.isEmpty ){
                                        return 'inserisci un username';
                                                      
                                      }else {
                                        return null;
                                        }
                                                      
                                     },
                                     style: const TextStyle(color: Colors.black),
                                     controller: userController,
                                    textAlign: TextAlign.start,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('Username',style: TextStyle(color: Colors.black)),
                                      
                                      
                                      prefixIcon: Icon(Icons.person,color: Colors.black),
                                      
                                      
                                    ),
                                    
                                    ),
                                 ),
                                  Padding(
                                   padding:  const EdgeInsets.all(20.0),
                                   child:  TextFormField(
                                    validator: (String? value) {
                                      if ( value == null || value.isEmpty ){
                                        return 'inserisci una password';
                                                      
                                      }else {
                                        return null;
                                      }
                                    },
                                     controller: passwordController,
                                     style: const TextStyle(color: Colors.black),
                                    textAlign: TextAlign.start,
                                    obscureText: _passwordView,
                                    decoration:  InputDecoration(
                                      border: const OutlineInputBorder(),
                                      label: const Text('Password',style: TextStyle(color: Colors.black)),
                                      suffixIcon: IconButton(
                                        onPressed: _chenageViewPassword,
                                        icon: Icon(_passwordView ? Icons.visibility_off : Icons.visibility, color: Colors.black,)
                                        
                                      ),
                                      prefixIcon: const Icon(Icons.key,color: Colors.black,)
                                      
                                    ),
                                    ),
                                 ),
                              
                                Container(
                                  decoration:BoxDecoration(
                              
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  height: 50,
                                  width: 250,
                                  child: ElevatedButton(onPressed: () async{
                                    if (_formKey.currentState!.validate()){
                                      final response = await Impact().getAndStoreToken(userController.text, passwordController.text);
                                      if (response == 200){
                                        final sp = await SharedPreferences.getInstance();
                                        sp.setString('username', userController.text);
                                        sp.setString('password',passwordController.text);
                                        bool flag = true;
                                        await sp.setBool('flag', flag );
                                        if (sp.getBool('DatiPersonali') != null) {
                                          
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const Questionario()));
                                       }else {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  Questionario()));
                                       }
                                      }
                                      
                                    } else {
                                       ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(const SnackBar(content: Text('Wrong username or password')));
                                    }
                                       
                                    }, 
                                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 97, 41, 226))),
                                    
                                    child:const Text('Login', style: TextStyle(color: Colors.white))
                                    ),
                                )
                                ],
                                
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                ]
              
              ),
            );
             
  }
}



// [ListView(
              //   children: const [
              //     ListTile(
              //       title: Text('email'),
              //     ),
                
              //     ListTile(
              //       title: Text('password'),
              //     )
              //   ],
              // ),