
import 'dart:ui';

import 'package:ex_3/screens/datipersonali.dart';
import 'package:ex_3/services/Impact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
    return Scaffold(
            
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                       Color.fromARGB(255, 2, 71, 129),
                       Color.fromARGB(255, 172, 198, 243)
                    ])

                  ),
                  
                  child:  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(70),
                        child: CircleAvatar(backgroundImage: AssetImage('images/login-image.jpg'),
                        radius: 80),
                      ),
                    ],
                  )
                  ),

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 300,bottom: 50),
                  child: Container(
                    height: 450,
                    decoration:const BoxDecoration(
                  color: Colors.white,
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
                        padding:  EdgeInsets.all(40),
                        child: Text(

                          'Welcome User',
                          style: TextStyle(color: Colors.blue,
                          
                          fontSize: 30),
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
                                 controller: userController,
                                textAlign: TextAlign.start,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'username',
                                  prefixIcon: Icon(Icons.person)
                                  
                                ),
                                
                                ),
                             ),
                              Padding(
                               padding:  EdgeInsets.all(20.0),
                               child:  TextFormField(
                                validator: (String? value) {
                                  if ( value == null || value.isEmpty ){
                                    return 'inserisci una password';
                                                  
                                  }else {
                                    return null;
                                  }
                                },
                                 controller: passwordController,
                                textAlign: TextAlign.start,
                                obscureText: _passwordView,
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: _chenageViewPassword,
                                    icon: Icon(_passwordView ? Icons.visibility_off : Icons.visibility)
                                    
                                  ),
                                  prefixIcon: const Icon(Icons.key)
                                  
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
                                      
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const home()));
                                   }else {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>   DatiPersonali()));
                                   }
                                  }
                                  
                                } else {
                                   ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(const SnackBar(content: Text('Wrong username or password')));
                                }
                                   
                                }, 
                                
                                child:const Text('Login')
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