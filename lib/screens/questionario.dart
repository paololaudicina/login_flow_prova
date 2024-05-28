import 'package:ex_3/screens/home.dart';
import 'package:ex_3/screens/splashQuiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Questions.dart';
import 'Quiz.dart';
import 'Options.dart';

class Questionario extends StatefulWidget {
  const Questionario({super.key});

  @override
  State<Questionario> createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  final _quiz = Quiz();
  Map<int, int?> _selectedIndexMap = {};
  int punteggio =0;

  void _changeColor(int quizIndex, int optionIndex) {
    setState(() {
      _selectedIndexMap[quizIndex] = optionIndex;
      punteggio += _quiz.quiz[quizIndex].options.score[optionIndex];
    });
  }

  Widget _listView(int quizIndex) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        bool isSelected = _selectedIndexMap[quizIndex] == index;
        return Container(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            tileColor: isSelected ? Colors.green : Colors.blue,
            title: Text(_quiz.quiz[quizIndex].options.answer[index]),
            onTap: () => _changeColor(quizIndex, index),
          ),
        );
      },
      itemCount: _quiz.quiz[quizIndex].options.answer.length,
    );
  }
  
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:100),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [ Text(_quiz.quiz[0].title),
                      SizedBox(
                        height: 400, // Imposta un'altezza per il ListView
                        child: _listView(0),
                      ),
                    ]
                  ),
                ),
              ),
               Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [ Text(_quiz.quiz[1].title),
                      SizedBox(
                        height: 400, // Imposta un'altezza per il ListView
                        child: _listView(1),
                      ),
                    ]
                  ),
                ),
              ),
               Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [ Text(_quiz.quiz[2].title),
                      SizedBox(
                        height: 400, // Imposta un'altezza per il ListView
                        child: _listView(2),
                      ),
                    ]
                  ),
                ),
              ),
              
              ElevatedButton(onPressed: () async{
               final sp = await SharedPreferences.getInstance();
               await sp.setInt('punteggio',punteggio);
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SplashQuiz()));

              }, 
              child: Text('Save'))
            ],
          ),
        ),
      )

    );
  }
}