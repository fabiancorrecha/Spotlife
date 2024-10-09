import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/filtrar_spots/filtrar_spots_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_global/post_grid_mapa_global_widget.dart';
import '/components/tipo_de_post/tipo_de_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaPrincipalModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mapaPrincipal'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
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
          'esPublico',
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
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
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
                              if (FFAppState().PostGlobal == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.postGridGlobalModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const PostGridMapaGlobalWidget(),
                                  ),
                                ),
                              if (FFAppState().MapaGlobal == true)
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: custom_widgets.MapWithCarrousel(
                                    userLocation: currentUserLocationValue!,
                                    zoom: 16.0,
                                    listaPostMarcadores: mapaPrincipalUserPostsRecordList,
                                    usuarioAutenticado: currentUserReference,
                                    onMapTap: () {
                                      setState(() {
                                        showMenu = true;
                                      });
                                    },
                                    onMarkerTap: (post) {
                                      setState(() {
                                        showMenu = false;
                                      });
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
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (showMenu) buildNavigationBar(),
                  if (FFAppState().MapaGlobal == true && showMenu) buildAddIcon(context),
                  buildTopActions(context),
                ],
              ),
            ),
          ),
        );
      },
    );
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('MAPA_PRINCIPAL_PAGE_Card_if4cyymz_ON_TAP');
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
                                  child: const SizedBox(
                                    height: 480.0,
                                    child: FiltrarSpotsWidget(),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
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
                      logFirebaseEvent('MAPA_PRINCIPAL_Container_2uw23oat_ON_TAP');
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
