import 'dart:async';
import 'package:quiz_flow/Pages/play_complete.dart';
import 'package:quiz_flow/api/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizScreen extends StatefulWidget{
  const QuizScreen({super.key,required this.difficulty,required this.category});

  final String difficulty;
  final String category;  

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{
  var currentQuestionIndex = 0;
  int seconds = 30;
  Timer? timer;
  late Future quiz;
  var unescape = HtmlUnescape();

  int points = 0;
  int hits = 0;
  int fails = 0;

  int allpoints = 0;
  int allhits = 0;
  int allfails = 0;

  var isLoaded = false;

  var optionsList = [];

  var optionsColor = [
    Colors.black54,
    Colors.black54,
    Colors.black54,
    Colors.black54,
    Colors.black54,
  ];

  Future<void> savePoints(int points, int fails, int hits) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('allpoints', points);
    await prefs.setInt('allhits', hits);
    await prefs.setInt('allfails', fails);
  }

  Future<void> viewStadistic() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    allpoints = prefs.getInt('allpoints')!;
    allhits = prefs.getInt('allhits')!;
    allfails = prefs.getInt('allfails')!;
  }

  @override
  void initState() {
    super.initState();
    quiz = getQuiz(widget.category,widget.difficulty);
    startTimer();
    viewStadistic();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  resetColors() {
    optionsColor = [
      Colors.black54,
      Colors.black54,
      Colors.black54,
      Colors.black54,
      Colors.black54,
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 30;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 15, 15, 29), Color.fromARGB(255, 76, 61, 189)],
          )
        ),
        child: FutureBuilder(
          future: quiz,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data["results"];

              if (isLoaded == false) {
                optionsList = data[currentQuestionIndex]["incorrect_answers"];
                optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                optionsList.shuffle();
                isLoaded = true;
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => showDialog(
                            useRootNavigator: false,
                            context: context, 
                            builder: (context) => AlertDialog(
                              backgroundColor: const Color.fromARGB(255, 52, 51, 51),
                              title: const Text("Do you want to quit?",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              actions: [
                                TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text("Cancel",
                                  style: TextStyle(color: Colors.red)
                                  )
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text("$seconds", 
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                value: seconds / 30,
                                valueColor: const AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Question ${currentQuestionIndex + 1} of ${data.length}",
                        style: const TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 25
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Card(
                        color: const Color.fromARGB(255, 52, 51, 51),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          height: 140,
                          child: Text(unescape.convert(data[currentQuestionIndex]["question"]),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                        )
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: optionsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var answer = data[currentQuestionIndex]["correct_answer"];
                        return GestureDetector( 
                          onTap: () {
                            setState(() {
                              if (answer.toString() == optionsList[index].toString()) {
                                optionsColor[index] = Colors.green;
                                points = points + 10;
                                hits++;
                              } else {
                                optionsColor[index] = Colors.red;
                                fails++;
                              }
                              if (currentQuestionIndex < data.length - 1) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  gotoNextQuestion();
                                }); 
                              } else {
                                timer!.cancel();
                                var router = MaterialPageRoute(
                                builder: (context) => Complete(points: points));
                                Navigator.of(context).push(router);

                                int count = points + allpoints;
                                int count1 = hits + allhits;
                                int count2 = fails + allfails;
                                
                                savePoints(count, count1, count2);

                                FirebaseFirestore.instance.collection("stadistics")
                                  .doc("1h01pKqWOMxuyvgpGFjP").update({
                                    'points' : allpoints,
                                    'hits' :  allhits,
                                    'fails' : allfails
                                  }
                                );                             
                              } 
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            width: size.width - 100,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: optionsColor[index],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(unescape.convert(optionsList[index].toString()),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }
          },
        ),
      )),
    );  
  }
}  
