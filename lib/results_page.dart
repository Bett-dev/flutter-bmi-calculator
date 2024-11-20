import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0a0d22),
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'Your Result',
                style: kLargeTextStyle,
              ),
            ),
    
            const Text(
              'NORMAL',
              style: TextStyle(color: Color(0xff209d60),fontSize: 24),
            ),
            const Text(
              '22.1',
              style: kNumberTextStyle,
            ),
            Container(
              width: double.infinity,
              height: 80,
              color: const Color(0xFFEB1555),
              child: const Center(
                child: Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
