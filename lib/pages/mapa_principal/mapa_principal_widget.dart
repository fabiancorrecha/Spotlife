import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:provider/provider.dart';
import 'package:spotlifeapp/flutter_flow/custom_icons.dart';
import 'package:spotlifeapp/flutter_flow/flutter_flow_theme.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/filtrar_spots/filtrar_spots_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_amigos/post_grid_mapa_amigos_widget.dart';
import '/components/post_grid_mapa_global/post_grid_mapa_global_widget.dart';
import '/components/tipo_de_post/tipo_de_post_widget.dart';
import '/custom_code/utils/maps.dart'; // Imports custom actions
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/lat_lng.dart' as ff; // Importamos LatLng de FlutterFlow
import 'mapa_principal_model.dart';

export 'mapa_principal_model.dart';

class MapaPrincipalWidget extends StatefulWidget {
  const MapaPrincipalWidget({super.key});

  @override
  State<MapaPrincipalWidget> createState() => _MapaPrincipalWidgetState();
}

class _MapaPrincipalWidgetState extends State<MapaPrincipalWidget> {
  late MapaPrincipalModel _model;
  bool showMenu = true;
  bool isGlobal = FFAppState().Global;
  bool showCarrousel = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaPrincipalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mapaPrincipal'});
    getCurrentUserLocation(
            defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 12.0,
            height: 12.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord.where(
          isGlobal ? 'esPublico' : 'esAmigos',
          isEqualTo: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserPostsRecord> mapaPrincipalUserPostsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              if ((FFAppState().Post == true) &&
                                  (FFAppState().Global == true))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 100.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.postGridGlobalModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const PostGridMapaGlobalWidget(),
                                  ),
                                ),
                              if (FFAppState().Mapa &&
                                  (FFAppState().Amigos == false))
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<List<UserPostsRecord>>(
                                    stream: queryUserPostsRecord(
                                      queryBuilder: (userPostsRecord) =>
                                          userPostsRecord.whereIn(
                                              'postUser',
                                              (currentUserDocument
                                                      ?.listaSeguidos
                                                      .toList() ??
                                                  [])),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 12.0,
                                            height: 12.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UserPostsRecord>
                                          mapaAmigoUserPostsRecordList =
                                          snapshot.data!;

                                      return SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Container(),
                                      );
                                    },
                                  ),
                                ),
                              if (FFAppState().Mapa == true)
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: _buildMap(
                                      mapaPrincipalUserPostsRecordList,
                                      context),
                                ),
                              if ((FFAppState().Post == true) &&
                                  (FFAppState().Amigos == true))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 100.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.postGridAmigosModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const PostGridMapaAmigosWidget(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (showMenu) buildNavigationBar(),
                  if (FFAppState().Mapa == true && showMenu)
                    buildAddIcon(context),
                  buildTopActions(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMap(List<UserPostsRecord> postList, BuildContext context) {
    if (showCarrousel) {
      return MapWithCarrousel(
        userLocation: currentUserLocationValue!,
        zoom: 16.0,
        listaPostMarcadores: postList,
        usuarioAutenticado: currentUserReference,
        onMapTap: () {
          if (!showMenu) {
            setState(() {
              showMenu = true;
            });
          }
        },
        onMarkerTap: (post) {
          if (showMenu) {
            setState(() {
              showMenu = false;
            });
          }
        },
        navigateTo: (ubication) async {
          logFirebaseEvent('MAPA_PRINCIPAL_Container_k8lq7g0r_CALLBA');
          logFirebaseEvent('MapaPersonalizado2_update_app_state');
          FFAppState().ubication = PlaceInfoStruct(
            latLng: ubication,
          );
          safeSetState(() {});
          logFirebaseEvent('MapaPersonalizado2_navigate_to');

          context.pushNamed(
            'CrearPost',
            queryParameters: {
              'esImagen': serializeParam(
                false,
                ParamType.bool,
              ),
            }.withoutNulls,
          );
        },
        goToProfile: (bycreate) async {
          logFirebaseEvent('MAPA_PRINCIPAL_PAGE_MapaAmigo_CALLBACK');
          if (bycreate == currentUserReference) {
            logFirebaseEvent('MapaAmigo_navigate_to');

            context.pushNamed('perfilPropio');

            return;
          } else {
            logFirebaseEvent('MapaAmigo_navigate_to');

            context.pushNamed(
              'otroPerfil',
              queryParameters: {
                'perfilAjeno': serializeParam(
                  bycreate,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          }
        },
      );
    } else {
      return custom_widgets.MapaPersonalizado2(
        width: double.infinity,
        height: double.infinity,
        ubicacionInicialLat:
            functions.obtenerLatLng(currentUserLocationValue!, true),
        ubicacionInicialLng:
            functions.obtenerLatLng(currentUserLocationValue!, false),
        zoom: 16.0,
        listaPostMarcadores: postList,
        usuarioAutenticado: currentUserReference,
        navigateTo: (bycreate) async {
          logFirebaseEvent('MAPA_PRINCIPAL_PAGE_MapaAmigo_CALLBACK');
          if (bycreate == currentUserReference) {
            logFirebaseEvent('MapaAmigo_navigate_to');

            context.pushNamed('perfilPropio');

            return;
          } else {
            logFirebaseEvent('MapaAmigo_navigate_to');

            context.pushNamed(
              'otroPerfil',
              queryParameters: {
                'perfilAjeno': serializeParam(
                  bycreate,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );

            return;
          }
        },
      );
    }
  }

  Align buildTopActions(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Container(
        height: 168.0,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MAPA_PRINCIPAL_PAGE_Card_if4cyymz_ON_TAP');
                        logFirebaseEvent('Card_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: const Color(0x00000000),
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height: 480.0,
                                    child: FiltrarSpotsWidget(
                                      filterSpots: (change) {
                                       setState(() {
                                         isGlobal = change;
                                       });
                                    },),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 8.0, 4.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  color: FlutterFlowTheme.of(context).icono,
                                  size: 8.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  FFIcons.kframe169,
                                  color: FlutterFlowTheme.of(context).icono,
                                  size: 18.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  FFIcons.kusers,
                                  color: FlutterFlowTheme.of(context).icono,
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MAPA_PRINCIPAL_Container_2uw23oat_ON_TAP');
                      logFirebaseEvent('Container_navigate_to');

                      context.pushNamed('buscarSpots');
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Icon(
                          FFIcons.ksearch,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align buildAddIcon(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.04, 0.75),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('MAPA_PRINCIPAL_PAGE_Card_zn2uosfy_ON_TAP');
            logFirebaseEvent('Card_bottom_sheet');
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return WebViewAware(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: const SizedBox(
                        height: 225.0,
                        child: TipoDePostWidget(),
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: FlutterFlowIconButton(
              borderColor: const Color(0x00F4F176),
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 64.0,
              fillColor: const Color(0x00EEEEEE),
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
              onPressed: () async {
                logFirebaseEvent('MAPA_PRINCIPAL_PAGE_add_ICN_ON_TAP');
                logFirebaseEvent('IconButton_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                      child: GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const SizedBox(
                            height: 225.0,
                            child: TipoDePostWidget(),
                          ),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
            ),
          ),
        ),
      ),
    );
  }

  Align buildNavigationBar() {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.01),
      child: wrapWithModel(
        model: _model.navBar1Model,
        updateCallback: () => safeSetState(() {}),
        child: const NavBar1Widget(
          tabActiva: 2,
        ),
      ),
    );
  }
}

//<editor-fold desc="Carrousel classes">
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
  void didUpdateWidget(MapWithCarrousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    final areEqual = const DeepCollectionEquality().equals(widget.listaPostMarcadores, oldWidget.listaPostMarcadores);
    if (!areEqual) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initSpots();
      });
    }
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
    final favoritesList =
    (currentUserDocument?.listaPostFavoritos.toList() ?? [])
        .map((spot) => spot.id)
        .toSet();
    final List<UserPostsRecord> allSpots = widget.listaPostMarcadores ?? [];
    final currentUser = widget.usuarioAutenticado;
    var spotsAsync = allSpots
        .where((spot) => spot.placeInfo.latLng != null && spot.postUser != null)
        .map((spot) async {
      try {
        return SpotDetail(
          id: spot.reference.id,
          reference: spot.reference,
          title: spot.postTitle,
          imagePath:
          spot.postPhotolist.isNotEmpty ? spot.postPhotolist.first : '',
          avatarUrl: await getUserPhotoUrl(spot.postUser),
          location: spot.placeInfo.latLng!!,
          postUser: spot.postUser,
          isLoggedUser: spot.postUser == currentUser,
          description: spot.postDescription,
          placeInfo: spot.placeInfo,
          isFavorite: favoritesList.contains(spot.reference.id),
          postRecord: spot,
        );
      } catch (e) {
        debugPrint("error mapping to spotDetail ${e}");
        return null;
      }
    });
    List<SpotDetail> _spots = (await Future.wait(spotsAsync))
        .toSet()
        .whereType<SpotDetail>()
        .toList();
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
    spots.sort((a, b) => a.location
        .distanceFrom(referencePoint)
        .compareTo(b.location.distanceFrom(referencePoint)));
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
////
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

    final areEqual = const DeepCollectionEquality().equals(widget.spots, oldWidget.spots);
    if (widget.spots.isNotEmpty && !areEqual) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loadMarkers();
      });
    }

    var currentSelected = widget.selectedSpot;
    if (currentSelected != null && currentSelected != oldWidget.selectedSpot) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        updateSelectedMarker(widget.selectedSpot, oldWidget.selectedSpot);
        _moveCameraToPost(currentSelected, currentZoom);
      });
    }
  }

  void loadMarkers() async {
    try {
      final listMarkers = await getMarkers(widget.spots);
      setState(() {
        markers = listMarkers;
      });
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
            isActive: spot.id == widget.selectedSpot?.id,
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

////
class SpotCarrousel extends StatefulWidget {
  const SpotCarrousel({
    super.key,
    required this.spots,
    required this.background,
    required this.shouldCards,
    required this.itemBuilder,
    required this.onPageChanged,
  });

  final List<SpotDetail> spots;
  final Widget background;
  final bool shouldCards;
  final Widget? Function(SpotDetail item, bool isSelected) itemBuilder;
  final void Function(SpotDetail spot) onPageChanged;

  @override
  State<SpotCarrousel> createState() => _SpotCarrouselState();
}

class _SpotCarrouselState extends State<SpotCarrousel> {
  PageController _pageViewController = PageController(
    viewportFraction: 0.8,
  );
  var listFirstItemId = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(SpotCarrousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    final spotList = widget.spots;
    if (widget.shouldCards && spotList.isNotEmpty && widget.spots[0]?.id != listFirstItemId) {
      listFirstItemId = widget.spots[0]?.id ?? "";
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageViewController.animateToPage(
          0, // Replace with your desired page index
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final spots = widget.spots;
    return Stack(
      children: [
        widget.background,
        if (widget.shouldCards)
          Align(
            alignment: Alignment.bottomCenter,
            child: buildCarrousel(spots),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  Widget buildCarrousel(List<SpotDetail> spots) {
    return Container(
      height: 268,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 42),
      child: PageView.builder(
        itemCount: spots.length,
        onPageChanged: _handlePageChange,
        controller: _pageViewController,
        itemBuilder: (BuildContext context, int index) {
          final SpotDetail item = spots[index];
          return widget.itemBuilder(item, false);
        },
      ),
    );
  }

  void _handlePageChange(int value) {
    widget.onPageChanged(widget.spots[value]);
  }
}

class MapCardSpotItem extends StatelessWidget {
  const MapCardSpotItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onFavoritesTap,
    required this.onNavigateTap,
    required this.onImageTap,
    required this.onUserTap,
  });

  final bool isSelected;
  final SpotDetail item;
  final GestureTapCallback onFavoritesTap;
  final GestureTapCallback onNavigateTap;
  final GestureTapCallback onImageTap;
  final GestureTapCallback onUserTap;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isSelected ? 1 : 0.97,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ImageBackground(
              imagePath: item.imagePath,
              onTap: onImageTap,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 2.0),
                  child: Container(
                    color: Color(0x21141313),
                    child: Row(
                      children: [
                        _userSpotDetail(item),
                        _favoritesIcon(context, item.isFavorite),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (false) // todo hide to route
              Align(
                alignment: Alignment.topRight,
                child: _navigateIcon(),
              ),
          ],
        ),
      ),
    );
  }

  IconButton _navigateIcon() {
    return IconButton(
      icon: Icon(Icons.edit_location_outlined, color: Colors.white),
      onPressed: onNavigateTap,
    );
  }

  IconButton _favoritesIcon(BuildContext context, bool isFavorite) {
    return IconButton(
      icon: Icon(
        isFavorite ? FFIcons.kframe168 : FFIcons.kstarLines,
        color: isFavorite ? FlutterFlowTheme.of(context).customSeleccion : FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
      onPressed: onFavoritesTap,
    );
  }

  Expanded _userSpotDetail(SpotDetail item) {
    return Expanded(
      child: CustomListTile(
        item: item,
        onTap: onUserTap,
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final SpotDetail item;
  final GestureTapCallback? onTap;

  const CustomListTile({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textColor = TextStyle(
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    );
    return ListTile(
      leading: CircularNetworkImage(imageUrl: item.avatarUrl),
      title: Text(item.title,
          style: textColor.copyWith(fontSize: 16, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: item.city.isNotEmpty
          ? Row(
        children: [
          Icon(Icons.location_on_outlined, color: Colors.white, size: 12),
          Text(item.city, style: textColor.copyWith(fontSize: 10), maxLines: 1),
        ],
      )
          : Container(height: 14),
      onTap: onTap,
      // Add other ListTile properties if required
    );
  }
}

class CircularNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const CircularNetworkImage({
    super.key,
    required this.imageUrl,
    this.radius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: Size.fromRadius(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl.isNotEmpty
              ? imageUrl
              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover, // Adjust the fit as needed
        ),
      ),
    );
  }
}

class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key, required this.imagePath, this.onTap});

  final String imagePath;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 200),
          fadeOutDuration: const Duration(milliseconds: 200),
          imageUrl: imagePath.isNotEmpty
              ? imagePath
              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
          placeholder: (BuildContext context, String url) {
            return Image.asset('assets/images/card_loading_image.png');
          },
          errorWidget: (BuildContext context, String url, Object error) {
            return Image.asset('assets/images/card_loading_image.png');
          },
        ),
      ),
      onTap: onTap,
    );
  }
}

class SpotDetail extends Equatable {
  SpotDetail({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.avatarUrl,
    required this.location,
    required this.postUser,
    required this.isLoggedUser,
    required this.description,
    required this.placeInfo,
    required this.isFavorite,
    required this.reference,
    required this.postRecord,
  });

  final String id;
  final String imagePath;
  final String title;
  final String? description;
  final String avatarUrl;
  final LatLng location;
  final bool isLoggedUser;
  bool isFavorite;
  final DocumentReference reference;
  final UserPostsRecord postRecord;
  final DocumentReference? postUser;
  final PlaceInfoStruct placeInfo;

  String get city => placeInfo.city;

  @override
  List<Object?> get props => [id, title, imagePath, avatarUrl, isLoggedUser, description, postUser, placeInfo, location];
}
//</editor-fold>