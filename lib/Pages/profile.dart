import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_flow/Services/auth.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 29),
      body: Padding(
        padding:const  EdgeInsets.all(10),
        child: ListView(
          children: [
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
                IconButton(
                  onPressed: signOut,
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  )
                ),

              ],
            ),
            CircleAvatar(
              radius: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7), 
                child: const Icon(Icons.person, size: 130),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(user?.email ?? '', 
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )
              ),
            ),
            ClipRRect(
              child: Card(
                color: const Color.fromARGB(255, 52, 51, 51),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  child: const Text("Stadistics",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                )
              ),
            ),
            const Divider(height: 20, color: Colors.white,),
            Container(
              padding: const EdgeInsets.only(left: 30),
              alignment: Alignment.topLeft,
              child: const Text("Points: ", 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )
              ),
            ),
            const Divider(height: 25, color: Colors.white54,),
            Container(
              padding: const EdgeInsets.only(left: 30),
              alignment: Alignment.topLeft,
              child: const Text("Hits: ", 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )
              ),
            ),
            const Divider(height: 25, color: Colors.white54),
            Container(
              padding: const EdgeInsets.only(left: 30),
              alignment: Alignment.topLeft,
              child: const Text("Fails: ", 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )
              ),
            ),
            const Divider(height: 25, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}