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

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:label_marker/label_marker.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '/flutter_flow/lat_lng.dart' as ff; // Importamos LatLng de FlutterFlow

class MapaPersonalizado3 extends StatefulWidget {
  const MapaPersonalizado3({
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
  final List<UserPostsRecord>? listaPostMarcadores;
  final void Function(DocumentReference bycreate) navigateTo;
  final DocumentReference? usuarioAutenticado;

  @override
  _MapaPersonalizado3State createState() => _MapaPersonalizado3State();
}

class _MapaPersonalizado3State extends State<MapaPersonalizado3> {
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
  List<UserPostsRecord> _searchResults = [];

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
            "visibility": "off"
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
            "visibility": "off"
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
            "visibility": "off"
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
    final double size = 135.0;
    final double borderWidth = 2.0;
    final double padding = 3.0;

    // Dibuja el círculo verde con borde negro
    Paint borderPaint = Paint()
      ..color = Color(0xFF1A1A1A) // Color del borde negro
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    Paint circlePaint = Paint()..color = Color(0xFFF4F176); // Color verde

    // Dibuja el círculo
    canvas.drawCircle(
      Offset(size / 2, size / 2),
      size / 2 - borderWidth / 2, // Ajusta el radio para incluir el borde
      circlePaint,
    );

    // Dibuja el borde
    canvas.drawCircle(
      Offset(size / 2, size / 2),
      size / 2 - borderWidth / 2,
      borderPaint,
    );

    // Cargar la imagen desde la URL
    final ui.Image image = await _loadImage(imageUrl);
    final double imageSize = size - 2 * (borderWidth + padding);

    final double imageX = (size - imageSize) / 2;
    final double imageY = (size - imageSize) / 2;

    final Rect rect = Rect.fromLTWH(imageX, imageY, imageSize, imageSize);
    final RRect rrect =
        RRect.fromRectAndRadius(rect, Radius.circular(imageSize / 2));
    canvas.clipRRect(rrect);

    // Dibuja la imagen dentro del círculo
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      rect,
      Paint(),
    );

    // Convertir el lienzo a imagen
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<ui.Image> _loadImage(String url) async {
    final completer = Completer<ui.Image>();
    final imageStream = NetworkImage(url).resolve(ImageConfiguration.empty);
    imageStream.addListener(
      ImageStreamListener(
          (ImageInfo info, bool _) => completer.complete(info.image)),
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
          if (photoUrl.isNotEmpty && post.placeInfo.localizacion != null) {
            final markerIcon = await _createCustomMarkerIcon(photoUrl);
            if (markerIcon.isNotEmpty) {
              gmap.Marker marker = gmap.Marker(
                markerId: gmap.MarkerId(post.reference.id),
                position: gmap.LatLng(
                  post.placeInfo.localizacion!.latitude,
                  post.placeInfo.localizacion!.longitude,
                ),
                icon: gmap.BitmapDescriptor.fromBytes(markerIcon),
                onTap: () {
                  setState(() {
                    _isInfoVisible = true;
                    _selectedTitle = post.postTitle ?? '';
                    _selectedSubtitle = post.postDescription ?? '';
                    _selectedImageUrl = post.postPhotolist.isNotEmpty
                        ? post.postPhotolist.first
                        : '';
                    _selectedMarkerPosition = gmap.LatLng(
                      post.placeInfo.localizacion!.latitude,
                      post.placeInfo.localizacion!.longitude,
                    );
                    _selectedPostUser = post.postUser;
                  });
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
      post.placeInfo.localizacion!.latitude,
      post.placeInfo.localizacion!.longitude,
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
        GestureDetector(
          onTap: _hideInfoContainer,
          onDoubleTap: _handleMarkerTap,
          child: Container(
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
        ),
        // Positioned(
        // top: 166,
        //right: 16,
        //child: AnimatedContainer(
        //duration: Duration(milliseconds: 300),
        //width: _isContainerExpanded ? 350 : 50,
        //height: 50,
        //decoration: BoxDecoration(
        //color: Colors.black,
        //borderRadius: BorderRadius.circular(25),
        //boxShadow: [
        //BoxShadow(
        //color: Colors.black26,
        //blurRadius: 10,
        //offset: Offset(0, 4),
        //),
        //],
        //),
        //child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        //children: [
        //if (_isContainerExpanded)
        //IconButton(
        //icon: Icon(
        //Icons.close,
        //color: Colors.white,
        //size: 24,
        //),
        //onPressed: () {
        //_toggleSearchBar();
        //searchController.clear();
        //},
        //),
        //if (_isContainerExpanded)
        //Expanded(
        //child: TextField(
        //controller: searchController,
        //style: TextStyle(color: Colors.white),
        //onChanged: (text) {
        //setState(() {
        //  //_onSearchChanged();
        //});
        //},
        //decoration: InputDecoration(
        //hintText: 'Buscar...',
        //hintStyle: TextStyle(color: Colors.white54),
        // border: InputBorder.none,
        // contentPadding: EdgeInsets.symmetric(horizontal: 20),
        //),
        //),
        //),
        //IconButton(
        //icon: Icon(
        //Icons.location_on,
        //color: Colors.white,
        //size: 24,
        //),
        //onPressed: _toggleSearchBar,
        //),
        //],
        //),
        // ),
        //),
        //if (_searchResults.isEmpty && searchController.text.isNotEmpty)
        //Positioned(
        //top: 216,
        ///right: 16,
        //child: Container(
        //width: 350,
        //padding: EdgeInsets.all(10),
        //decoration: BoxDecoration(
        //color: Colors.white,
        //borderRadius: BorderRadius.circular(10),
        //boxShadow: [
        //BoxShadow(
        //color: Colors.black26,
        //blurRadius: 10,
        //offset: Offset(0, 4),
        //),
        //],
        //),
        //child: Text(
        //'No existe ningún resultado!',
        //style: TextStyle(
        //color: Colors.black,
        //fontSize: 16,
        //),
        //),
        //),
        //),
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
                  color: Colors.black, // Fondo negro como en la imagen
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
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
                        //Positioned(
                        //top: 10,
                        //right: 10,
                        //child: Container(
                        //decoration: BoxDecoration(
                        //color:
                        //  Colors.black.withOpacity(0.8), // Fondo oscuro
                        //shape: BoxShape.circle,
                        //border: Border.all(
                        //color: Colors.yellow, // Borde amarillo
                        //width: 2,
                        //),
                        //),
                        //child: IconButton(
                        //icon: Icon(
                        //Icons.close,
                        //color: Colors.yellow, // Icono amarillo
                        //),
                        //onPressed: _hideInfoContainer,
                        //tooltip: 'Cerrar',
                        //),
                        //),
                        //),
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
                        color: Colors.white60,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_selectedPostUser != null) {
                            widget.navigateTo(_selectedPostUser!);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                        ),
                        child: Text(
                          'Ver Perfil',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
