import 'package:bmi_app/Widgets/my_card.dart';
import 'package:bmi_app/Widgets/navigate_widget.dart';
import 'package:bmi_app/model/bmi_model.dart';
import 'package:bmi_app/pages/ResultsPage.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isMale = true;
  double height = 150;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: MyCard(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  colors: isMale ? Colors.blueAccent : Colors.grey,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Male")
                    ],
                  ),
                )),
                Expanded(
                    child: MyCard(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  colors: isMale ? Colors.grey : Colors.blueAccent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Female")
                    ],
                  ),
                )),
              ],
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toStringAsFixed(0),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 54),
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Slider(
                          min: 50,
                          max: 250,
                          value: height,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          }),
                    ],
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("WEIGHT"),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: const Text(
                                  "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Age"),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: const Text(
                                  "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                BMIModel bmi =
                    BMIModel(weight: weight, height: height.toInt());
                navigatePush(
                    context: context,
                    nextScreen: ResultsPage(
                        bmiResult: bmi.calculateBMI(),
                        resultText: bmi.getResult(),
                        interpretation: bmi.getInterpretation()));
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        ));
  }
}
