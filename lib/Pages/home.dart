import 'package:flutter/material.dart';
import 'package:quiz_flow/Pages/difficulty.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_flow/Services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});
  
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }


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
                      offset: Offset(2.0, 2.0),
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
                child: const Text('Play',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () {
                  var router = MaterialPageRoute(
                  builder: (context) => const Difficulty());
                  Navigator.of(context).push(router);
                },
              )
            ),
            const SizedBox(height: 20),
            Container(                   
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: signOut,
                child: const Text('Logout',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
            ),
          ],
        )
      )
    );
  }
}