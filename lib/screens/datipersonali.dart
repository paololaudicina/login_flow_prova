import 'package:ex_3/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatiPersonali extends StatelessWidget {
   DatiPersonali({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COMPILAZIONE DATI PERSONALI')
      ),
      body: Form(
         key: _formKey,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'inserisci il tuo nome';
                  }else{
                    return null;
                  }
                },
                controller: nameController,
                decoration : const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                )

              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'inserisci il tuo cognome';
                  }else{
                    return null;
                  }
                },
                controller: surnameController,
                decoration : const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'cognome',
                )

              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'inserisci la tua mail';
                  }else{
                    return null;
                  }
                },
                
                controller: emailController,
                decoration : const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                )

              ),


              ElevatedButton(onPressed: () async{
                if (_formKey.currentState!.validate()) { 
                  const bool datiPersonali = true;
                  
                  final sp = await SharedPreferences.getInstance();
                  sp.setBool('DatiPersonali', datiPersonali);
                  

                  sp.setString('Name', nameController.text);
                  sp.setString('Surname', surnameController.text);
                  sp.setString('Email', emailController.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const home()));
                  
                  
                }else {
                  ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(const SnackBar(content: Text('Dati personali non completi')));
                }
              },
              child: const Text('SAVE')
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('do you want to complete later? '),
                  IconButton(onPressed: () async{
                     const bool datiPersonali = true;
                      final sp = await SharedPreferences.getInstance();
                      sp.setBool('DatiPersonali', datiPersonali);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const home()));


                  },
                   icon:const Icon(Icons.arrow_forward))
                ],
              )
            ]
          )
          
          ,),
      ),
    );
  }
}