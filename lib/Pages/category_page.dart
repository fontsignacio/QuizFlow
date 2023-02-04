import 'package:flutter/material.dart';
import 'package:quiz_flow/Pages/quiz.dart';
import 'package:quiz_flow/api/util.dart';
import 'package:quiz_flow/Models/category_model.dart';

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
        backgroundColor:const  Color.fromARGB(255, 84, 81, 123),
        title: const Text("QuizFlow"),
        shadowColor: Colors.white,
        actions: [
          Padding(      
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton <MenuItem> (
              iconSize: 40,
              color: const Color(0xff292b37),
              icon: CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7), 
                  child: const Icon(Icons.person),
                ),
              ),
              itemBuilder: (context) =>  [
                PopupMenuItem(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),                          
                        child: CircleAvatar(  
                        radius: 60,                
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100), 
                          child: const Icon(Icons.person),
                        ),
                      ),
                      ),
                      /*const Padding(
                        padding: EdgeInsets.only(top: 140, left: 20),
                        child: Text("fontsignacio", 
                          style: TextStyle(
                            color: Colors.white
                          )
                        ),
                      ),*/
                    ],
                  )
                ),      
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.logout, size: 20,),
                      Text("    Logout",
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                    ],
                  )
                ),
              ]  
            )
          )
        ],
      ),
      body: GridView.builder( 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
          crossAxisCount: 2,
        ),  
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final int count = index + 9;
          return Container(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              child: Column(           
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white38,
                          spreadRadius: 2,
                          blurRadius: 7
                        )
                      ],                       
                    ),
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                      child:Image.network(categoryModel[index].imgUrl,
                      fit: BoxFit.fill,
                      width: 160,
                      height: 133,
                      ),
                    )
                  ),    
                  Container(
                    alignment: Alignment.center,
                    height: 32,
                    child: Card(
                      color: Colors.black38,
                      child: Text(categories[index], 
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    )
                  )
                ],
              ),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => QuizScreen(difficulty: widget.difficulty, category: '$count'));
                Navigator.of(context).push(router);
              },
            )
          );
        },
      ),
    );
  }
}