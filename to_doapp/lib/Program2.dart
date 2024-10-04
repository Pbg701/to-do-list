// ignore: file_names
import 'package:flutter/material.dart';

class Program2 extends StatefulWidget {
  const Program2({super.key});

  @override
  State createState() => _Program2State();
}

List cardColorList = [
  const Color.fromRGBO(250, 232, 232, 1),
  const Color.fromRGBO(232, 237, 250, 1),
  const Color.fromRGBO(250, 249, 232, 1),
  const Color.fromRGBO(250, 232, 250, 1),
  const Color.fromRGBO(250, 232, 232, 1),
];

class _Program2State extends State {
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
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: 720,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cardColorList[index],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(10, 10),
                      blurRadius: 10,
                    )
                  ]),
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
                              color: Colors.white),
                          child: const Icon(Icons.image)),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 350,
                            child: Text(
                              "Lorem Ipsum is simply setting industry.",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 80,
                            width: 350,
                            child: Text(
                              "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        child: Text(
                          "10 july 2023",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
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
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "title",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Discription",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Date",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "submit",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ))
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
