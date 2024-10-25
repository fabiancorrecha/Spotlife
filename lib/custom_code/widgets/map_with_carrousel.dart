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
    super.initState();
    final List<UserPostsRecord> allSpots = widget.listaPostMarcadores ?? [];
    spots = allSpots
        .where((spot) => spot.placeInfo.latLng != null)
        .map((spot) => SpotDetail(
              id: spot.reference.id,
              title: spot.postTitle,
              place: "place",
              imagePath: spot.postPhotolist.isNotEmpty ? spot.postPhotolist.first : '',
              avatarUrl: "",
              location: spot.placeInfo.latLng!!,
            ))
        .toSet()
        .toList();
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
        onMapTap: () {
          if (showCards) {
            setState(() {
              showCards = false;
            });
          }
          widget.onMapTap();
        },
        onMarkerTap: (spot) {
          List<SpotDetail> sortedPots = _getSpotsSorted(spot);
          setState(() {
            selectedIndex = sortedPots.indexWhere((it) => it.id == spot.reference.id);
            spots = sortedPots;
            showCards = true;
          });
          widget.onMarkerTap(spot);
        },
        navigateTo: widget.navigateTo,
      ),
    );
  }

  List<SpotDetail> _getSpotsSorted(UserPostsRecord spot) {
    final referencePoint = spot.placeInfo.latLng!!;
    final List<SpotDetail> sortedPots = List.from(spots);
    sortedPots.sort((a, b) => a.location.distanceFrom(referencePoint).compareTo(b.location.distanceFrom(referencePoint)));
    return sortedPots;
  }
}
