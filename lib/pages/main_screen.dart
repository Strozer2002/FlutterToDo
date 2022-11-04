import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Главная страница'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 120)),
              Text(
                "Главная страница",
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/todo');
                  },
                  child: Text("Перейти в список дел"))
            ],
          ),
        ));
  }
}
