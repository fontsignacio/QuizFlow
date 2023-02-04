import 'package:flutter/material.dart';
import 'package:quiz_flow/Pages/difficulty.dart';
import 'package:quiz_flow/Pages/profile.dart';
import 'package:quiz_flow/api/util.dart';
import 'package:quiz_flow/Models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_flow/Services/auth.dart';

enum MenuItem {item1,item2}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _HomeState();
}

class _HomeState extends State<CategoryPage> {

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 29),
      appBar: AppBar(
        backgroundColor:const  Color.fromARGB(255, 76, 61, 189),
        title: Row(
          children: [
            Image.asset('assets/images/logo.png',
              height: 40,
              scale: 0.5,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(" QuizFlow",
              style: TextStyle(
                fontSize: 25
              )
            ) ,
            ) 
          ],
        ),
        shadowColor: Colors.white,
        actions: [
          Padding(      
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton <MenuItem> (
               onSelected: (value) => {
                if(value == MenuItem.item1){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(),
                  )),
                } else if(value == MenuItem.item2) signOut() 
              },
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
                  value:  MenuItem.item1,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 10),                          
                        child: CircleAvatar(  
                        radius: 60,                
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100), 
                          child: const Icon(Icons.person, size: 60,),
                        ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 140, left: 20, bottom: 20),
                        child: Text(user?.email ?? '', 
                          style: const TextStyle(
                            color: Colors.white
                          )
                        ),
                      ),
                    ],
                  )
                ),      
                PopupMenuItem(
                  value:  MenuItem.item2,
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
                      child: Text('  ${categories[index]}  ', 
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17
                        ),
                      ),
                    )
                  )
                ],
              ),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => Difficulty(category: '$count'));
                Navigator.of(context).push(router);
              },
            )
          );
        },
      ),
    );
  }
}