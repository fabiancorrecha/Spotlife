import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      const SpotDetail(title: "Arquitecture love", place: "Agra, India", imagePath: "", avatarUrl: ""),
      const SpotDetail(title: "Veggie Brunch", place: "Bcn, Spain", imagePath: "", avatarUrl: ""),
      const SpotDetail(title: "Flip", place: "Mad, Spain", imagePath: "", avatarUrl: ""),
      const SpotDetail(title: "Tom Rios", place: "SVG, Spain", imagePath: "", avatarUrl: ""),
      const SpotDetail(title: "Arquitecture love", place: "Agra, India", imagePath: "", avatarUrl: ""),
    ];

    return MaterialApp(
      home: Scaffold(
        body: SpotCarrousel(
          spots: spots,
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

class SpotCarrousel extends StatefulWidget {
  const SpotCarrousel({
    super.key,
    required this.spots,
    required this.background,
    required this.shouldCards,
  });

  final List<SpotDetail> spots;
  final Widget background;
  final bool shouldCards;

  @override
  State<SpotCarrousel> createState() => _SpotCarrouselState();
}

class _SpotCarrouselState extends State<SpotCarrousel> {
  late PageController _pageViewController;
  late int _currentSelectedIndex;

  @override
  void initState() {
    _currentSelectedIndex = 2;

    _pageViewController = PageController(
      initialPage: _currentSelectedIndex,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final spots = widget.spots;
    return Stack(
      children: [
        widget.background,
        if (widget.shouldCards)
          Align(
            alignment: Alignment.bottomCenter,
            child: buildCarrousel(spots),
          ),
      ],
    );
  }

  Widget buildCarrousel(List<SpotDetail> spots) {
    return Container(
      height: 268,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 42),
      child: PageView.builder(
        itemCount: spots.length,
        onPageChanged: _handlePageChange,
        controller: _pageViewController,
        itemBuilder: (BuildContext context, int index) {
          final SpotDetail item = spots[index];

          return buildSpot(item, index == _currentSelectedIndex);
        },
      ),
    );
  }

  Widget buildSpot(SpotDetail item, bool isSelected) {
    return Transform.scale(
      scale: isSelected ? 1 : 0.97,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  item.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (a, b, c) {
                    return Container(
                      color: Colors.white70,
                    );
                  },
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomListTile(item: item),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePageChange(int value) {
    setState(() {
      _currentSelectedIndex = value;
    });
  }
}

class CustomListTile extends StatelessWidget {
  final SpotDetail item;

  const CustomListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(item.title),
      subtitle: Row(
        children: [const Icon(Icons.location_on_outlined), Text(item.place)],
      ),
      // Add other ListTile properties if required
    );
  }
}

class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key});

  /*
                                               ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            child: Image.asset(
                              item.imagePath,
                              height: _cardHeight - 10,
                              width: _cardHeight - 10,
                              fit: BoxFit.fill,
                            ),
                          )
                       */
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Fill the width
      height: double.infinity, // Fill the height
      color: Colors.blue, // Set the background color to blue
    );
  }
}

class SpotDetail {
  const SpotDetail({
    required this.title,
    required this.place,
    required this.imagePath,
    required this.avatarUrl,
    // required this.latitude,
    // required this.longitude,
  });

  // final double latitude;
  // final double longitude;

  final String imagePath;
  final String place;
  final String title;
  final String avatarUrl;
}
