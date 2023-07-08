import 'package:bmi_app/Widgets/my_card.dart';
import 'package:bmi_app/Widgets/navigate_widget.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Text(
                    widget.bmiResult,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.resultText,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    widget.interpretation,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigatePop(context: context);
            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: const Center(
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}
