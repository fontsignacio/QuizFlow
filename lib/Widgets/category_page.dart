import 'package:flutter/material.dart';
import 'package:quiz_flow/api/util.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.difficulty});
  final String difficulty;

  @override
  State<CategoryPage> createState() => _HomeState();
}

class _HomeState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 29),
      appBar: AppBar(
        title: const Text("QuizFlow"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(15),
            height: 40,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ElevatedButton(
              child: Text(categories[index], 
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ), 
              onPressed: () {
              },
            )
          );
        },
      ),
    );
  }
}


/*
FutureBuilder(
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
*/ 