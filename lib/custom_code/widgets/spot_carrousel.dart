import 'package:flutter/material.dart';

import '/backend/backend.dart';
import 'dart:ui';
import 'index.dart'; // Imports other custom widgets
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spotlifeapp/flutter_flow/custom_icons.dart';
import 'package:spotlifeapp/flutter_flow/flutter_flow_theme.dart';

class SpotCarrousel extends StatefulWidget {
  const SpotCarrousel({
    super.key,
    required this.spots,
    required this.background,
    required this.shouldCards,
    required this.itemBuilder,
    required this.onPageChanged,
  });

  final List<SpotDetail> spots;
  final Widget background;
  final bool shouldCards;
  final Widget? Function(SpotDetail item, bool isSelected) itemBuilder;
  final void Function(SpotDetail spot) onPageChanged;

  @override
  State<SpotCarrousel> createState() => _SpotCarrouselState();
}

class _SpotCarrouselState extends State<SpotCarrousel> {
  PageController _pageViewController = PageController(
    viewportFraction: 0.8,
  );
  var listFirstItemId = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(SpotCarrousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    var currentId = widget.spots[0]?.id;
    if (widget.shouldCards && currentId != listFirstItemId) {
      listFirstItemId = currentId ?? "";
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageViewController.animateToPage(
          0, // Replace with your desired page index
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
        if (widget.shouldCards)
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
          return widget.itemBuilder(item, false);
        },
      ),
    );
  }

  void _handlePageChange(int value) {
    widget.onPageChanged(widget.spots[value]);
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 2.0),
                  child: Container(
                    color: Color(0x21141313),
                    child: Row(
                      children: [
                        _userSpotDetail(item),
                        _favoritesIcon(context, item.isFavorite),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (false) // todo hide to route
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

  IconButton _favoritesIcon(BuildContext context, bool isFavorite) {
    return IconButton(
      icon: Icon(
        isFavorite ? FFIcons.kframe168 : FFIcons.kstarLines,
        color: isFavorite ? FlutterFlowTheme.of(context).customSeleccion : FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
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
      leading: CircularNetworkImage(imageUrl: item.avatarUrl),
      title: Text(item.title,
          style: textColor.copyWith(fontSize: 16, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: item.city.isNotEmpty
          ? Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.white, size: 12),
                Text(item.city, style: textColor.copyWith(fontSize: 10), maxLines: 1),
              ],
            )
          : Container(height: 14),
      onTap: onTap,
      // Add other ListTile properties if required
    );
  }
}

class CircularNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const CircularNetworkImage({
    super.key,
    required this.imageUrl,
    this.radius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: Size.fromRadius(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl.isNotEmpty
              ? imageUrl
              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover, // Adjust the fit as needed
        ),
      ),
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
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 200),
          fadeOutDuration: const Duration(milliseconds: 200),
          imageUrl: imagePath.isNotEmpty
              ? imagePath
              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
          placeholder: (BuildContext context, String url) {
            return Image.asset('assets/images/card_loading_image.png');
          },
          errorWidget: (BuildContext context, String url, Object error) {
            return Image.asset('assets/images/card_loading_image.png');
          },
        ),
      ),
      onTap: onTap,
    );
  }
}

class SpotDetail {
  SpotDetail({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.avatarUrl,
    required this.location,
    required this.postUser,
    required this.isLoggedUser,
    required this.description,
    required this.placeInfo,
    required this.isFavorite,
    required this.reference,
  });

  final String id;
  final String imagePath;
  final String title;
  final String? description;
  final String avatarUrl;
  final LatLng location;
  final bool isLoggedUser;
  bool isFavorite;
  final DocumentReference reference;
  final DocumentReference? postUser;
  final PlaceInfoStruct placeInfo;

  String get city => placeInfo.city;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpotDetail &&
        other.id == id &&
        other.title == title &&
        other.imagePath == imagePath &&
        other.avatarUrl == avatarUrl &&
        other.isLoggedUser == isLoggedUser &&
        other.description == description &&
        other.postUser == postUser &&
        other.placeInfo == placeInfo &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        postUser.hashCode ^
        placeInfo.hashCode ^
        imagePath.hashCode ^
        avatarUrl.hashCode ^
        location.hashCode;
  }
}
