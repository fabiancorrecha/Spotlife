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
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui';

class CarrouselMap extends StatefulWidget {
  const CarrouselMap({
    Key? key,
    required this.userLocation,
    this.zoom = 16.0,
    this.selectedSpot,
    required this.spots,
    required this.onMapTap,
    required this.onMarkerTap, // Argumento agregado
    required this.navigateTo, // Argumento agregado
  }) : super(key: key);

  final LatLng userLocation;
  final SpotDetail? selectedSpot;
  final double zoom;
  final List<SpotDetail> spots;
  final void Function(SpotDetail post) onMarkerTap;
  final void Function() onMapTap;
  final void Function(ff.LatLng ubication) navigateTo;

  @override
  _CarrouselMapState createState() => _CarrouselMapState();
}

class _CarrouselMapState extends State<CarrouselMap> {
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
  final TextEditingController searchController = TextEditingController();
  List<SpotDetail> _searchResults = [];

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

    searchController.addListener(_onSearchChanged);
  }

  @override
  void didUpdateWidget(CarrouselMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.spots.isNotEmpty && widget.spots != oldWidget.spots) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loadMarkers(widget.selectedSpot, oldWidget.selectedSpot);
      });
    }

    var currentLocation = widget.selectedSpot;
    if (currentLocation != null && currentLocation != oldWidget.selectedSpot) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _moveCameraToPost(currentLocation, currentZoom);
      });
    }
  }

  void loadMarkers(SpotDetail? selected, SpotDetail? oldSelected) async {
    try {
      if (markers.isEmpty) {
        final listMarkers = await getMarkers(widget.spots);
        setState(() {
          markers = listMarkers;
        });
      } else {
        updateSelectedMarker(selected, oldSelected);
      }
    } catch (e) {
      print('Error al cargar los marcadores: $e');
    }
  }

  void updateSelectedMarker(SpotDetail? selectedSpot, SpotDetail? oldSelectedSpot) async {
    if (selectedSpot?.id != oldSelectedSpot?.id) {
      final updatedMarkers = await Future.wait(markers.map((gmap.Marker marker) async {
        var isCurrentSelected = marker.markerId.value == selectedSpot?.id;
        var wasOldSelected = marker.markerId.value == oldSelectedSpot?.id;
        var markerIcon = marker.icon;

        if (isCurrentSelected) {
          markerIcon =
              await CustomMarker(imageUrl: selectedSpot?.imagePath ?? "", isActive: true, isUser: selectedSpot?.isLoggedUser ?? false)
                  .toBitmapDescriptor(
            waitToRender: Duration(milliseconds: 100),
          );
        }

        if (wasOldSelected) {
          markerIcon = await CustomMarker(
                  imageUrl: oldSelectedSpot?.imagePath ?? "", isActive: false, isUser: oldSelectedSpot?.isLoggedUser ?? false)
              .toBitmapDescriptor(
            waitToRender: Duration(milliseconds: 100),
          );
        }

        return marker.copyWith(iconParam: markerIcon);
      }));

      setState(() {
        markers = Set<gmap.Marker>.of(updatedMarkers);
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

  Future<Set<gmap.Marker>> getMarkers(List<SpotDetail> spots) async {
    Set<gmap.Marker> markers = {};

    for (int i = 0; i < spots.length; i++) {
      final spot = spots[i];
      try {
        final photoUrl = spot.imagePath;
        if (spot.location != null) {
          final location = spot.location;
          final markerIcon = await CustomMarker(
            imageUrl: photoUrl,
            isUser: spot.isLoggedUser,
          ).toBitmapDescriptor(
            waitToRender: Duration(milliseconds: 300),
          );
          gmap.Marker marker = gmap.Marker(
            markerId: gmap.MarkerId(spot.id),
            position: gmap.LatLng(location.latitude, location.longitude),
            icon: markerIcon,
            onTap: () {
              onMarkerTap(spot);
            },
          );

          markers.add(marker);
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
        builder: (context) => AlertDialog(
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

    final results = widget.spots.where((post) {
      final postTitle = post.title.toLowerCase() ?? '';
      final postDescription = post.description?.toLowerCase() ?? '';
      final placeInfoCity = post.city?.toLowerCase() ?? '';
      return postTitle.contains(query) || placeInfoCity.contains(query);
    }).toList();

    setState(() {
      _searchResults = results.where((element) => element != null).toList();
    });

    if (_searchResults.isNotEmpty) {
      final firstMatch = _searchResults.first;
      _moveCameraToPost(firstMatch, 16.0);
    }
  }

  void _moveCameraToPost(SpotDetail post, double zoom) async {
    final controller = await _controller.future;
    final position = gmap.LatLng(
      post.location.latitude,
      post.location.longitude,
    );

    controller.animateCamera(
      gmap.CameraUpdate.newCameraPosition(
        gmap.CameraPosition(target: position, zoom: zoom),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildGoogleMap(),
        buildLocationIcon(),
        if (_searchResults.isEmpty && searchController.text.isNotEmpty) buildEmptyResult(),
        //if (_isInfoVisible && _selectedMarkerPosition != null) buildCardInfo(context), //hide card
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
        }
      },
    );
  }

  void onMarkerTap(SpotDetail post) {
    widget.onMarkerTap(post);
    setState(() {
      _isInfoVisible = true;
      _selectedTitle = post.title ?? '';
      _selectedSubtitle = post.description ?? '';
      _selectedImageUrl = post.imagePath.isNotEmpty ? post.imagePath : '';
      _selectedMarkerPosition = gmap.LatLng(
        post.location.latitude,
        post.location.longitude,
      );
    });
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

class CustomMarker extends StatelessWidget {
  final String imageUrl;
  final bool isUser; // isLoggedUser
  final bool isActive;

  const CustomMarker({
    super.key,
    required this.imageUrl,
    this.isUser = true,
    this.isActive = false,
  });

  final defaultImage =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png';

  @override
  Widget build(BuildContext context) {
    double pixelRatio = window.devicePixelRatio;
    final size = (isActive ? 60 : 40.0) * pixelRatio;
    final cachedNetworkImage = CachedNetworkImage(
      imageUrl: imageUrl.isNotEmpty ? imageUrl : defaultImage,
      errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: defaultImage, fit: BoxFit.cover),
      fit: BoxFit.cover, // Adjust the fit as needed
    );
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isUser
            ? Border.all(
                color: Color(0xFF5c52e2),
                width: 3 * pixelRatio,
              )
            : null,
      ),
      child: ClipOval(child: cachedNetworkImage),
    );
  }
}
