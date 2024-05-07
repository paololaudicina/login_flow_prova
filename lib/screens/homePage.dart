import 'package:ex_3/screens/home.dart';
import 'package:flutter/material.dart';

import 'TodosDetails.dart';

import 'ProfilePage.dart';

class Todo {
    final String title;
    final String description;

   const Todo(this.title, this.description);
}

List<Todo> todos=List.generate(20, (index) => Todo('Todo $index', 'Questo è il todo numero : $index'));



class HomePage extends StatefulWidget {
  const HomePage({super.key});


  static const routename = 'Homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var sel_index = 0;
 
List<BottomNavigationBarItem> navBarItems = [ 
  const BottomNavigationBarItem(icon: Icon(Icons.home),
  label : 'Home'), 
  const BottomNavigationBarItem(icon: Icon(Icons.account_box),
  label : 'Profilo'),
  const BottomNavigationBarItem(icon: Icon(Icons.chat),
  label : 'Calendar') 
];



void _OnTap(int index) {
  setState(() {
    sel_index = index;
  });
}

Widget _selectPage({
    required int index,
  }) {
    switch (index) {
      case 0:
        return const home();
      case 1:
        return const Profile();
      default:
        return const home();
    }
  }



  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'), 
      ),
      drawer: ListView.builder(itemCount: todos.length,itemBuilder: (context,index) => ListTile(
        title: Text(todos[index].title),
        onTap:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TodosDetails(todo: todos[index]) )
        );
        }
      )
      ),
      body:_selectPage(index: sel_index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 162, 192, 217),
        items: navBarItems,
        currentIndex: sel_index,
        onTap: _OnTap,
        )
      );
  }
}

