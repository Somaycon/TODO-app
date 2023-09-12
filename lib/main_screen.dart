import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<String> tarefas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To Do List'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                TextFormField(
                  controller: textEditingController,
                ),
                Container(
                  height: 400,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          tarefas[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (textEditingController.text.length > 0) {
                  setState(() {
                    tarefas.add(textEditingController.text);
                  });

                  textEditingController.clear();
                }
                print(tarefas);
              },
              child: Icon(Icons.add),
            ),
            SizedBox(width: 5),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  tarefas = [];
                });

                textEditingController.clear();
                print(tarefas);
              },
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
