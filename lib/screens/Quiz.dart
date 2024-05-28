import 'Questions.dart';
import 'Options.dart';

class Quiz{
  //This class acts as data repository for the questions, their answers and the relative answers' scores.

  final List<Question> quiz = [
    //question number 1
    Question(
      title: 'How often do you drink alcohol?', 
      options: Options(
                answer: [
                  'Never','Less than once per month','2-4 times per month','2-3 times per week','4 or more times per week'
                ]
         ,      score: [0,1,2,3,4]),
         ),
    //question number 2
    Question(
      title: 'How munch alcohol do you drink on average per day?', 
      options: Options(
                answer: [
                  '1 or 2 drinks','3 or 4 drinks','5 or 6 drinks','7 or 8 drinks','10 or more drinks'
                ]
         ,      score: [0,1,2,3,4]),
         ),
    //question number 3
    Question(
      title: 'How often do you drink more than six drinks at once time?', 
      options: Options(
                answer: [
                  'Never','Less than once per month','Once time per month','Once time per week','Every day'
                ]
         ,      score: [0,1,2,3,4]),
         ),
    //question number 4
    Question(
      title: 'In the past year,how often have you found that you were unable to stop drinking once you had started?', 
      options: Options(
                answer: [
                  'Never','Less than once per month','Once time per month','Once time per week','Every day'
                ]
         ,      score: [0,1,2,3,4]),
         ),
    //question number 5
    Question(
      title: 'In the past year,how often have you been unable to do what was normally expected of you because of drinking?', 
      options: Options(
                answer: [
                  'Never','Less than once per month','Once time per month','Once time per week','Every day'
                ]
         ,      score: [0,1,2,3,4]),
         ),
    //questions number 6
     Question(
      title: 'In the past year,how often have you needed a drink first thing in the morning to get yourself going after a heavy drinking session?', 
      options: Options(
                answer: [
                  'Never','Less than once per month','Once time per month','Once time per week','Every day'
                ]
         ,      score: [0,1,2,3,4]),
         ), 
    // question number 7
    Question(
      title: 'In the past year,how often have you felt guilt or remorse after drinking?', 
      options: Options(
                answer: [
                  'Never','Less than once per month','Once time per month','Once time per week','Every day'
                ]
         ,      score: [0,1,2,3,4]),
         ),
    // question number 8
    Question(
      title: 'In the past year,how often have you been unable to remember what happend the night before because you had been drinking?', 
      options: Options(
                answer: [
                  'Never','Less than once per month','Once time per month','Once time per week','Every day'
                ]
         ,      score: [0,1,2,3,4]),
         ), 
    // question number 9
    Question(
      title: 'Have you ever hurt yourself or someone else as result of drinking?', 
      options: Options(
                answer: [
                  'No','Yes,but not in the past year','Yes,in the past year'
                ]
         ,      score: [0,1,2]),
         ),
    //Question number 10
    Question(
      title: 'Does someone suggest or help you to give up?', 
      options: Options(
                answer: [
                  'No','Yes, but not in the past year','Yes,in the past year'
                ]
         ,      score: [0,1,2]),
         ),
  ];
}