import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Padding(
        padding:const  EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20, top: 50),
              child:Image.asset('assets/images/error.png',
                height: 300,
                scale: 1,
              )
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10),
              child: const Text("ERROR",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 30
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              child: const Text("This level is incomplete,\n   select other difficulty.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: const Text("Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      )
    );
  }
}