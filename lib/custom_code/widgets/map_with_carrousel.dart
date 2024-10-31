// Automatic FlutterFlow imports
import 'package:flutter/material.dart';

import '/backend/backend.dart';
import '/flutter_flow/lat_lng.dart' as ff; // Importamos LatLng de FlutterFlow
import 'index.dart'; // Imports other custom widgets

class MapWithCarrousel extends StatefulWidget {
  const MapWithCarrousel({
    Key? key,
    required this.userLocation,
    this.zoom = 16.0,
    this.listaPostMarcadores,
    required this.onMapTap,
    required this.onMarkerTap,
    required this.navigateTo,
    required this.usuarioAutenticado,
  }) : super(key: key);

  final LatLng userLocation;
  final double zoom;
  final List<UserPostsRecord>? listaPostMarcadores; // todo remove me
  final void Function(SpotDetail post) onMarkerTap;
  final void Function() onMapTap;
  final void Function(ff.LatLng ubication) navigateTo;
  final DocumentReference? usuarioAutenticado;

  @override
  State<MapWithCarrousel> createState() => _MapWithCarrousel();
}

class _MapWithCarrousel extends State<MapWithCarrousel> {
  var showCards = false;
  var spots = <SpotDetail>[];
  SpotDetail? carrouselSpotLocation = null;

  @override
  void initState() {
    _initSpots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpotCarrousel(
      spots: spots,
      shouldCards: showCards,
      background: CarrouselMap(
        spots: List.from(spots),
        zoom: widget.zoom,
        selectedSpotLocation: carrouselSpotLocation,
        userLocation: widget.userLocation,
        onMapTap: _onMapTap,
        onMarkerTap: _onMarkerTap,
        navigateTo: widget.navigateTo,
      ),
      itemBuilder: (item, isSelected) {
        return MapCardSpotItem(
          item: item,
          isSelected: isSelected,
          onImageTap: () => debugPrint("asanre onImageTap"),
          onFavoritesTap: () => debugPrint("asanre onFavoritesTap"),
          onNavigateTap: () => debugPrint("asanre onNavigateTap"),
          onUserTap: () => debugPrint("asanre onUserTap"),
        );
      },
      onPageChanged: (location) {
        setState(() {
          carrouselSpotLocation = location;
        });
      },
    );
  }

  Future<void> _initSpots() async {
    final List<UserPostsRecord> allSpots = widget.listaPostMarcadores ?? [];
    var spotsAsync = allSpots.where((spot) => spot.placeInfo.latLng != null).map((spot) async => SpotDetail(
          id: spot.reference.id,
          title: spot.postTitle,
          imagePath: spot.postPhotolist.isNotEmpty ? spot.postPhotolist.first : '',
          avatarUrl: await getUserPhotoUrl(spot.postUser),
          location: spot.placeInfo.latLng!!,
          postUser: spot.postUser,
          description: spot.postDescription,
          placeInfo: spot.placeInfo,
        ));
    var _spots = await Future.wait(spotsAsync.toSet().toList());
    setState(() {
      spots = _spots;
    });
  }

  void _onMarkerTap(spot) {
    _sortSpots(spot);
    setState(() {
      showCards = true;
    });
    widget.onMarkerTap(spot);
  }

  void _onMapTap() {
    if (showCards) {
      setState(() {
        showCards = false;
      });
    }
    widget.onMapTap();
  }

  void _sortSpots(SpotDetail spot) {
    final referencePoint = spot.location;
    spots.sort((a, b) => a.location.distanceFrom(referencePoint).compareTo(b.location.distanceFrom(referencePoint)));
  }
}

Future<String> getUserPhotoUrl(DocumentReference? userRef) async {
  if (userRef == null) return "";
  try {
    final userDoc = await userRef.get();
    if (userDoc.exists) {
      return userDoc['photo_url'] ?? '';
    }
  } catch (e) {
    print('Error obteniendo la URL de la foto del usuario: $e');
  }
  return '';
}
