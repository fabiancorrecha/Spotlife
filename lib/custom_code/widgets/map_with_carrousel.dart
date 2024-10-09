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
  var spots = <SpotDetail>[];

  @override
  void initState() {
    super.initState();
    spots = widget.listaPostMarcadores
            ?.map((x) => SpotDetail(
                  id: x.reference.id,
                  title: x.postTitle,
                  place: "place",
                  imagePath: x.postPhotolist.isNotEmpty ? x.postPhotolist.first : '',
                  avatarUrl: "",
                ))
            ?.toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return SpotCarrousel(
      spots: spots,
      shouldCards: showCards,
      background: MapaPersonalizado2(
        zoom: widget.zoom,
        userLocation: widget.userLocation,
        usuarioAutenticado: widget.usuarioAutenticado,
        listaPostMarcadores: widget.listaPostMarcadores,
        onMapTap: () {
          setState(() {
            showCards = false;
          });
          widget.onMapTap();
        },
        onMarkerTap: (spot) {
          setState(() {
            showCards = true;
          });
          widget.onMarkerTap(spot);
        },
        navigateTo: widget.navigateTo,
      ),
    );
  }
}