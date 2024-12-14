import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar5/app_bar5_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'miperfil_mapa_pin2_model.dart';
export 'miperfil_mapa_pin2_model.dart';

class MiperfilMapaPin2Widget extends StatefulWidget {
  const MiperfilMapaPin2Widget({
    super.key,
    this.coleccion,
  });

  final CollectionsRecord? coleccion;

  @override
  State<MiperfilMapaPin2Widget> createState() => _MiperfilMapaPin2WidgetState();
}

class _MiperfilMapaPin2WidgetState extends State<MiperfilMapaPin2Widget> {
  late MiperfilMapaPin2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiperfilMapaPin2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'miperfilMapaPin2'});
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
              'collections',
              arrayContains: widget.coleccion?.reference,
            )
            .where(
              'postUser',
              isEqualTo: currentUserReference,
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
        List<UserPostsRecord> miperfilMapaPin2UserPostsRecordList =
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.appBar5Model,
                    updateCallback: () => safeSetState(() {}),
                    child: AppBar5Widget(
                      titulo: 'titulo',
                      coleccion: widget.coleccion,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          zoom: 18.0,
                          listaPostMarcadores: widget.coleccion?.createdBy ==
                                  currentUserReference
                              ? miperfilMapaPin2UserPostsRecordList
                              : miperfilMapaPin2UserPostsRecordList
                                  .where((e) => e.esPrivado == false)
                                  .toList(),
                          usuarioAutenticado: currentUserReference,
                          navigateTo: (bycreate) async {
                            logFirebaseEvent(
                                'MIPERFIL_MAPA_PIN2_Container_yliaz712_CA');
                            if (bycreate == currentUserReference) {
                              logFirebaseEvent(
                                  'MapaPersonalizado2_navigate_to');

                              context.pushNamed('perfilPropio');

                              return;
                            } else {
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

                              return;
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
                      tabActiva: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
