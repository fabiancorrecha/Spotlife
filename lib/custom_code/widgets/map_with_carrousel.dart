// Automatic FlutterFlow imports
import 'package:flutter/material.dart';

import '/backend/backend.dart';
import '/flutter_flow/lat_lng.dart' as ff; // Importamos LatLng de FlutterFlow
import 'index.dart'; // Imports other custom widgets
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
    required this.goToProfile,
  }) : super(key: key);

  final LatLng userLocation;
  final double zoom;
  final List<UserPostsRecord>? listaPostMarcadores; // todo remove me
  final void Function(SpotDetail post) onMarkerTap;
  final void Function() onMapTap;
  final void Function(ff.LatLng ubication) navigateTo;
  final DocumentReference? usuarioAutenticado;
  final void Function(DocumentReference bycreate) goToProfile;

  @override
  State<MapWithCarrousel> createState() => _MapWithCarrousel();
}

class _MapWithCarrousel extends State<MapWithCarrousel> {
  var showCards = false;
  var spots = <SpotDetail>[];
  SpotDetail? selectedSpot = null;

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
        selectedSpot: selectedSpot,
        userLocation: widget.userLocation,
        onMapTap: _onMapTap,
        onMarkerTap: _onMarkerTap,
        navigateTo: widget.navigateTo,
      ),
      itemBuilder: (item, isSelected) {
        return MapCardSpotItem(
          item: item,
          isSelected: isSelected,
          onImageTap: () {
            context.pushNamed(
              'detallePost',
              pathParameters: {
                'post': serializeParam(
                  item.postRecord,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'post': item.postRecord,
              },
            );
            debugPrint("asanre onImageTap");
          },
          onFavoritesTap: () {
            _savedFavorites(item.isFavorite, item.reference);
            item.isFavorite = !item.isFavorite;
            setState(() {});
            debugPrint("asanre onFavoritesTap");
          },
          onNavigateTap: () => debugPrint("asanre onNavigateTap"),
          onUserTap: () {
            if (item.postUser != null) widget.goToProfile(item.postUser!!);
          },
        );
      },
      onPageChanged: (spot) {
        setState(() {
          selectedSpot = spot;
        });
      },
    );
  }

  Future<void> _initSpots() async {
    final favoritesList = (currentUserDocument?.listaPostFavoritos.toList() ?? []).map((spot) => spot.id).toSet();
    final List<UserPostsRecord> allSpots = widget.listaPostMarcadores ?? [];
    final currentUser = widget.usuarioAutenticado;
    var spotsAsync = allSpots.where((spot) => spot.placeInfo.localizacion != null && spot.postUser != null).map((spot) async => SpotDetail(
          id: spot.reference.id,
          reference: spot.reference,
          title: spot.postTitle,
          imagePath: spot.postPhotolist.isNotEmpty ? spot.postPhotolist.first : '',
          avatarUrl: await getUserPhotoUrl(spot.postUser),
          location: spot.placeInfo.localizacion!!,
          postUser: spot.postUser,
          isLoggedUser: spot.postUser == currentUser,
          description: spot.postDescription,
          placeInfo: spot.placeInfo,
          isFavorite: favoritesList.contains(spot.reference.id),
          postRecord: spot,
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
      selectedSpot = spot;
    });
    widget.onMarkerTap(spot);
  }

  void _onMapTap() {
    if (showCards) {
      setState(() {
        selectedSpot = null;
        showCards = false;
      });
    }
    widget.onMapTap();
  }

  void _sortSpots(SpotDetail spot) {
    final referencePoint = spot.location;
    spots.sort((a, b) => a.location.distanceFrom(referencePoint).compareTo(b.location.distanceFrom(referencePoint)));
  }

  void _savedFavorites(bool isFav, DocumentReference postReference) async {
    // remove
    if (isFav) {
      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'listaPostFavoritos': FieldValue.arrayRemove([postReference]),
          },
        ),
      });

      await postReference.update({
        ...mapToFirestore(
          {
            'FavoritoUser': FieldValue.arrayRemove([currentUserReference]),
          },
        ),
      });
    } else {
      // add
      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'listaPostFavoritos': FieldValue.arrayUnion([postReference]),
          },
        ),
      });

      await postReference.update({
        ...mapToFirestore(
          {
            'FavoritoUser': FieldValue.arrayUnion([currentUserReference]),
          },
        ),
      });
    }
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
