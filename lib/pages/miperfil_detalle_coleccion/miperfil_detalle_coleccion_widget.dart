import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/grid_posts_bio/grid_posts_bio_widget.dart';
import '/components/grid_posts_favoritos/grid_posts_favoritos_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'miperfil_detalle_coleccion_model.dart';
export 'miperfil_detalle_coleccion_model.dart';

class MiperfilDetalleColeccionWidget extends StatefulWidget {
  const MiperfilDetalleColeccionWidget({
    super.key,
    this.coleccion,
    this.esFavorito,
    required this.usuario,
    required this.refColeccion,
  });

  final CollectionsRecord? coleccion;
  final bool? esFavorito;
  final DocumentReference? usuario;
  final DocumentReference? refColeccion;

  @override
  State<MiperfilDetalleColeccionWidget> createState() =>
      _MiperfilDetalleColeccionWidgetState();
}

class _MiperfilDetalleColeccionWidgetState
    extends State<MiperfilDetalleColeccionWidget> {
  late MiperfilDetalleColeccionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiperfilDetalleColeccionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'miperfilDetalleColeccion'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MIPERFIL_DETALLE_COLECCION_miperfilDetal');
      logFirebaseEvent('miperfilDetalleColeccion_update_app_stat');
      FFAppState().collectionUse =
          widget.coleccion!.postuUserList.toList().cast<DocumentReference>();
      safeSetState(() {});
      logFirebaseEvent('miperfilDetalleColeccion_update_page_sta');
      _model.postAgregados =
          widget.coleccion!.postuUserList.toList().cast<DocumentReference>();
      safeSetState(() {});
    });

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100.0,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 50.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).fondoIcono,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'MIPERFIL_DETALLE_COLECCION_arrow_back_IC');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                        },
                      ),
                    ),
                    if (widget.coleccion?.imagen != null &&
                        widget.coleccion?.imagen != '')
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          widget.coleccion!.imagen,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.coleccion!.nombre,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MIPERFIL_DETALLE_COLECCION_Card_3c2hfwfs');
                          if (FFAppState().vermapa) {
                            logFirebaseEvent('Card_update_app_state');
                            FFAppState().vermapa = false;
                            FFAppState().update(() {});
                          } else {
                            logFirebaseEvent('Card_update_app_state');
                            FFAppState().vermapa = true;
                            FFAppState().update(() {});
                          }
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).fondoIcono,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              FFIcons.kframe169,
                              color: valueOrDefault<Color>(
                                FFAppState().vermapa == true
                                    ? FlutterFlowTheme.of(context).primary
                                    : const Color(0xFFFAF7FA),
                                const Color(0xFFFAF7FA),
                              ),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    if (widget.esFavorito! || (FFAppState().vermapa == false))
                      wrapWithModel(
                        model: _model.gridPostsFavoritosModel,
                        updateCallback: () => safeSetState(() {}),
                        child: GridPostsFavoritosWidget(
                          coleccion: widget.coleccion,
                        ),
                      ),
                    if (widget.esFavorito! || (FFAppState().vermapa == false))
                      wrapWithModel(
                        model: _model.gridPostsBioModel,
                        updateCallback: () => safeSetState(() {}),
                        child: GridPostsBioWidget(
                          coleccion: widget.coleccion?.reference,
                        ),
                      ),
                    if (FFAppState().vermapa == true)
                      StreamBuilder<List<UserPostsRecord>>(
                        stream: queryUserPostsRecord(
                          queryBuilder: (userPostsRecord) =>
                              userPostsRecord.where(
                            'collections',
                            arrayContains: widget.refColeccion,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<UserPostsRecord> containerUserPostsRecordList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.MapaPersonalizado2(
                                width: double.infinity,
                                height: double.infinity,
                                ubicacionInicialLat: functions.obtenerLatLng(
                                    currentUserLocationValue!, true),
                                ubicacionInicialLng: functions.obtenerLatLng(
                                    currentUserLocationValue!, false),
                                zoom: 16.0,
                                listaPostMarcadores:
                                    containerUserPostsRecordList,
                                usuarioAutenticado: currentUserReference,
                                navigateTo: (bycreate) async {},
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => safeSetState(() {}),
                child: const NavBar1Widget(
                  tabActiva: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
