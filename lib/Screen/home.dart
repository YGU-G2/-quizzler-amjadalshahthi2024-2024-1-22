import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizzler/Widgets/buttons.dart';
import 'package:quizzler/Widgets/color_buttons.dart';
import 'package:quizzler/Widgets/questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isStart = true;
  int counter = 0;
  int allTrue = 0;

  List<Color> myColors = [
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.grey,
    Colors.black,
    Colors.pink,
    Colors.purple,
    Colors.white
  ];

  List<Color> realColor = [];
  Random random = Random();

  void checkColor(int index) {
    setState(() {
      if (counter < myQuestionsList.length) {
        if (myQuestionsList[counter].isTrue) {
          if (realColor[index] == myQuestionsList[counter].color) {
            myQuestionsList[counter].theAwnser = true;
          } else {
            myQuestionsList[counter].theAwnser = false;
          }
        } else {
          if (realColor[index] != myQuestionsList[counter].color) {
            myQuestionsList[counter].theAwnser = true;
          } else {
            myQuestionsList[counter].theAwnser = false;
          }
        }
        if (counter < myQuestionsList.length) {
          counter++;
        }
        if (counter == myQuestionsList.length) {
          for (var list in myQuestionsList) {
            list.theAwnser == true ? allTrue++ : allTrue;
          }
          myQuestionsList.shuffle();
        }
      }
    });
  }

  void checkRandom() {
    if (counter < myQuestionsList.length) {
      realColor.clear();
      realColor.add(myQuestionsList[counter].color);
      for (var i = 0; i < myColors.length; i++) {
        myColors.shuffle();
        if (!realColor.contains(myColors[i])) {
          realColor.add(myColors[i]);
          if (realColor.length == 4) {
            break;
          }
        }
      }
      realColor.shuffle();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkRandom();
    return Scaffold(
      body: isStart
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(                    
                    color: Colors.white,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(                      
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Text(
                              "لنبداء التحدي",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text("التحدي سوف تظهر مربعات ألوان وتعليمات أختيار الوان المربعات" ,
                            textAlign: TextAlign.center,
                             style: TextStyle(                            
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                          ),
                          
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            height: 50,
                            child: Buttons(
                              btnChild: Text(
                                "لنبداء ",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              press: () {
                                setState(() {
                                  isStart = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: (counter >= myQuestionsList.length)
                      ? Padding(
                          padding: const EdgeInsets.all(20),
                          child: Card(
                            color: Colors.white,
                            elevation: 20,
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  child: Text(
                                    "نتيجة التحدي",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$allTrue :",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${myQuestionsList.length - allTrue} :",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 8, 4, 4),
                                            fontSize: 22),
                                      ),
                                      Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                Container(
                                  height: 50,
                                  child: Buttons(
                                    btnChild: Text(
                                      "إبداء التحدي من جديد",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    press: () {
                                      setState(() {
                                        counter = 0;
                                        allTrue = 0;
                                        for (var list in myQuestionsList) {
                                          list.theAwnser = null;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Questions(questionsList: myQuestionsList[counter]),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.black12,
                            width: MediaQuery.of(context).size.width - 60,
                            height: 220,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ColorButtons(
                                      tap: () => checkColor(0),
                                      color: realColor[0],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ColorButtons(
                                      tap: () => checkColor(1),
                                      color: realColor[1],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ColorButtons(
                                      tap: () => checkColor(2),
                                      color: realColor[2],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ColorButtons(
                                      tap: () => checkColor(3),
                                      color: realColor[3],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.search,
        //     color: Colors.indigo,
        //   ),
        // ),
        backgroundColor: Colors.indigo,
        title: Text(
          "Quizzler",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
