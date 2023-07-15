import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  String input = "";
  List todo = [];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("Simple Notes App",
              style: TextStyle(
              color: Colors.black,
                fontSize: 25,
                fontStyle: FontStyle.italic,
          ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                return AlertDialog(
                  title: const Text("Add a new note"),
                  content: TextField(
                    decoration: const InputDecoration(
                      hintText: "ToDo task"
                    ),
                    onChanged: (String value) => input = value,
                  ),
                  actions: [
                    TextButton(
                        onPressed:(){
                          setState(() {
                            todo.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add")
                    ),
                  ],
                );
              });
            }
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: todo.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                    key: Key(todo[index]),
                    child: Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text(todo[index],
                          style:const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_forever_rounded, color: Colors.red),
                          onPressed: (){
                            setState(() {
                              todo.removeAt(index);
                            });
                          },
                        ),
                      ),
                    )
                );
              }
          ),
        ),
      ),
  );
}
