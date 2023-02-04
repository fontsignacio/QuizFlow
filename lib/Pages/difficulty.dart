import 'package:flutter/material.dart';
import 'package:quiz_flow/Pages/quiz.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 29),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  )
                ),
              ],
            ),
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
                      offset: Offset(2.5, 2.5),
                      blurRadius: 20,
                      color: Colors.white,
                    ),
                  ],
                  fontSize: 50,
                  color: Colors.white70
                )
              ),             
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Easy',
                  style: TextStyle(
                    fontSize: 20  
                  ),
                ),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => QuizScreen(difficulty: 'easy', category: category));
                  Navigator.of(context).push(router);
                },
              )
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Medium',
                  style: TextStyle(
                    fontSize: 20  
                  ),
                ),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => QuizScreen(difficulty: 'medium', category: category));
                  Navigator.of(context).push(router);
                },
              )
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Hard',
                  style: TextStyle(
                    fontSize: 20  
                  ),
                ),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => QuizScreen(difficulty: 'hard', category: category));
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