import 'package:bmicalculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

double height = 173;
int weight = 74;
int age = 19;

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  updateGender({Gender? currentGender}) {
    setState(() {
      selectedGender = currentGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () => updateGender(currentGender: Gender.male),
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : KinativeCardColor,
                    cardchild: CardContent(
                      label: 'MALE',
                      iconn: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () => updateGender(currentGender: Gender.female),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : KinativeCardColor,
                    cardchild: CardContent(
                      label: 'FEMALE',
                      iconn: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          color: KregularText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                          disabledThumbRadius: 18, enabledThumbRadius: 18),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
                      activeTrackColor: Color(0x0fffffff),
                      inactiveTrackColor: Color(0xff111428),
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0xff31142f),
                    ),
                    child: Slider(
                      value: height,
                      max: 220,
                      min: 120,
                      onChanged: (double value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: KinativeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toStringAsFixed(0),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Rowbutton(
                              icon: Icons.remove,
                              press: () {
                                setState(() {
                                  weight = weight > 30 ? weight - 1 : weight;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            Rowbutton(
                              icon: Icons.add,
                              press: () {
                                setState(() {
                                  weight = weight < 220 ? weight + 1 : weight;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: KinativeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toStringAsFixed(0),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Rowbutton(
                              icon: Icons.remove,
                              press: () {
                                setState(() {
                                  age = age > 12 ? age - 1 : age;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            Rowbutton(
                              icon: Icons.add,
                              press: () {
                                setState(() {
                                  age = age < 140 ? age + 1 : age;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: KinativeCardColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
           

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(bmiResult: calc.calculateBMI(),resultText: calc.getResult(),resultInterpretation: calc.getInterpretation(),),
                ),
              );
            },
            child: Container(
              height: 70, // Specify a fixed height
              width: double.infinity,
              color: kBottomBarColor,
              alignment: Alignment.center,
              child: const Text(
                'CALCULATE YOUR BMI',
                style: kBottomBarText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Rowbutton extends StatelessWidget {
  final IconData icon;
  final VoidCallback press;
  Rowbutton({required this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: BoxConstraints.tight(Size(60, 60)),
      shape: CircleBorder(),
      fillColor: Color(0xff1c1f32),
      onPressed: press,
      child: Icon(
        icon,
        size: 36,
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String label;
  final IconData iconn;
  CardContent({required this.label, required this.iconn});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconn,
          size: 80,
        ),
        Text(
          label,
          style: kTextStyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardchild;
  final VoidCallback? onpress;
  const ReusableCard({required this.colour, this.cardchild, this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ),
          child: cardchild,
        ),
      ),
    );
  }
}
