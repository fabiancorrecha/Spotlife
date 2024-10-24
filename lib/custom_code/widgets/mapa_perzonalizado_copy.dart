// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Asegúrate de tener este import
import 'package:cloud_firestore/cloud_firestore.dart';

// Resto de tus imports

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '/flutter_flow/lat_lng.dart' as ff; // Importamos LatLng de FlutterFlow

class MapaPerzonalizadoCopy extends StatefulWidget {
  const MapaPerzonalizadoCopy({
    Key? key,
    this.width,
    this.height,
    this.ubicacionInicialLat,
    this.ubicacionInicialLng,
    this.zoom,
    this.listaPostMarcadores,
    required this.navigateTo, // Argumento agregado
    required this.usuarioAutenticado,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? ubicacionInicialLat;
  final double? ubicacionInicialLng;
  final double? zoom;
  final List<DocumentReference>? listaPostMarcadores;
  final void Function(DocumentReference bycreate) navigateTo;
  final DocumentReference? usuarioAutenticado;

  @override
  _MapaPerzonalizadoCopyState createState() => _MapaPerzonalizadoCopyState();
}

class _MapaPerzonalizadoCopyState extends State<MapaPerzonalizadoCopy> {
  Set<gmap.Marker> markers = {};
  gmap.Marker? _movableMarker;
  late String _mapStyle;
  final Completer<gmap.GoogleMapController> _controller =
      Completer<gmap.GoogleMapController>();
  bool _isInfoVisible = false;
  bool _isMovableMarkerVisible = false;
  bool _isContainerExpanded = false;
  String _selectedTitle = '';
  String _selectedSubtitle = '';
  String _selectedImageUrl = '';
  gmap.LatLng? _selectedMarkerPosition;
  DocumentReference? _selectedPostUser;
  final TextEditingController searchController = TextEditingController();
  List<DocumentReference> _searchResults = [];

  late gmap.CameraPosition initialCameraPosition;
  double currentZoom = 15.0;

  @override
  void initState() {
    super.initState();
    currentZoom = widget.zoom ?? currentZoom;
    _mapStyle = '''
    [
      {
        "featureType": "all",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "administrative",
        "elementType": "geometry",
        "stylers": [
          {
            "weight": "0.5"
          },
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "administrative",
        "elementType": "labels",
        "stylers": [
          {
            "visibility": "simplified"
          }
        ]
      },
      {
        "featureType": "administrative",
        "elementType": "labels.text",
        "stylers": [
          {
            "lightness": "-50"
          },
          {
            "saturation": "-50"
          }
        ]
      },
      {
        "featureType": "administrative.neighborhood",
        "elementType": "labels.text",
        "stylers": [
          {
            "hue": "#009aff"
          },
          {
            "saturation": "25"
          },
          {
            "lightness": "0"
          },
          {
            "visibility": "simplified"
          },
          {
            "gamma": "1"
          }
        ]
      },
      {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
          {
            "saturation": "0"
          },
          {
            "lightness": "100"
          },
          {
            "gamma": "2.31"
          },
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "landscape",
        "elementType": "labels",
        "stylers": [
          {
            "visibility": "simplified"
          },
          {
            "lightness": "20"
          },
          {
            "gamma": "1"
          }
        ]
      },
      {
        "featureType": "landscape",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "saturation": "-100"
          },
          {
            "lightness": "-100"
          }
        ]
      },
      {
        "featureType": "landscape",
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "landscape.man_made",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "simplified"
          }
        ]
      },
      {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
          {
            "lightness": "0"
          },
          {
            "saturation": "45"
          },
          {
            "gamma": "4.24"
          },
          {
            "visibility": "simplified"
          },
          {
            "hue": "#00ff90"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "labels",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
          {
            "saturation": "-100"
          },
          {
            "color": "#f5f5f5"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "labels.text",
        "stylers": [
          {
            "visibility": "simplified"
          },
          {
            "color": "#666666"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road.arterial",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "transit",
        "elementType": "labels.icon",
        "stylers": [
          {
            "saturation": "-25"
          }
        ]
      },
      {
        "featureType": "transit.line",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "simplified"
          }
        ]
      },
      {
        "featureType": "transit.station.airport",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "lightness": "50"
          },
          {
            "gamma": ".75"
          },
          {
            "saturation": "100"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "labels",
        "stylers": [
          {
            "visibility": "simplified"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }
    ]
    ''';

    double initialLat = widget.ubicacionInicialLat ?? 0.0;
    double initialLng = widget.ubicacionInicialLng ?? 0.0;
    initialCameraPosition = gmap.CameraPosition(
      target: gmap.LatLng(initialLat, initialLng),
      zoom: currentZoom,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadMarkers();
    });

    searchController.addListener(_onSearchChanged);
  }

  loadMarkers() async {
    if (widget.listaPostMarcadores != null &&
        widget.listaPostMarcadores!.isNotEmpty) {
      final listMarkers = await getMarkers(widget.listaPostMarcadores!);
      setState(() {
        markers = listMarkers;
      });

      // Mover la cámara al primer marcador si es necesario
      if (markers.isNotEmpty) {
        final firstMarker = markers.first;
        final controller = await _controller.future;
        controller.animateCamera(
          gmap.CameraUpdate.newLatLng(firstMarker.position),
        );
      }
    }
  }

  Future<String> _getUserPhotoUrl(DocumentReference userRef) async {
    try {
      final userDoc = await userRef.get();
      if (userDoc.exists) {
        return userDoc.get('photo_url') ?? '';
      }
    } catch (e) {
      print('Error obteniendo la URL de la foto del usuario: $e');
    }
    return '';
  }

  Future<Uint8List> _createCustomMarkerIcon(String imageUrl) async {
    try {
      final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(pictureRecorder);
      final double size = 135.0;
      final double borderWidth = 2.0;
      final double padding = 3.0;

      Paint borderPaint = Paint()
        ..color = Color(0xFF1A1A1A)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth;

      Paint circlePaint = Paint()..color = Color(0xFFF4F176);

      canvas.drawCircle(
        Offset(size / 2, size / 2),
        size / 2 - borderWidth / 2,
        circlePaint,
      );

      canvas.drawCircle(
        Offset(size / 2, size / 2),
        size / 2 - borderWidth / 2,
        borderPaint,
      );

      final ui.Image image = await _loadImage(imageUrl);
      final double imageSize = size - 2 * (borderWidth + padding);

      final double imageX = (size - imageSize) / 2;
      final double imageY = (size - imageSize) / 2;

      final Rect rect = Rect.fromLTWH(imageX, imageY, imageSize, imageSize);
      final RRect rrect =
          RRect.fromRectAndRadius(rect, Radius.circular(imageSize / 2));
      canvas.clipRRect(rrect);

      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        rect,
        Paint(),
      );

      final ui.Image markerAsImage = await pictureRecorder
          .endRecording()
          .toImage(size.toInt(), size.toInt());
      final ByteData? byteData =
          await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      print('Error creando el icono del marcador: $e');
      return Uint8List(0);
    }
  }

  Future<ui.Image> _loadImage(String url) async {
    final completer = Completer<ui.Image>();
    final imageStream =
        NetworkImage(url).resolve(ImageConfiguration(devicePixelRatio: 2.0));
    imageStream.addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) => completer.complete(info.image),
        onError: (dynamic error, StackTrace? stackTrace) {
          completer.completeError(error, stackTrace);
        },
      ),
    );
    return completer.future;
  }

  Future<Set<gmap.Marker>> getMarkers(List<DocumentReference> lista) async {
    Set<gmap.Marker> markers = {};

    for (int i = 0; i < lista.length; i++) {
      final postRef = lista[i];

      try {
        final postSnapshot = await postRef.get();
        if (postSnapshot.exists) {
          final postData = postSnapshot.data() as Map<String, dynamic>?;

          if (postData != null && postData['postUser'] != null) {
            final postUserRef = postData['postUser'] as DocumentReference;
            final photoUrl = await _getUserPhotoUrl(postUserRef);

            if (photoUrl.isNotEmpty &&
                postData['placeInfo'] != null &&
                postData['placeInfo']['latLng'] != null) {
              var latLngData = postData['placeInfo']['latLng'];
              double latitude;
              double longitude;

              if (latLngData is GeoPoint) {
                latitude = latLngData.latitude;
                longitude = latLngData.longitude;
              } else if (latLngData is Map<String, dynamic>) {
                latitude = latLngData['latitude'] as double;
                longitude = latLngData['longitude'] as double;
              } else if (latLngData is ff.LatLng) {
                latitude = latLngData.latitude;
                longitude = latLngData.longitude;
              } else {
                print(
                    'Tipo de latLngData no soportado: ${latLngData.runtimeType}');
                continue;
              }

              final markerIcon = await _createCustomMarkerIcon(photoUrl);
              if (markerIcon.isNotEmpty) {
                gmap.Marker marker = gmap.Marker(
                  markerId: gmap.MarkerId(postRef.id),
                  position: gmap.LatLng(latitude, longitude),
                  icon: gmap.BitmapDescriptor.fromBytes(markerIcon),
                  onTap: () {
                    setState(() {
                      _isInfoVisible = true;
                      _selectedTitle = postData['postTitle'] ?? '';
                      _selectedSubtitle = postData['postDescription'] ?? '';
                      final postPhotolist =
                          postData['postPhotolist'] as List<dynamic>?;
                      if (postPhotolist != null && postPhotolist.isNotEmpty) {
                        _selectedImageUrl = postPhotolist.first as String;
                      } else {
                        _selectedImageUrl = '';
                      }
                      _selectedMarkerPosition =
                          gmap.LatLng(latitude, longitude);
                      _selectedPostUser = postUserRef;
                    });
                  },
                );

                markers.add(marker);
              }
            }
          }
        }
      } catch (e) {
        debugPrint('Error en getMarkers: $e');
      }
    }
    return markers;
  }

  void _hideInfoContainer() {
    setState(() {
      _isInfoVisible = false;
    });
  }

  void _toggleSearchBar() {
    setState(() {
      _isContainerExpanded = !_isContainerExpanded;
    });
  }

  void _onSearchChanged() async {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _searchResults.clear();
      });
      return;
    }

    List<DocumentReference> results = [];
    for (var post in widget.listaPostMarcadores!) {
      final postSnapshot = await post.get();
      if (postSnapshot.exists) {
        final postData = postSnapshot.data() as Map<String, dynamic>?;
        if (postData != null) {
          final postTitle = postData['postTitle']?.toLowerCase() ?? '';
          final placeInfoCity =
              postData['placeInfo']?['city']?.toLowerCase() ?? '';
          if (postTitle.contains(query) || placeInfoCity.contains(query)) {
            results.add(post);
          }
        }
      }
    }

    setState(() {
      _searchResults = results;
    });

    if (_searchResults.isNotEmpty) {
      final firstMatch = _searchResults.first;
      _moveCameraToPost(firstMatch);
    }
  }

  void _moveCameraToPost(DocumentReference post) async {
    final postSnapshot = await post.get();
    if (postSnapshot.exists) {
      final postData = postSnapshot.data() as Map<String, dynamic>?;
      if (postData != null &&
          postData['placeInfo'] != null &&
          postData['placeInfo']['latLng'] != null) {
        var latLngData = postData['placeInfo']['latLng'];
        double latitude;
        double longitude;

        if (latLngData is GeoPoint) {
          latitude = latLngData.latitude;
          longitude = latLngData.longitude;
        } else if (latLngData is Map<String, dynamic>) {
          latitude = latLngData['latitude'] as double;
          longitude = latLngData['longitude'] as double;
        } else if (latLngData is ff.LatLng) {
          latitude = latLngData.latitude;
          longitude = latLngData.longitude;
        } else {
          print('Tipo de latLngData no soportado: ${latLngData.runtimeType}');
          return;
        }

        final position = gmap.LatLng(latitude, longitude);

        final controller = await _controller.future;
        controller.animateCamera(
          gmap.CameraUpdate.newCameraPosition(
            gmap.CameraPosition(target: position, zoom: 16.0),
          ),
        );
      }
    }
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
        // Eliminamos el GestureDetector que envolvía el GoogleMap
        Container(
          width: widget.width,
          height: widget.height,
          child: gmap.GoogleMap(
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (gmap.GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
            onCameraMove: (gmap.CameraPosition position) {
              if (position.zoom != currentZoom &&
                  (position.zoom - currentZoom).abs() >= 1) {
                currentZoom = position.zoom;
                loadMarkers();
              }
            },
            markers: _movableMarker != null
                ? {...markers, _movableMarker!}
                : markers,
          ),
        ),
        // Resto de tus widgets superpuestos
        Positioned(
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
        ),
        if (_searchResults.isEmpty && searchController.text.isNotEmpty)
          Positioned(
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
                '¡No existe ningún resultado!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        if (_isInfoVisible && _selectedMarkerPosition != null)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 100,
            left: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
              onTap: _hideInfoContainer,
              onDoubleTap: _handleMarkerTap,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
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
                    Stack(
                      children: [
                        if (_selectedImageUrl.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              _selectedImageUrl,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      _selectedTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      _selectedSubtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
