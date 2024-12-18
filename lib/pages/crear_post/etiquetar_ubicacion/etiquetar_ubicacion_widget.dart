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

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EtiquetarUbicacionModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
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
                          'ETIQUETAR_UBICACION_Container_hhp9pz2i_C');
                      logFirebaseEvent(
                          'MapaPersonalizadoEtiqueta_update_app_sta');
                      FFAppState().ubication = PlaceInfoStruct(
                        address: street,
                        city: city,
                        latLng: ubication,
                      );
                      FFAppState().Coordenadas = ubication;
                      FFAppState().update(() {});
                      logFirebaseEvent(
                          'MapaPersonalizadoEtiqueta_bottom_sheet');
                      Navigator.pop(context);
                    },
                    dissmid: () async {
                      logFirebaseEvent(
                          'ETIQUETAR_UBICACION_Container_hhp9pz2i_C');
                      logFirebaseEvent(
                          'MapaPersonalizadoEtiqueta_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
