import 'package:flutter/material.dart';

import '/backend/backend.dart';
import 'index.dart'; // Imports other custom widgets

class SpotCarrousel extends StatefulWidget {
  const SpotCarrousel({
    super.key,
    required this.spots,
    required this.selectedIndex,
    required this.background,
    required this.shouldCards,
    required this.itemBuilder,
  });

  final List<SpotDetail> spots;
  final Widget background;
  final int selectedIndex;
  final bool shouldCards;
  final Widget? Function(SpotDetail item, bool isSelected) itemBuilder;

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
          return widget.itemBuilder(item, index == _currentSelectedIndex);
        },
      ),
    );
  }

  void _handlePageChange(int value) {
    setState(() {
      _currentSelectedIndex = value;
    });
  }
}

class MapCardSpotItem extends StatelessWidget {
  const MapCardSpotItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onFavoritesTap,
    required this.onNavigateTap,
    required this.onImageTap,
    required this.onUserTap,
  });

  final bool isSelected;
  final SpotDetail item;
  final GestureTapCallback onFavoritesTap;
  final GestureTapCallback onNavigateTap;
  final GestureTapCallback onImageTap;
  final GestureTapCallback onUserTap;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isSelected ? 1 : 0.97,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ImageBackground(
              imagePath: item.imagePath,
              onTap: onImageTap,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  _userSpotDetail(item),
                  _favoritesIcon(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: _navigateIcon(),
            ),
          ],
        ),
      ),
    );
  }

  IconButton _navigateIcon() {
    return IconButton(
      icon: Icon(Icons.edit_location_outlined, color: Colors.white),
      onPressed: onNavigateTap,
    );
  }

  IconButton _favoritesIcon() {
    return IconButton(
      icon: Icon(Icons.star_border, color: Colors.white),
      onPressed: onFavoritesTap,
    );
  }

  Expanded _userSpotDetail(SpotDetail item) {
    return Expanded(
      child: CustomListTile(
        item: item,
        onTap: onUserTap,
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final SpotDetail item;
  final GestureTapCallback? onTap;

  const CustomListTile({super.key, required this.item, this.onTap});

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
      onTap: onTap,
      // Add other ListTile properties if required
    );
  }
}

class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key, required this.imagePath, this.onTap});

  final String imagePath;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
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
          )),
      onTap: onTap,
    );
  }
}

class SpotDetail {
  const SpotDetail({
    required this.id,
    required this.title,
    required this.place,
    required this.imagePath,
    required this.avatarUrl,
    required this.location,
  });

  final String id;
  final String imagePath;
  final String place;
  final String title;
  final String avatarUrl;
  final LatLng location;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpotDetail &&
        other.id == id &&
        other.title == title &&
        other.place == place &&
        other.imagePath == imagePath &&
        other.avatarUrl == avatarUrl &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ place.hashCode ^ imagePath.hashCode ^ avatarUrl.hashCode ^ location.hashCode;
  }
}