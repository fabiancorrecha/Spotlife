import 'package:flutter/material.dart';
import 'package:spotlifeapp/custom_code/widgets/spot_carrousel.dart';

class TestAppWidget extends StatefulWidget {
  const TestAppWidget({super.key});

  @override
  State<TestAppWidget> createState() => _TestAppWidgetState();
}

class _TestAppWidgetState extends State<TestAppWidget> {
  var showCards = false;

  @override
  Widget build(BuildContext context) {
    final spots = <SpotDetail>[
    ];

    return MaterialApp(
      home: Scaffold(
        body: SpotCarrousel(
          spots: spots,
          selectedIndex: 1,
          shouldCards: showCards,
          background: buildFakeMapa(),
        ),
      ),
    );
  }

  Container buildFakeMapa() {
    return Container(
      width: double.infinity, // Fill the width
      height: double.infinity, // Fill the height
      color: Colors.red, // Set the background color to blue
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              showCards = !showCards;
            });
          },
          child: Text("Mapa de fondo"),
        ),
      ),
    );
  }
}
