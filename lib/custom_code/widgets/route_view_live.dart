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

import 'dart:convert';
import 'dart:math' show cos, sqrt, asin;
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class TransitOption {
  final String vehicleType;
  final String lineName;
  final String departureStop;
  final String arrivalStop;

  TransitOption({
    required this.vehicleType,
    required this.lineName,
    required this.departureStop,
    required this.arrivalStop,
  });
}

class RouteViewLive extends StatefulWidget {
  const RouteViewLive({
    Key? key,
    this.width,
    this.height,
    required this.startCoordinate,
    required this.endCoordinate,
    this.lineColor = Colors.black,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    this.startAddress,
    this.destinationAddress,
    required this.userImage,
    required this.actualizarDatos, // Nuevo argumento
  }) : super(key: key);

  final double? height;
  final double? width;
  final LatLng startCoordinate;
  final LatLng endCoordinate;
  final Color lineColor;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final String? startAddress;
  final String? destinationAddress;
  final String userImage;
  final void Function(String time, String distance)
      actualizarDatos; // Función de callback

  @override
  _RouteViewLiveState createState() => _RouteViewLiveState();
}

class _RouteViewLiveState extends State<RouteViewLive> {
  late final CameraPosition _initialLocation;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> initialPolylines = {};
  List<latlng.LatLng> polylineCoordinates = [];
  StreamSubscription<LocationData>? locationSubscription;
  Location location = Location();
  int currentPointIndex = 0;
  String _mapStyle = '''
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
  // Variables para distancia y tiempo
  String routeDuration = "";
  String routeDistance = "";
  TravelMode selectedTravelMode = TravelMode.walking;

  @override
  void initState() {
    super.initState();
    _initialLocation = CameraPosition(
      target: latlng.LatLng(
        widget.startCoordinate.latitude,
        widget.startCoordinate.longitude,
      ),
      zoom: 16,
    );
    initPolylines();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }

  Future<void> _startLocationUpdates() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      _onLocationUpdate(currentLocation);
    });
  }

  void _onLocationUpdate(LocationData currentLocation) {
    final currentLatLng = latlng.LatLng(
      currentLocation.latitude!,
      currentLocation.longitude!,
    );

    setState(() {
      while (currentPointIndex < polylineCoordinates.length - 1 &&
          _coordinateDistance(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  polylineCoordinates[currentPointIndex].latitude,
                  polylineCoordinates[currentPointIndex].longitude) <
              0.01) {
        currentPointIndex++;
      }

      initialPolylines[PolylineId('poly')] = Polyline(
        polylineId: PolylineId('poly'),
        color: widget.lineColor,
        points: polylineCoordinates.sublist(currentPointIndex),
        width: 8,
      );
    });

    // Actualizar tiempo y distancia restantes
    final remainingDistance = _calculateRemainingDistance(currentLatLng);
    final updatedDuration = _calculateRemainingDuration(remainingDistance);

    setState(() {
      routeDistance = "${remainingDistance.toStringAsFixed(2)} km";
      routeDuration = updatedDuration;
    });

    // Llamada a la acción actualizarDatos para pasar tiempo y distancia
    widget.actualizarDatos(routeDuration, routeDistance);

    // Recalculo de ruta si es necesario
    if (_isOffRoute(currentLatLng)) {
      initPolylines();
    }
  }

  double _calculateRemainingDistance(latlng.LatLng currentLatLng) {
    double totalDistance = 0.0;
    for (int i = currentPointIndex; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    return totalDistance;
  }

  String _calculateRemainingDuration(double remainingDistance) {
    double speed = 0; // velocidad en km/h
    switch (selectedTravelMode) {
      case TravelMode.walking:
        speed = 5.0; // 5 km/h caminando
        break;
      case TravelMode.driving:
        speed = 50.0; // 50 km/h conduciendo
        break;
      case TravelMode.transit:
        speed = 30.0; // 30 km/h en transporte público
        break;
      default:
        speed = 5.0;
    }

    final duration = remainingDistance / speed;
    final minutes = (duration * 60).round();
    return "$minutes min";
  }

  bool _isOffRoute(latlng.LatLng currentLatLng) {
    final lastPoint = polylineCoordinates[currentPointIndex];
    final distanceFromRoute = _coordinateDistance(
      currentLatLng.latitude,
      currentLatLng.longitude,
      lastPoint.latitude,
      lastPoint.longitude,
    );
    return distanceFromRoute > 0.05;
  }

  Future<Map<PolylineId, Polyline>?> _calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double destinationLatitude,
    required double destinationLongitude,
    TravelMode travelMode = TravelMode.walking,
  }) async {
    if (markers.isNotEmpty) markers.clear();

    try {
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      final Uint8List customIcon =
          await _createCustomMarkerIcon(widget.userImage);

      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: latlng.LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: widget.destinationAddress ?? '',
        ),
        icon: BitmapDescriptor.fromBytes(customIcon),
      );

      markers.add(destinationMarker);

      final result = await _createPolylines(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
        travelMode,
      );

      polylineCoordinates = result[1];

      setState(() {
        initialPolylines = result[0];
      });

      return result[0];
    } catch (e) {
      debugPrint('Error calculating distance: ${e.toString()}');
    }
    return null;
  }

  double _coordinateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<List<dynamic>> _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
    TravelMode travelMode,
  ) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      widget.androidGoogleMapsApiKey,
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: travelMode,
    );

    List<latlng.LatLng> polylineCoordinates = [];

    if (result.status == 'OK' && result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(latlng.LatLng(point.latitude, point.longitude));
      });
    } else {
      polylineCoordinates.add(latlng.LatLng(startLatitude, startLongitude));
      polylineCoordinates
          .add(latlng.LatLng(destinationLatitude, destinationLongitude));
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: widget.lineColor,
      points: polylineCoordinates,
      width: 8,
    );

    return [
      {id: polyline},
      polylineCoordinates,
    ];
  }

  Future<Uint8List> _createCustomMarkerIcon(String imageUrl) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final double size = 135;
    final double margin = 5.0;

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.25)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3);
    Path shadowPath = Path()
      ..moveTo(size / 2, margin + 4 + 3)
      ..arcToPoint(Offset(size / 2, size * 0.2 + 4 + 3),
          radius: Radius.circular(20), clockwise: false)
      ..quadraticBezierTo(size, size / 2 + 3, size / 2, size * 1.3 + 3)
      ..quadraticBezierTo(0, size / 2 + 3, size / 2, size * 0.2 + 4 + 3)
      ..close();
    canvas.drawPath(shadowPath, shadowPaint);

    Paint paint = Paint()..color = const Color.fromARGB(255, 16, 16, 16);
    Path path = Path()
      ..moveTo(size / 2, margin + 4)
      ..arcToPoint(Offset(size / 2, size * 0.2 + 4),
          radius: Radius.circular(50), clockwise: false)
      ..quadraticBezierTo(size, size / 2, size / 2, size * 1.3)
      ..quadraticBezierTo(0, size / 2, size / 2, size * 0.2 + 4)
      ..close();
    canvas.drawPath(path, paint);

    final ui.Image image = await _loadImage(imageUrl);
    final double imageSize = (size * 0.6 * 0.85) - margin * 2;
    final double imageX = (size - imageSize) / 2;
    final double imageY = (size * 1.3 - imageSize) / 2;
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
        .toImage(size.toInt(), (size * 1.3).toInt());
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

  void _updateRouteDuration(TravelMode travelMode) async {
    final startLatitude = widget.startCoordinate.latitude;
    final startLongitude = widget.startCoordinate.longitude;
    final destinationLatitude = widget.endCoordinate.latitude;
    final destinationLongitude = widget.endCoordinate.longitude;

    var url = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?'
      'origin=$startLatitude,$startLongitude'
      '&destination=$destinationLatitude,$destinationLongitude'
      '&mode=${travelMode.toString().split('.').last}'
      '&key=${widget.androidGoogleMapsApiKey}',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> routes = jsonResponse['routes'];
      if (routes.isNotEmpty) {
        List<dynamic> legs = routes[0]['legs'];
        if (legs.isNotEmpty) {
          final durationText = legs[0]['duration']['text'];
          final distanceText = legs[0]['distance']['text'];

          setState(() {
            routeDuration = durationText;
            routeDistance = distanceText;
          });

          // Actualizar datos mediante la acción
          widget.actualizarDatos(routeDuration, routeDistance);

          if (travelMode == TravelMode.transit) {
            List<dynamic> steps = legs[0]['steps'];
            List<TransitOption> transitOptions = [];

            for (var step in steps) {
              if (step['travel_mode'] == 'TRANSIT') {
                var transitDetails = step['transit_details'];
                var line = transitDetails['line'];
                var departureStop = transitDetails['departure_stop']['name'];
                var arrivalStop = transitDetails['arrival_stop']['name'];
                var vehicleType = line['vehicle']['type'];
                var lineName = line['short_name'] ?? line['name'];

                transitOptions.add(TransitOption(
                  vehicleType: vehicleType,
                  lineName: lineName,
                  departureStop: departureStop,
                  arrivalStop: arrivalStop,
                ));
              }
            }

            _showTransitOptions(transitOptions);
          }
        }
      }
    } else {
      debugPrint('Error en la API de Directions para transporte público');
    }
  }

  void _showTransitOptions(List<TransitOption> transitOptions) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: transitOptions.map((option) {
              return ListTile(
                leading: Icon(Icons.directions_transit),
                title: Text('${option.lineName} (${option.vehicleType})'),
                subtitle:
                    Text('De: ${option.departureStop} a ${option.arrivalStop}'),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          child: GoogleMap(
            markers: Set<Marker>.from(markers),
            initialCameraPosition: _initialLocation,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            polylines: Set<Polyline>.of(initialPolylines.values),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              controller.setMapStyle(_mapStyle);
              initPolylines();
            },
          ),
        ),
        Positioned(
          bottom: 40,
          right: 20,
          child: Column(
            children: [
              _buildCustomIconButton(Icons.directions_walk, TravelMode.walking),
              SizedBox(height: 15),
              _buildCustomIconButton(Icons.directions_car, TravelMode.driving),
              SizedBox(height: 15),
              _buildCustomIconButton(Icons.directions_bus, TravelMode.transit),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomIconButton(IconData icon, TravelMode travelMode) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: 40,
        height: 40,
        color: Colors.black,
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          iconSize: 20,
          onPressed: () {
            _updateRouteDuration(travelMode);
          },
        ),
      ),
    );
  }

  void initPolylines() async {
    await _calculateDistance(
      startLatitude: widget.startCoordinate.latitude,
      startLongitude: widget.startCoordinate.longitude,
      destinationLatitude: widget.endCoordinate.latitude,
      destinationLongitude: widget.endCoordinate.longitude,
      travelMode: TravelMode.driving,
    );
  }
}
