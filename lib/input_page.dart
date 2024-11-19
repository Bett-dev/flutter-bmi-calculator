import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

const KactiveCardColor = Color(0xff272a4d);
const KinativeCardColor = Color(0xff0e1125);
const KtextColor = Color(0xfffefefe);
const Kcolor = const Color(0xff0e1125);
const KregularText = Color(0xff868892);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

double height = 180;
int weight = 74;
int age = 19;

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  updateGender({Gender? CurrentGender}) {
    setState(() {
      selectedGender = CurrentGender;
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
                      onpress: () => updateGender(CurrentGender: Gender.male),
                      colour: selectedGender == Gender.male
                          ? KactiveCardColor
                          : KinativeCardColor,
                      cardchild: CardContent(
                        label: 'MALE',
                        iconn: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onpress: () => updateGender(CurrentGender: Gender.female),
                      colour: selectedGender == Gender.female
                          ? KactiveCardColor
                          : KinativeCardColor,
                      cardchild: CardContent(
                        label: 'FEMALE',
                        iconn: FontAwesomeIcons.venus,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardchild: Column(
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                          color: KregularText,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(0),
                          style: const TextStyle(
                              color: KtextColor,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                              color: KregularText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        thumbShape: RoundSliderThumbShape(
                            disabledThumbRadius: 18, enabledThumbRadius: 18),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 32),
                        activeTrackColor: Color(0xfffffff),
                        inactiveTrackColor: Color(0xff111428),
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0xff31142f),
                      ),
                      child: Slider(
                        value: height,
                        max: 220,
                        min: 120,
                        onChanged: (double value) => setState(
                          () {
                            height = value;
                          },
                        ),
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
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                                color: KregularText,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          Text(
                            weight.toStringAsFixed(0),
                            style: const TextStyle(
                                color: KtextColor,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Rowbutton(icon: Icons.remove),
                              SizedBox(width: 10,),
                              Rowbutton(icon: Icons.add),
                            ],
                          )
                        ],
                      ),
                      colour: KinativeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardchild: Column(
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                                color: KregularText,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          Text(
                            age.toStringAsFixed(0),
                            style: const TextStyle(
                                color: KtextColor,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Rowbutton(icon: Icons.remove),
                              const SizedBox(width: 10,),
                              Rowbutton(icon: Icons.add),
                            ],
                          )
                        ],
                      ),
                      colour: KinativeCardColor,
                    ),
                  )
                ],
              ),
            ),
            const Row(
              children: [
                Expanded(
                    child: BottomAppBar(
                  color: Color(0xFFEB1555),
                  child: Center(
                      child: Text(
                    'CALCULATE YOU BMI',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )),
                )),
              ],
            ),
          ],
        ));
  }
}

class Rowbutton extends StatelessWidget {
  final IconData icon;
  Rowbutton({required this.icon}) {}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: BoxConstraints.tight(Size(60, 60)),
      shape: CircleBorder(),
      fillColor: Color(0xff1c1f32),
      onPressed: () {},
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
          style: const TextStyle(color: KtextColor, fontSize: 18),
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
