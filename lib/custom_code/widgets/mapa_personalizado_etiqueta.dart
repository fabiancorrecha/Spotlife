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
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import '/flutter_flow/lat_lng.dart' as ff;

class MapaPersonalizadoEtiqueta extends StatefulWidget {
  const MapaPersonalizadoEtiqueta({
    Key? key,
    this.width,
    this.height,
    this.ubicacionInicialLat,
    this.ubicacionInicialLng,
    this.zoom,
    this.listaPostMarcadores,
    required this.navigateToWithProfile,
    required this.androidMapsKey,
    required this.iOSMapsKey,
    required this.webMapsKey,
    required this.addIcon,
    this.dissmid,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? ubicacionInicialLat;
  final double? ubicacionInicialLng;
  final double? zoom;
  final List<UserPostsRecord>? listaPostMarcadores;
  final void Function(ff.LatLng ubication, String street, String city)
      navigateToWithProfile;
  // Modificado
  final String? androidMapsKey;
  final String? iOSMapsKey;
  final String? webMapsKey;
  final Icon addIcon;
  final Future Function()? dissmid;

  @override
  _MapaPersonalizadoEtiquetaState createState() =>
      _MapaPersonalizadoEtiquetaState();
}

class _MapaPersonalizadoEtiquetaState extends State<MapaPersonalizadoEtiqueta> {
  Set<gmap.Marker> markers = {};
  gmap.Marker? _movableMarker;
  final Completer<gmap.GoogleMapController> _controller = Completer();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  late gmap.CameraPosition initialCameraPosition;

  gmap.LatLng? selectedLocation;
  String? selectedStreet;
  String? selectedCity;
  bool isSearching = false;
  bool showMore = false;
  bool noResultsFound = false;
  List<Map<String, dynamic>> searchResults = [];

  // Función de conversión integrada
  ff.LatLng convertToCustomLatLng(gmap.LatLng googleLatLng) {
    return ff.LatLng(googleLatLng.latitude, googleLatLng.longitude);
  }

  // Estilo del mapa...
  static const String _mapStyle = '''
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

  @override
  void initState() {
    super.initState();
    initialCameraPosition = gmap.CameraPosition(
      target: gmap.LatLng(
          widget.ubicacionInicialLat ?? 0.0, widget.ubicacionInicialLng ?? 0.0),
      zoom: widget.zoom ?? 15.0,
    );
    searchController.addListener(_onSearchChanged);
    searchFocusNode.addListener(() {
      setState(() {});
    });
    try {
      loadMarkers(); // Cargar los marcadores personalizados
    } catch (e) {
      print('Error al cargar los marcadores: $e');
    }
  }

  Future<Uint8List?> _createCustomMarkerFromUrl() async {
    try {
      // Descargar la imagen desde la URL proporcionada
      final response = await http.get(Uri.parse(
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/6fldnd6r99qs/spotlife_medio-ai-brush-removebg-ciarozkj_(1)_(1).png'));
      if (response.statusCode == 200) {
        final Uint8List imageData = response.bodyBytes;

        // Crear el marcador usando Canvas
        final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
        final Canvas canvas = Canvas(pictureRecorder);
        final double size = 335.0; // Tamaño del marcador

        // Dibujar la imagen
        final ui.Image image = await decodeImageFromList(imageData);
        canvas.drawImage(image, Offset.zero, Paint());

        // Crear la imagen final
        final ui.Image markerImage = await pictureRecorder
            .endRecording()
            .toImage(size.toInt(), size.toInt());
        final ByteData? byteDataResult =
            await markerImage.toByteData(format: ui.ImageByteFormat.png);

        return byteDataResult!.buffer.asUint8List();
      } else {
        print(
            "Error: No se pudo cargar la imagen desde la URL (Status Code: ${response.statusCode})");
        return null; // Retorna null si no se puede cargar la imagen
      }
    } catch (e) {
      print("Error al crear el marcador personalizado: $e");
      return null; // Retorna null si ocurre un error
    }
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() async {
    String query = searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        isSearching = true;
        noResultsFound = false;
      });
      String apiKey =
          widget.androidMapsKey ?? widget.iOSMapsKey ?? widget.webMapsKey ?? '';
      final response = await http.get(
        Uri.parse(
            'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;
        setState(() {
          searchResults = results.map((place) {
            return {
              'address': place['formatted_address'] ?? '',
              'location': place['geometry']['location'],
            };
          }).toList();
          noResultsFound = searchResults.isEmpty;
        });
      } else {
        print('Error en la solicitud de búsqueda');
      }
    } else {
      setState(() {
        isSearching = false;
        searchResults.clear();
        noResultsFound = false;
      });
    }
  }

  void _clearSearch() {
    setState(() {
      searchController.clear(); // Limpia el texto de la barra de búsqueda
      isSearching = false; // Desactiva el modo de búsqueda
      searchResults.clear(); // Limpia los resultados de búsqueda
      noResultsFound = false; // Resetea el estado de no resultados encontrados
      FocusManager.instance.primaryFocus
          ?.unfocus(); // Desactiva el foco de la barra de búsqueda
    });
  }

  void _selectLocation(Map<String, dynamic> place) async {
    final location = place['location'];
    final selectedLatLng = gmap.LatLng(location['lat'], location['lng']);
    final street = place['address'].split(',')[0]; // Calle
    final city = place['address'].split(',').skip(1).join(', '); // Ciudad

    // Crear el marcador personalizado desde la URL
    final Uint8List? customIcon = await _createCustomMarkerFromUrl();

    setState(() {
      selectedLocation = selectedLatLng; // Guarda la ubicación seleccionada
      selectedStreet = street; // Guarda la calle seleccionada
      selectedCity = city; // Guarda la ciudad seleccionada

      // Agregar el marcador personalizado o usar el marcador por defecto
      markers.add(gmap.Marker(
        markerId: gmap.MarkerId("selected_location"),
        position: selectedLatLng,
        icon: customIcon != null
            ? gmap.BitmapDescriptor.fromBytes(customIcon)
            : gmap.BitmapDescriptor.defaultMarker,
      ));
    });

    // Llamar a navigateToWithProfile con los datos seleccionados
    widget.navigateToWithProfile(
      convertToCustomLatLng(selectedLatLng), // Convertir a ff.LatLng
      street,
      city,
    );

    // Desactiva el foco y limpia la barra de búsqueda
    searchController.clear();
    searchFocusNode.unfocus();
    setState(() {
      isSearching = false;
    });
  }

  void _toggleMovableMarker() {
    setState(() {
      if (_movableMarker == null) {
        // Crear el marcador móvil
        _movableMarker = gmap.Marker(
          markerId: gmap.MarkerId('movable_marker'),
          position: initialCameraPosition.target,
          draggable: true, // Hacerlo arrastrable
          onDragEnd: (newPosition) async {
            // Actualizar la posición seleccionada
            setState(() {
              selectedLocation = newPosition;
            });

            // Llamar a la API de Google Maps para obtener la dirección
            final address = await _getAddressFromLatLng(newPosition);

            // Actualizar la calle y ciudad o usar valores por defecto
            setState(() {
              selectedStreet = address['street'] ?? "Lugar elegido";
              selectedCity = address['city'] ?? "Lugar elegido";
            });

            // Llamar a navigateToWithProfile si es necesario
            // widget.navigateToWithProfile(
            //   convertToCustomLatLng(newPosition), // Convertir a ff.LatLng
            // selectedStreet ?? "Lugar elegido",
            //   selectedCity ?? "Lugar elegido",
            // );

            print(
                "Coordenadas: ${newPosition.latitude}, ${newPosition.longitude}");
            print("Dirección: ${selectedStreet}, Ciudad: ${selectedCity}");
          },
          icon: gmap.BitmapDescriptor.defaultMarkerWithHue(
            gmap.BitmapDescriptor.hueBlue,
          ),
        );
      } else {
        // Eliminar el marcador móvil si ya está activo
        _movableMarker = null;
      }
    });
  }

  Future<Map<String, String>> _getAddressFromLatLng(
      gmap.LatLng position) async {
    final apiKey =
        widget.androidMapsKey ?? widget.iOSMapsKey ?? widget.webMapsKey ?? '';

    try {
      // Llamada a la API de Google Maps para geocodificación inversa
      final response = await http.get(
        Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['results'] != null && data['results'].isNotEmpty) {
          final result = data['results'][0];

          // Obtener la calle
          final street = result['address_components']?.firstWhere(
            (component) => component['types'].contains('route'),
            orElse: () => null,
          )?['long_name'];

          // Obtener la ciudad o provincia
          final city = result['address_components']?.firstWhere(
            (component) =>
                component['types'].contains('administrative_area_level_2'),
            orElse: () => null,
          )?['long_name'];

          return {
            'street': street ?? "Lugar elegido",
            'city': city ?? "Lugar elegido",
          };
        }
      }
    } catch (e) {
      print("Error al obtener dirección: $e");
    }

    // Retornar valores por defecto si no se pudo obtener información
    return {
      'street': "Lugar elegido",
      'city': "Lugar elegido",
    };
  }

  Future<void> loadMarkers() async {
    if (widget.listaPostMarcadores != null) {
      final listMarkers = await getMarkers(widget.listaPostMarcadores!);
      setState(() {
        markers = listMarkers;
      });
    }
  }

  Future<Set<gmap.Marker>> getMarkers(List<UserPostsRecord> lista) async {
    Set<gmap.Marker> customMarkers = {};

    for (var post in lista) {
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
                  setState(() {
                    // Muestra información del marcador
                  });
                },
              );
              customMarkers.add(marker);
            }
          }
        }
      } catch (e) {
        debugPrint('getMarkers Error: $e');
      }
    }
    return customMarkers;
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

    Paint borderPaint = Paint()
      ..color = Color(0xFF1A1A1A) // Color del borde negro
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    Paint circlePaint = Paint()..color = Color(0xFFF4F176); // Color verde

    canvas.drawCircle(
      Offset(size / 2, size / 2),
      size / 2 - borderWidth / 2, // Ajusta el radio para incluir el borde
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

//
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior
              .translucent, // Asegura que los toques sean detectados
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus(); // Desactiva el foco
            setState(() {
              isSearching = false;
            });
          },
          child: gmap.GoogleMap(
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
            markers: _movableMarker != null
                ? {...markers, _movableMarker!}
                : markers,
          ),
        ),
        if (isSearching)
          Container(
            color: Colors.black.withOpacity(0.5),
            width: widget.width,
            height: widget.height,
          ),
        _buildSearchBar(),
        if (!searchFocusNode.hasFocus) ...[
          _buildFloatingButton(),
          _buildEtiquetaButton(),
        ],
      ],
    );
  }

  ///

  Widget _buildSearchBar() {
    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Stack(
            children: [
              // IconButton para cerrar
              Positioned(
                left: 16,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  padding: EdgeInsets.only(
                      left: 16, right: 45), // Espaciado solicitado
                  onPressed: () {
                    if (widget.dissmid != null) {
                      widget
                          .dissmid!(); // Acción personalizada que recibe como argumento
                    }
                  },
                ),
              ),
              // Barra de búsqueda
              TextField(
                controller: searchController,
                focusNode: searchFocusNode, // Asignamos el FocusNode
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.black,
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  suffixIcon: (searchController.text.isNotEmpty ||
                          searchFocusNode.hasFocus)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.grey, // Fondo gris
                              shape: BoxShape.circle, // Forma circular
                            ),
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.clear,
                                    color: Colors.black, size: 14),
                                onPressed:
                                    _clearSearch, // Llama a la función modificada
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            ),
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (text) =>
                    setState(() => isSearching = text.isNotEmpty),
              ),
            ],
          ),
          if (isSearching) _buildSearchResults(),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    final double maxHeight = MediaQuery.of(context).size.height *
        0.6; // 60% de la altura de la pantalla

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxHeight:
            showMore ? maxHeight : 310, // Limitar la altura máxima dinámica
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: noResultsFound
          ? Center(
              child: Text(
                '¡Lo sentimos, no hemos encontrado tu dirección!',
                style: TextStyle(color: Colors.white),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Icon(Icons.location_on, color: Colors.white),
                      title: Text(
                        searchResults[index]['address'].split(',')[0],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        searchResults[index]['address']
                            .split(',')
                            .skip(1)
                            .join(', '),
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () => _selectLocation(searchResults[index]),
                    ),
                  ),
                ),
                if (searchResults.length > 3)
                  TextButton(
                    onPressed: () => setState(() => showMore = !showMore),
                    child: Text(
                      showMore ? 'Ver menos' : 'Ver más',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildFloatingButton() {
    return Positioned(
      bottom: 110,
      right: 20,
      child: FloatingActionButton(
        onPressed: _toggleMovableMarker,
        backgroundColor: Colors.black,
        child: widget.addIcon,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  Widget _buildEtiquetaButton() {
    return Positioned(
      bottom: 30,
      left: 50,
      right: 50,
      child: SizedBox(
        width: 200,
        height: 45,
        child: Container(
          decoration: BoxDecoration(
            color: selectedLocation != null
                ? Color(0xFFF4F176) // Amarillo si hay ubicación seleccionada
                : Colors.black, // Negro por defecto
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: selectedLocation != null
                ? () {
                    // Convertir gmap.LatLng a ff.LatLng antes de usarlo
                    final customLatLng =
                        convertToCustomLatLng(selectedLocation!);

                    widget.navigateToWithProfile(
                      convertToCustomLatLng(selectedLocation!),
                      selectedStreet ?? "Lugar elegido",
                      selectedCity ?? "Lugar elegido",
                    );
                    // Usar customLatLng si se requiere más adelante
                    print(
                        "Ubicación convertida: ${customLatLng.latitude}, ${customLatLng.longitude}");
                  }
                : null, // Desactiva si no hay ubicación seleccionada
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 3,
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              'Etiquetar',
              style: TextStyle(
                color: selectedLocation != null ? Colors.black : Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
