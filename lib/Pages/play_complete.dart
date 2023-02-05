import 'package:flutter/material.dart';

class Complete extends StatelessWidget {
  const Complete({super.key, required this.points});
  final num points;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 29),
      body: Padding(
        padding:const  EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20, top: 50),
              child:Image.asset('assets/images/good.png',
                height: 300,
                scale: 1,
              )
            ),
            Container(
              alignment: Alignment.center,
              child: const Text("Good Work",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Text("+${points.toString()} points",
                style: const TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 20
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text("Continue"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
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