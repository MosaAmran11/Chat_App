import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat App', style: TextStyle(color: Theme.of(context).primaryColorLight),),
          leading: Icon(Icons.chat_rounded, color: Theme.of(context).primaryColorLight,),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: ListView(
          children: List.generate(20, (index){
            return Card(
              child: ListTile(
                leading: Container(
                  width: 100,
                  height: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColorLight),
                    child: const Icon(Icons.person_rounded)),
                title: Text("Person ${index + 1}"),
                subtitle: const Text("Some messages appears here"),
                trailing: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor,),
                  ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

