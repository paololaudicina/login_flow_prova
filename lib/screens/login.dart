
import 'package:ex_3/screens/datipersonali.dart';
import 'package:ex_3/services/Impact.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
            appBar: AppBar(
              title:const Text('loginPage')
            ), 
            body: Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.red,),

              Expanded(
                child: Container(
                  height: 800,
                  decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                )),
                  
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                          Padding(
                           padding: const  EdgeInsets.all(15.0),
                           child:  TextFormField(
                             validator: (String? value) {
                              if (value == null || value.isEmpty ){
                                return 'inserisci un username';
                    
                              }else {
                                return null;
                                }
                    
                             },
                             controller: userController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'username',
                              
                            ),
                            
                            ),
                         ),
                          Padding(
                           padding:const  EdgeInsets.all(15.0),
                           child:  TextFormField(
                            validator: (String? value) {
                              if ( value == null || value.isEmpty ){
                                return 'inserisci una password';
                    
                              }else {
                                return null;
                              }
                            },
                             controller: passwordController,
                            textAlign: TextAlign.center,
                            obscureText: false,
                            decoration:const  InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              
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