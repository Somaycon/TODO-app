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
          backgroundColor: Colors.purple,
          title: Text(
            'To Do List',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Container(
                      width: 10,
                      height: 10,
                      child: MaterialButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          if (textEditingController.text.length > 0) {
                            setState(() {
                              tarefas.add(textEditingController.text);
                            });
                            textEditingController.clear();
                          }
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  controller: textEditingController,
                ),
                Container(
                  height: 400,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                tarefas[index],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Container(
                                width: 50,
                                height: 40,
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    setState(() {
                                      tarefas.removeAt(index);
                                    });
                                  },
                                  color: Colors.red,
                                  child: Icon(Icons.delete_forever,
                                      color: Colors.white, size: 30),
                                ),
                              ),
                            )
                          ],
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
          children: [],
        ));
  }
}
