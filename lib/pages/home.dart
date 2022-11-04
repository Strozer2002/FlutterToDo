import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _userToDo;
  List todoList = [];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    todoList.addAll(['Купить молоко', 'Помыть собаку', 'Покушать']);
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Меню")),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text('На главную')),
            ],
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: _menuOpen,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                  title: Text(todoList[index]),
                ),
              ),
              onDismissed: ((direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить элемент'),
                content: TextField(
                  onChanged: (String value) {
                    _userToDo = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todoList.add(_userToDo);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Добавить"))
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
