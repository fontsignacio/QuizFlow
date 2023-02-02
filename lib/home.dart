import 'package:flutter/material.dart';
import 'package:quiz_flow/Services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuizFlow"),
      ),
      body: FutureBuilder(
        future: getUser(),
        builder: ((context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data?[index]['name'],
                  style: const TextStyle(color:  Colors.white),
                );
              },
            );
          }else{
            return const Center(
              child:  CircularProgressIndicator(),
            );
          }
        })
      )
    );
  }
}