// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Program4 extends StatefulWidget {
  const Program4({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Program4State createState() => _Program4State();
}

class Task {
  final String title;
  final String description;
  final DateTime date; // Changed to final DateTime

  Task(
      {required this.title,
      required this.description,
      required this.date}); // Made date required
}

List<Task> tasks = [];

List cardColorList = [
  const Color.fromRGBO(250, 232, 232, 1),
  const Color.fromRGBO(232, 237, 250, 1),
  const Color.fromRGBO(250, 249, 232, 1),
  const Color.fromRGBO(250, 232, 250, 1),
  const Color.fromRGBO(250, 232, 232, 1),
];

class _Program4State extends State<Program4> {
  String _title = '';
  String _description = '';
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-do list",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: 720,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cardColorList[index % cardColorList.length],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(10, 10),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.image),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 350,
                              child: Text(
                                tasks[index].title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 80,
                              width: 350,
                              child: Text(
                                tasks[index].description,
                              ),
                            ),
                            Text(
                                'Date: ${tasks[index].date}'), // Date is now final
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          _editTask(index);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteTask(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    child: Text(
                      "create task",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _title = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Task newTask = Task(
                          title: _title,
                          description: _description,
                          date: _date);
                      tasks.add(newTask);

                      setState(() {
                        _title = '';
                        _description = '';
                        _date = DateTime.now();
                      });

                      print('Title: $_title');

                      print('Description: $_description');
                      print('Date: $_date');

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Entered Details'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title: $_title'),
                                Text('Description: $_description'),
                                Text('Date: $_date'),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editTask(int index) {
    print('Editing task at index $index');
  }

  // ignore: duplicate_ignore
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    print('Deleting task at index $index');
  }
}
