// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Program3 extends StatefulWidget {
  const Program3({super.key});

  @override
  State createState() => _Program3State();
}

class Task {
  String title;
  String description;
  String? date;

  Task({required this.title, required this.description, this.date});
}

List tasks = [];

// List cardColorList = [
//   const Color.fromRGBO(250, 232, 232, 1),
//   const Color.fromRGBO(232, 237, 250, 1),
//   const Color.fromRGBO(250, 249, 232, 1),
//   const Color.fromRGBO(250, 232, 250, 1),
//   const Color.fromRGBO(250, 232, 232, 1),
// ];

class _Program3State extends State<Program3> {
  final TextEditingController _title = TextEditingController();

  final TextEditingController _description = TextEditingController();
  final TextEditingController _date = TextEditingController();

  TextEditingController defaultdate = TextEditingController();
  TextEditingController defaulttitle = TextEditingController();
  TextEditingController defaultDiscription = TextEditingController();

  void edit(int index) {
    defaulttitle.text = tasks[index].title;
    defaultdate.text = tasks[index].date;
    defaultDiscription.text = tasks[index].description;
  }

  void editTask(title, descrip, date, index) {
    tasks[index].title = title;
    tasks[index].description = descrip;
    tasks[index].date = date;
    setState(() {});
  }

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
                //color: cardColorList[index % cardColorList.length],
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 33, 243, 163),
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
                        child: const Icon(Icons.image_outlined),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
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
                              height: 5,
                            ),
                            SizedBox(
                              height: 30,
                              width: 350,
                              child: Text(
                                tasks[index].description,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (tasks[index].date != null)
                        Text('Date: ${tasks[index].date}'),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          _editTask(index);
                          edit(index);
                          showModalBottomSheet(
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            controller: defaulttitle,
                                            decoration: const InputDecoration(
                                              hintText: "Edit Title",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            controller: defaultDiscription,
                                            decoration: const InputDecoration(
                                              hintText: "Edit Description",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                              controller: defaultdate,
                                              decoration: const InputDecoration(
                                                hintText: "Edit Date ",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                              ),
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2025),
                                                );

                                                // ignore: unused_local_variable
                                                String editedDate =
                                                    DateFormat.yMMMd()
                                                        .format(pickedDate!);

                                                setState(() {
                                                  defaultdate.text = editedDate;
                                                });
                                              }),
                                          ElevatedButton(
                                              onPressed: () {
                                                String title =
                                                    defaulttitle.text;
                                                String descrip =
                                                    defaultDiscription.text;
                                                String date = defaultdate.text;
                                                editTask(title, descrip, date,
                                                    index);
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Submit",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25,
                                                ),
                                              )),
                                        ]));
                              });
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
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _title,
                        decoration: const InputDecoration(
                          hintText: "Title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _description,
                        decoration: const InputDecoration(
                          hintText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _date,
                        decoration: const InputDecoration(
                          hintText: "Date ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          );
                          String formatdate =
                              DateFormat.yMMMd().format(pickedDate!);
                          setState(() {
                            _date.text = formatdate;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            String title = _title.text.trim();
                            String descri = _description.text.trim();
                            String date = _date.text.trim();

                            Task newTask = Task(
                                title: title, description: descri, date: date);
                            if (title.isNotEmpty &&
                                descri.isNotEmpty & date.isNotEmpty) {
                              tasks.add(newTask);
                            }

                            _date.clear();
                            _title.clear();
                            _description.clear();

                            Navigator.pop(context);

                            setState(() {});
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          )),
                    ],
                  ));
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editTask(int index) {
    // ignore: avoid_print
    print('Editing task at index $index');
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    // ignore: avoid_print
    print('Deleting task at index $index');
  }
}
