import 'package:flutter/material.dart';

// ignore: camel_case_types
class Program1 extends StatefulWidget {
  const Program1({super.key});

  @override
  State createState() => _Program1State();
}

// ignore: camel_case_types
class _Program1State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do list app"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: 720,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 230, 171, 171),
              ),
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: const Icon(Icons.image),
                    ),
                    Row(
                      children: [],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 350,
                          child: Text(
                            "Lorem Ipsum is simply setting industry.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: Text(
                              "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                        ),
                      ],
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                      const SizedBox(width: 8),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
