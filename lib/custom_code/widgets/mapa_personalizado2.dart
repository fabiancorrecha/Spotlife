// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/custom_code/utils/maps.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:label_marker/label_marker.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '/flutter_flow/lat_lng.dart' as ff; // Importamos LatLng de FlutterFlow

class MapaPersonalizado2 extends StatefulWidget {
  const MapaPersonalizado2({
    Key? key,
    required this.userLocation,
    this.zoom,
    this.listaPostMarcadores,
    required this.onMapTap,
    required this.onMarkerTap, // Argumento agregado
    required this.navigateTo, // Argumento agregado
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
  _MapaPersonalizado2State createState() => _MapaPersonalizado2State();
}

class _MapaPersonalizado2State extends State<MapaPersonalizado2> {
  Set<gmap.Marker> markers = {};
  gmap.Marker? _movableMarker;
  late String _mapStyle;
  final Completer<gmap.GoogleMapController> _controller = Completer<gmap.GoogleMapController>();
  bool _isInfoVisible = false;
  bool _isMovableMarkerVisible = false;
  bool _isContainerExpanded = false;
  String _selectedTitle = '';
  String _selectedSubtitle = '';
  String _selectedImageUrl = '';
  gmap.LatLng? _selectedMarkerPosition;
  DocumentReference? _selectedPostUser;
  final TextEditingController searchController = TextEditingController();
  List<UserPostsRecord> _searchResults = [];

  late gmap.CameraPosition initialCameraPosition;
  double currentZoom = 15.0;

  @override
  void initState() {
    super.initState();
    currentZoom = widget.zoom ?? currentZoom;
    _mapStyle = MAP_STYLE;

    double initialLat = widget.userLocation.latitude ?? 0.0;
    double initialLng = widget.userLocation.longitude ?? 0.0;
    initialCameraPosition = gmap.CameraPosition(
      target: gmap.LatLng(initialLat, initialLng),
      zoom: currentZoom,
    );

    try {
      loadMarkers();
    } catch (e) {
      print('Error al cargar los marcadores: $e');
    }

    searchController.addListener(_onSearchChanged);
  }

  loadMarkers() async {
    if (widget.listaPostMarcadores != null) {
      final listMarkers = await getMarkers(widget.listaPostMarcadores!);
      setState(() {
        markers = listMarkers;
      });
    }
  }

  Future<String> _getUserPhotoUrl(DocumentReference userRef) async {
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

  Future<Uint8List> _createCustomMarkerIcon(String imageUrl) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final double size = 135;
    final double shadowOffset = 3.0; // Desplazamiento de la sombra

    // Dibuja un círculo sombra ligeramente más grande para simular la elevación
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.25); // Color de la sombra con opacidad
    canvas.drawCircle(
      Offset(size / 2, (size / 2) + shadowOffset), // Posición del círculo con desplazamiento en Y
      size / 2, // Radio del círculo sombra
      shadowPaint,
    );

    // Dibuja un círculo blanco en el centro (con la elevación simulada)
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255);
    canvas.drawCircle(
      Offset(size / 2, size / 2), // Centro del círculo principal
      size / 2, // Radio del círculo principal
      paint,
    );

    // Cargar la imagen desde la URL
    final ui.Image image = await _loadImage(imageUrl);
    final double imageSize = size * 0.8; // Tamaño de la imagen
    final double imageX = (size - imageSize) / 2; // Coordenada X de la imagen
    final double imageY = (size - imageSize) / 2; // Coordenada Y de la imagen
    final Rect rect = Rect.fromLTWH(imageX, imageY, imageSize, imageSize);
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(imageSize / 2));
    canvas.clipRRect(rrect);

    // Dibujar la imagen en el centro del círculo
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      rect,
      Paint(),
    );

    // Convertir el lienzo a imagen
    final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(size.toInt(), size.toInt() + shadowOffset.toInt());
    final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<ui.Image> _loadImage(String url) async {
    final completer = Completer<ui.Image>();
    final imageStream = NetworkImage(url).resolve(ImageConfiguration.empty);
    imageStream.addListener(
      ImageStreamListener((ImageInfo info, bool _) => completer.complete(info.image)),
    );
    return completer.future;
  }

  Future<Set<gmap.Marker>> getMarkers(List<UserPostsRecord> lista) async {
    Set<gmap.Marker> markers = {};

    for (int i = 0; i < lista.length; i++) {
      final post = lista[i];

      try {
        if (post.postUser != null) {
          final photoUrl = await _getUserPhotoUrl(post.postUser!);
          if (photoUrl.isNotEmpty && post.placeInfo.latLng != null) {
            final markerIcon = await _createCustomMarkerIcon(photoUrl);
            if (markerIcon.isNotEmpty) {
              gmap.Marker marker = gmap.Marker(
                markerId: gmap.MarkerId(post.reference.id),
                position: gmap.LatLng(
                  post.placeInfo.latLng!.latitude,
                  post.placeInfo.latLng!.longitude,
                ),
                icon: gmap.BitmapDescriptor.fromBytes(markerIcon),
                onTap: () {
                  onMarkerTap(post);
                },
              );

              markers.add(marker);
            }
          }
        }
      } catch (e) {
        debugPrint('getMarkers Error: $e');
      }
    }
    return markers;
  }

  void _hideInfoContainer() {
    setState(() {
      _isInfoVisible = false;
    });
  }

  void _toggleMovableMarker() {
    setState(() {
      _isMovableMarkerVisible = !_isMovableMarkerVisible;
      if (_isMovableMarkerVisible) {
        _movableMarker = gmap.Marker(
          markerId: gmap.MarkerId('movable_marker'),
          position: initialCameraPosition.target,
          draggable: true,
          onDragEnd: (newPosition) {
            setState(() {
              _selectedMarkerPosition = newPosition;
            });
          },
          onTap: () {
            _showMovableMarkerInfo();
          },
          icon: gmap.BitmapDescriptor.defaultMarkerWithHue(
            gmap.BitmapDescriptor.hueBlue,
          ),
        );
      } else {
        _movableMarker = null;
      }
    });
  }

  void _showMovableMarkerInfo() {
    if (_selectedMarkerPosition != null) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.white),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ubicación Actual',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Latitud: ${_selectedMarkerPosition!.latitude}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Longitud: ${_selectedMarkerPosition!.longitude}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final flutterFlowLatLng = ff.LatLng(
                        _selectedMarkerPosition!.latitude,
                        _selectedMarkerPosition!.longitude,
                      );
                      widget.navigateTo(flutterFlowLatLng);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Crear Spot',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
      );
    }
  }

  void _toggleSearchBar() {
    setState(() {
      _isContainerExpanded = !_isContainerExpanded;
    });
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _searchResults.clear();
      });
      return;
    }

    final results = widget.listaPostMarcadores!.where((post) {
      final postTitle = post.postTitle?.toLowerCase() ?? '';
      final postDescription = post.postDescription?.toLowerCase() ?? '';
      final placeInfoCity = post.placeInfo.city?.toLowerCase() ?? '';
      return postTitle.contains(query) || placeInfoCity.contains(query);
    }).toList();

    setState(() {
      _searchResults = results.where((element) => element != null).toList();
    });

    if (_searchResults.isNotEmpty) {
      final firstMatch = _searchResults.first;
      _moveCameraToPost(firstMatch);
    }
  }

  void _moveCameraToPost(UserPostsRecord post) async {
    final controller = await _controller.future;
    final position = gmap.LatLng(
      post.placeInfo.latLng!.latitude,
      post.placeInfo.latLng!.longitude,
    );

    controller.animateCamera(
      gmap.CameraUpdate.newCameraPosition(
        gmap.CameraPosition(target: position, zoom: 16.0),
      ),
    );
  }

  void _handleMarkerTap() {
    if (_selectedPostUser != null && widget.usuarioAutenticado != null) {
      if (_selectedPostUser == widget.usuarioAutenticado) {
        Navigator.pushNamed(context, 'perfilPropio');
      } else {
        Navigator.pushNamed(context, 'otroPerfil');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildGoogleMap(),
        buildLocationIcon(),
        if (_searchResults.isEmpty && searchController.text.isNotEmpty) buildEmptyResult(),
        if (_isInfoVisible && _selectedMarkerPosition != null) buildCardInfo(context),
      ],
    );
  }

  gmap.GoogleMap buildGoogleMap() {
    return gmap.GoogleMap(
      initialCameraPosition: initialCameraPosition,
      markers: _movableMarker != null ? {...markers, _movableMarker!} : markers,
      onTap: (lat) {
        widget.onMapTap();
      },
      onMapCreated: (gmap.GoogleMapController controller) {
        _controller.complete(controller);
        controller.setMapStyle(_mapStyle);
      },
      onCameraMove: (gmap.CameraPosition position) {
        if (position.zoom != currentZoom && (position.zoom - currentZoom).abs() >= 1) {
          currentZoom = position.zoom;
          loadMarkers();
        }
      },
    );
  }

  void onMarkerTap(UserPostsRecord post) {
    widget.onMarkerTap(post);
    setState(() {
      _isInfoVisible = true;
      _selectedTitle = post.postTitle ?? '';
      _selectedSubtitle = post.postDescription ?? '';
      _selectedImageUrl = post.postPhotolist.isNotEmpty ? post.postPhotolist.first : '';
      _selectedMarkerPosition = gmap.LatLng(
        post.placeInfo.latLng!.latitude,
        post.placeInfo.latLng!.longitude,
      );
      _selectedPostUser = post.postUser;
    });
  }

  Positioned buildCardInfo(BuildContext context) {
    return Positioned(
      top: MediaQuery
          .of(context)
          .size
          .height * 0.5 - 100,
      left: MediaQuery
          .of(context)
          .size
          .width * 0.25,
      child: GestureDetector(
        onTap: _hideInfoContainer, // Ocultar container al tocarlo
        onDoubleTap: _handleMarkerTap,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.45,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_selectedImageUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _selectedImageUrl,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 10),
              Text(
                _selectedTitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
                _selectedSubtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 33, 32, 32),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildEmptyResult() {
    return Positioned(
      top: 216,
      right: 16,
      child: Container(
        width: 350,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          'No existe ningún resultado!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Positioned buildLocationIcon() {
    return Positioned(
      top: 166,
      right: 16,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isContainerExpanded ? 350 : 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isContainerExpanded)
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  _toggleSearchBar();
                  searchController.clear();
                },
              ),
            if (_isContainerExpanded)
              Expanded(
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.white),
                  onChanged: (text) {
                    setState(() {
                      _onSearchChanged();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
            IconButton(
              icon: Icon(
                Icons.location_on,
                color: Colors.white,
                size: 24,
              ),
              onPressed: _toggleSearchBar,
            ),
          ],
        ),
      ),
    );
  }
}
