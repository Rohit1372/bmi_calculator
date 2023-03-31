import 'dart:math';

import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class BMI_Screen extends StatefulWidget {
  const BMI_Screen({super.key});

  @override
  State<BMI_Screen> createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  int weight = 40;
  int age = 18;
  double height = 180;

  bool male = true;

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff453a94), Color(0xfff43b47)],
            ),
          ),
        ),
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff453a94), Color(0xfff43b47)],
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Container(
            //color: Colors.red,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    //color: Colors.yellow,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                male = true;
                                print("male : $male");
                              });
                            },
                            child: Container(
                              //color: Colors.amber,
                              decoration: BoxDecoration(
                                //color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff453a94),
                                    Color(0xfff43b47)
                                  ],
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(2),
                                padding: EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  color: male
                                      ? Colors.grey.shade200
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.male,
                                      size: 115,
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                male = false;
                                print("male : $male");
                              });
                            },
                            child: Container(
                              //                     color: Colors.red,
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff453a94),
                                    Color(0xfff43b47)
                                  ],
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(2),
                                padding: EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  color: !male
                                      ? Colors.grey.shade200
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.female,
                                      size: 115,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [Color(0xff453a94), Color(0xfff43b47)],
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "${height.round()}",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "CM",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: height,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            },
                            min: 80,
                            max: 220,
                            activeColor: Colors.grey.shade400,
                            inactiveColor: Colors.grey.shade300,
                            thumbColor: Color(0xfff43b47),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    //color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [Color(0xff453a94), Color(0xfff43b47)],
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Weight",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        "$weight",
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "KG",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [Color(0xff453a94), Color(0xfff43b47)],
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Age",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        "$age",
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "YRS",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Color(0xff453a94), Color(0xfff43b47)],
                    ),
                  ),
                  child: SwipeableButtonView(
                    buttonText: "CALCULATE",
                    buttonWidget: Container(
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    activeColor: Colors.transparent,
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isFinished = true;
                        });
                      });
                    },
                    onFinish: () async {
                      double result = weight / pow(height / 100, 2);
                      print("result : $result");
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMI_Result(
                            result: result,
                            gender: male,
                            age: age,
                          ),
                        ),
                      );
                      setState(() {
                        isFinished = false;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
