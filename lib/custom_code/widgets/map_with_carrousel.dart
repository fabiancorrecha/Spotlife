// Automatic FlutterFlow imports
import 'package:flutter/material.dart';

import '/backend/backend.dart';
import '/flutter_flow/lat_lng.dart' as ff; // Importamos LatLng de FlutterFlow
import 'index.dart'; // Imports other custom widgets

class MapWithCarrousel extends StatefulWidget {
  const MapWithCarrousel({
    Key? key,
    required this.userLocation,
    this.zoom,
    this.listaPostMarcadores,
    required this.onMapTap,
    required this.onMarkerTap,
    required this.navigateTo,
    required this.usuarioAutenticado,
  }) : super(key: key);

  final LatLng userLocation;
  final double? zoom;
  final List<UserPostsRecord>? listaPostMarcadores;
  final void Function(UserPostsRecord post) onMarkerTap;
  final void Function() onMapTap;
  final void Function(ff.LatLng ubication) navigateTo;
  final DocumentReference? usuarioAutenticado;

  @override
  State<MapWithCarrousel> createState() => _MapWithCarrousel();
}

class _MapWithCarrousel extends State<MapWithCarrousel> {
  var showCards = false;
  var selectedIndex = -1;
  var spots = <SpotDetail>[];

  @override
  void initState() {
    _initSpots();
    super.initState();
  }

  Future<void> _initSpots() async {
    final List<UserPostsRecord> allSpots = widget.listaPostMarcadores ?? [];
    var spotsAsync = allSpots.where((spot) => spot.placeInfo.latLng != null).map((spot) async => SpotDetail(
          id: spot.reference.id,
          title: spot.postTitle,
          place: "place",
          imagePath: spot.postPhotolist.isNotEmpty ? spot.postPhotolist.first : '',
          avatarUrl: await getUserPhotoUrl(spot.postUser),
          location: spot.placeInfo.latLng!!,
        ));
    spots = await Future.wait(spotsAsync.toSet().toList());
  }

  @override
  Widget build(BuildContext context) {
    return SpotCarrousel(
      spots: spots,
      shouldCards: showCards,
      selectedIndex: selectedIndex,
      background: CarrouselMap(
        zoom: widget.zoom,
        userLocation: widget.userLocation,
        usuarioAutenticado: widget.usuarioAutenticado,
        listaPostMarcadores: widget.listaPostMarcadores,
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
    );
  }

  void _onMarkerTap(spot) {
    _sortSpots(spot);
    setState(() {
      selectedIndex = 0;
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

  void _sortSpots(UserPostsRecord spot) {
    final referencePoint = spot.placeInfo.latLng!!;
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
