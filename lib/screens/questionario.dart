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
  int punteggio = 0;

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
          decoration: BoxDecoration(
            color: isSelected
                ? Color.fromARGB(255, 31, 148, 244)
                : Color.fromARGB(255, 41, 107, 249),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.all(10),
          child: ListTile(
            // tileColor: isSelected ? Color.fromARGB(255, 31, 148, 244) : Color.fromARGB(255, 79, 41, 249),
            title: Text(
              _quiz.quiz[quizIndex].options.answer[index],
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => _changeColor(quizIndex, index),
          ),
        );
      },
      itemCount: _quiz.quiz[quizIndex].options.answer.length,
    );
  }
// Color.fromARGB(255, 43, 100, 244)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 53, 168, 245),
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('AUDIT TEST',
                    style: TextStyle(fontSize: 40, color: Colors.black)),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 53, 168, 245),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Color.fromARGB(255, 99, 56, 253),
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Imposta il raggio degli angoli del bordo
                      side: BorderSide(
                          color: Colors.black,
                          width:
                              2.0), // Imposta il colore e lo spessore del bordo
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:50,left: 20,right: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _quiz.quiz[0].title,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: SizedBox(
                                height: 450, // Imposta un'altezza per il ListView
                                child: _listView(0),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Color.fromARGB(255, 41, 65, 249),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Imposta il raggio degli angoli del bordo
                      side: BorderSide(
                          color: Colors.black,
                          width:
                              2.0), // Imposta il colore e lo spessore del bordo
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:50,left: 20,right: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_quiz.quiz[1].title,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: SizedBox(
                                height: 450, // Imposta un'altezza per il ListView
                                child: _listView(1),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Color.fromARGB(255, 37, 6, 142),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Imposta il raggio degli angoli del bordo
                      side: BorderSide(
                          color: Colors.black,
                          width:
                              2.0), // Imposta il colore e lo spessore del bordo
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top:50,left: 20,right: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_quiz.quiz[2].title,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: SizedBox(
                                height: 450, // Imposta un'altezza per il ListView
                                child: _listView(2),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final sp = await SharedPreferences.getInstance();
                      await sp.setInt('punteggio', punteggio);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => SplashQuiz()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(color: Colors.black))),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          )),
    );
  }
}
