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

import 'dart:async';

import 'package:custom_marker/marker_icon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;

class MapaPerzonalizadoCopy extends StatefulWidget {
  const MapaPerzonalizadoCopy({
    Key? key,
    this.width,
    this.height,
    this.ubicacionInicialLat,
    this.ubicacionInicialLng,
    this.zoom,
    this.listaPostMarcadores,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double? ubicacionInicialLat;
  final double? ubicacionInicialLng;
  final double? zoom;
  final List<DocumentReference>? listaPostMarcadores;

  @override
  _MapaPerzonalizadoCopyState createState() => _MapaPerzonalizadoCopyState();
}

class _MapaPerzonalizadoCopyState extends State<MapaPerzonalizadoCopy> {
  Set<gmap.Marker> markers = {};
  late String _mapStyle;
  final Completer<gmap.GoogleMapController> _controller =
      Completer<gmap.GoogleMapController>();
  late gmap.CameraPosition initialCameraPosition;
  double currentZoom = 15.0;

  UsersRecord? currentUserRecord;

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
        "hue": "#009AFF"
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
        "hue": "#00FF90"
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
        "color": "#F5F5F5"
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
    double initialLat = widget.ubicacionInicialLat ?? 0.0; // Valor por defecto
    double initialLng = widget.ubicacionInicialLng ?? 0.0; // Valor por defecto
    initialCameraPosition = gmap.CameraPosition(
      target: gmap.LatLng(initialLat, initialLng),
      zoom: currentZoom,
    );
    try {
      loadMarkers();
    } catch (e) {
      print('Error al cargar los marcadores: $e');
    }
  }

  loadMarkers() async {
    if (widget.listaPostMarcadores != null) {
      final listMarkers = await getMarkert(widget.listaPostMarcadores!);
      setState(() {
        markers = listMarkers;
      });
    }
  }

  Future<gmap.BitmapDescriptor?> getMarketIcon(UserPostsRecord post) async {
    try {
      int size =
          (currentZoom * 8).toInt(); // current initial size 120 before was 80
      return await MarkerIcon.downloadResizePictureCircle(
        post.postPhotoUrl,
        size: size,
        addBorder: false,
        borderColor: Colors.white,
        borderSize: 15,
      );
    } catch (e) {
      debugPrint('getMarkert Error: $e');
      return null;
    }
  }

  Future<Set<gmap.Marker>> getMarkert(List<DocumentReference> lista) async {
    Set<gmap.Marker> markers = {};
    for (int i = 0; i < lista.length; i++) {
      final postDocRef = lista[i];
      final post = await UserPostsRecord.getDocumentOnce(postDocRef);
      try {
        if (post.postPhotoUrl.isNotEmpty && post.placeInfo.latLng != null) {
          //ignore marker if not have photo or latLng
          final markerIcon = (await getMarketIcon(post));
          if (markerIcon != null) {
            UsersRecord _user =
                await UsersRecord.getDocumentOnce(post.postUser!);
            gmap.Marker marker = gmap.Marker(
              markerId: gmap.MarkerId(post.reference.id),
              position: gmap.LatLng(
                post.placeInfo.latLng!.latitude,
                post.placeInfo.latLng!.longitude,
              ),
              icon: markerIcon,
            );
            markers.add(marker);
          }
        }
      } catch (e) {
        debugPrint('getMarkert Error: $e');
      }
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            loadMarkers(); // Regenerate markers with new size
          }
        },
        markers: markers,
      ),
    );
  }
}

extension PhotoUrlExtension on UserPostsRecord {
  String get postPhotoUrl {
    if (postPhoto.isNotEmpty) {
      return postPhoto;
    } else if (postPhotolist.isNotEmpty) {
      return postPhotolist.first;
    } else {
      return '';
    }
  }
}
