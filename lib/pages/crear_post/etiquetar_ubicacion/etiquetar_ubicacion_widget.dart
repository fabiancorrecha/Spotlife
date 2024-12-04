import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'etiquetar_ubicacion_model.dart';
export 'etiquetar_ubicacion_model.dart';

class EtiquetarUbicacionWidget extends StatefulWidget {
  const EtiquetarUbicacionWidget({super.key});

  @override
  State<EtiquetarUbicacionWidget> createState() =>
      _EtiquetarUbicacionWidgetState();
}

class _EtiquetarUbicacionWidgetState extends State<EtiquetarUbicacionWidget> {
  late EtiquetarUbicacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EtiquetarUbicacionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EtiquetarUbicacion'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<UserPostsRecord>>(
                stream: queryUserPostsRecord(
                  queryBuilder: (userPostsRecord) => userPostsRecord.where(
                    'postUser',
                    isEqualTo: currentUserReference,
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
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ),
                    );
                  }
                  List<UserPostsRecord>
                      mapaPersonalizadoEtiquetaUserPostsRecordList =
                      snapshot.data!;

                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.MapaPersonalizadoEtiqueta(
                      width: double.infinity,
                      height: double.infinity,
                      ubicacionInicialLat: functions.obtenerLatLng(
                          currentUserLocationValue!, true),
                      ubicacionInicialLng: functions.obtenerLatLng(
                          currentUserLocationValue!, false),
                      zoom: 16.0,
                      listaPostMarcadores:
                          mapaPersonalizadoEtiquetaUserPostsRecordList,
                      androidMapsKey: 'AIzaSyCsdwY0ZN0_MRcjhomnqjtjb8Co6QYPY8M',
                      iOSMapsKey: 'AIzaSyCh-IGEBvdvzziaujkF-QlXNHvyMlAom-U',
                      webMapsKey: 'AIzaSyDO0cp7qjh7_-POR7Azm1RGktAjU4Wa0uo',
                      addIcon: Icon(
                        FFIcons.kframe,
                        color: FlutterFlowTheme.of(context).btnText,
                        size: 30.0,
                      ),
                      navigateToWithProfile: (ubication, street, city) async {
                        logFirebaseEvent(
                            'ETIQUETAR_UBICACION_Container_ssafh26o_C');
                        logFirebaseEvent(
                            'MapaPersonalizadoEtiqueta_navigate_to');

                        context.pushNamed(
                          'CrearPost',
                          queryParameters: {
                            'esImagen': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'direccion': serializeParam(
                              ubication,
                              ParamType.LatLng,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        logFirebaseEvent(
                            'MapaPersonalizadoEtiqueta_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '$street  $city',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
