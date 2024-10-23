import 'package:flutter/material.dart';

class SpotCarrousel extends StatefulWidget {
  const SpotCarrousel({
    super.key,
    required this.spots,
    required this.selectedIndex,
    required this.background,
    required this.shouldCards,
  });

  final List<SpotDetail> spots;
  final Widget background;
  final int selectedIndex;
  final bool shouldCards;

  @override
  State<SpotCarrousel> createState() => _SpotCarrouselState();
}

class _SpotCarrouselState extends State<SpotCarrousel> {
  PageController _pageViewController = PageController(
    viewportFraction: 0.8,
  );
  late int _currentSelectedIndex;

  @override
  void initState() {
    _currentSelectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(SpotCarrousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _currentSelectedIndex = widget.selectedIndex;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageViewController.animateToPage(
          _currentSelectedIndex, // Replace with your desired page index
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final spots = widget.spots;
    return Stack(
      children: [
        widget.background,
        if (widget.shouldCards && widget.selectedIndex != -1)
          Align(
            alignment: Alignment.bottomCenter,
            child: buildCarrousel(spots),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
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
            ImageBackground(imagePath: item.imagePath),
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
    final textColor = TextStyle(
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    );
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(item.title, style: textColor, maxLines: 1),
      subtitle: Row(
        children: [
          Icon(Icons.location_on_outlined, color: Colors.white),
          Text(item.place, style: textColor, maxLines: 1),
        ],
      ),
      // Add other ListTile properties if required
    );
  }
}

class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imagePath,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            /*
            todo asanre
             1. ux specify color placeholder  -> frameBuilder
             2. should show a loading indicator? use loadingBuilder
             3. what to see when loading error?
             */
            return Container(
              color: Colors.grey,
              child: child,
            );
          },
          errorBuilder: (a, b, c) {
            return Container(
              color: Colors.blueGrey,
            );
          },
        ));
  }
}

class SpotDetail {
  const SpotDetail({
    this.id,
    required this.title,
    required this.place,
    required this.imagePath,
    required this.avatarUrl,
    // required this.latitude,
    // required this.longitude,
  });

  // final double latitude;
  // final double longitude;

  final String? id;
  final String imagePath;
  final String place;
  final String title;
  final String avatarUrl;
}
