import 'package:flutter/material.dart';
import 'package:quiz_flow/Pages/category_page.dart';


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
                  shadows: [
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 10,
                      color: Colors.white,
                    ),
                  ],
                  fontSize: 50,
                  color: Colors.blueGrey
                )
              ),             
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Easy'),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => const CategoryPage(difficulty: 'easy'));
                  Navigator.of(context).push(router);
                },
              )
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Medium'),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => const CategoryPage(difficulty: 'medium'));
                  Navigator.of(context).push(router);
                },
              )
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Hard'),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => const CategoryPage(difficulty: 'hard'));
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