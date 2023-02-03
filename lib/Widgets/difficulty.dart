import 'package:flutter/material.dart';
import 'package:quiz_flow/Widgets/category_page.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 29),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  scale: 0.5,
              )
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text('QuizFlow',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white
                )
              ),             
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                child: const Text('Easy'),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => const CategoryPage(difficulty: 'easy'));
                  Navigator.of(context).push(router);
                },
              )
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                child: const Text('Medium'),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => const CategoryPage(difficulty: 'medium'));
                  Navigator.of(context).push(router);
                },
              )
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                child: const Text('Difficult'),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => const CategoryPage(difficulty: 'difficult'));
                  Navigator.of(context).push(router);
                },
              )
            )
          ],
        )
      )
    );
  }
}