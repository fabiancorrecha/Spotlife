import '/backend/backend.dart';
import '/components/menu_otro_perfil/menu_otro_perfil_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar_perfil_ajeno/nav_bar_perfil_ajeno_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'otro_perfil_mapa_model.dart';
export 'otro_perfil_mapa_model.dart';

class OtroPerfilMapaWidget extends StatefulWidget {
  const OtroPerfilMapaWidget({
    super.key,
    this.usuario,
    required this.userPost,
    required this.colecccion,
    required this.refColeccion,
  });

  final DocumentReference? usuario;
  final List<DocumentReference>? userPost;
  final List<CollectionsRecord>? colecccion;
  final DocumentReference? refColeccion;

  @override
  State<OtroPerfilMapaWidget> createState() => _OtroPerfilMapaWidgetState();
}

class _OtroPerfilMapaWidgetState extends State<OtroPerfilMapaWidget> {
  late OtroPerfilMapaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtroPerfilMapaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'otroPerfilMapa'});
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
        queryBuilder: (userPostsRecord) => userPostsRecord
            .where(
              'postUser',
              isEqualTo: widget.usuario,
            )
            .whereArrayContainsAny('collections',
                widget.colecccion?.map((e) => e.reference).toList()),
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
        List<UserPostsRecord> otroPerfilMapaUserPostsRecordList =
            snapshot.data!;

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
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(widget.usuario!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ),
                    );
                  }

                  final columnUsersRecord = snapshot.data!;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.chevron_left,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                columnUsersRecord.photoUrl,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 28.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    icon: Icon(
                                      Icons.keyboard_control,
                                      color: FlutterFlowTheme.of(context).icono,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'OTRO_PERFIL_MAPA_keyboard_control_ICN_ON');
                                      logFirebaseEvent(
                                          'IconButton_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        barrierColor: const Color(0x331A1A1A),
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height: 225.0,
                                                  child: MenuOtroPerfilWidget(
                                                    user: widget.usuario,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      wrapWithModel(
                        model: _model.navBarPerfilAjenoModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarPerfilAjenoWidget(
                          tab: 1,
                          otroUsuario: widget.usuario,
                        ),
                      ),
                      Expanded(
                        child: Container(
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
                                  otroPerfilMapaUserPostsRecordList,
                              usuarioAutenticado: widget.usuario,
                              navigateTo: (bycreate) async {
                                logFirebaseEvent(
                                    'OTRO_PERFIL_MAPA_Container_v3x1d8lp_CALL');
                                if (bycreate == widget.usuario) {
                                  logFirebaseEvent(
                                      'MapaPersonalizado2_navigate_to');

                                  context.pushNamed(
                                    'otroPerfil',
                                    queryParameters: {
                                      'perfilAjeno': serializeParam(
                                        bycreate,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  logFirebaseEvent(
                                      'MapaPersonalizado2_navigate_to');

                                  context.pushNamed(
                                    'perfilPropio',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.navBar1Model,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavBar1Widget(
                          tabActiva: 0,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
