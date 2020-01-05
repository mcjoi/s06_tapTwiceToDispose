import 'package:flutter/material.dart';

import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import './main.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        //title: "Intro Page #1",
        //description: "introPage1",
        //pathImage: "images/sp1.jpg",
        centerWidget: Text(
          'Intro Page #1',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: parseColor('041170'),
      ),
    );
    slides.add(
      new Slide(
        //title: "PENCIL",
        // description:
        //     "Ye indulgence unreserved connection alteration appearance",
        //pathImage: "images/sp2.jpg",
        centerWidget: Text(
          'Intro Page #2',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: parseColor('047009'),
      ),
    );
    slides.add(
      new Slide(
        // title: "RULER",
        // description:
        //     "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        //pathImage: "images/sp3.jpg",
        centerWidget: Text(
          'Intro Page #3',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: parseColor('4D2544'),
      ),
    );
  }

  Color parseColor(String color) {
    String hex = color.replaceAll('#', '');
    if (hex.isEmpty) hex = 'ffffff';
    if (hex.length == 3) {
      hex =
          '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => MyApp(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: onDonePress,
    );
  }
}
