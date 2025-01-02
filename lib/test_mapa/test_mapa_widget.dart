import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'test_mapa_model.dart';
export 'test_mapa_model.dart';

class TestMapaWidget extends StatefulWidget {
  const TestMapaWidget({super.key});

  @override
  State<TestMapaWidget> createState() => _TestMapaWidgetState();
}

class _TestMapaWidgetState extends State<TestMapaWidget> {
  late TestMapaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestMapaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'testMapa'});
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
        List<UserPostsRecord> testMapaUserPostsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.MapWithCarrousel(
                        width: double.infinity,
                        height: double.infinity,
                        zoom: 16.0,
                        userLocation: currentUserLocationValue!,
                        listaPostMarcadores: testMapaUserPostsRecordList,
                        usuarioAutenticado: currentUserReference!,
                        onMapTap: () async {
                          logFirebaseEvent(
                              'TEST_MAPA_Container_q6ook30l_CALLBACK');
                          logFirebaseEvent('MapWithCarrousel_navigate_to');

                          context.pushNamed('Feed');
                        },
                        navigateTo: (ubication) async {
                          logFirebaseEvent(
                              'TEST_MAPA_Container_q6ook30l_CALLBACK');
                          logFirebaseEvent('MapWithCarrousel_navigate_to');

                          context.pushNamed('Feed');
                        },
                        goToProfile: (bycreate) async {
                          logFirebaseEvent(
                              'TEST_MAPA_Container_q6ook30l_CALLBACK');
                          logFirebaseEvent('MapWithCarrousel_navigate_to');

                          context.pushNamed('Feed');
                        },
                        onMarkerTap: () async {
                          logFirebaseEvent(
                              'TEST_MAPA_Container_q6ook30l_CALLBACK');
                          logFirebaseEvent('MapWithCarrousel_update_app_state');
                          FFAppState().Provincia = 't5exto';
                          safeSetState(() {});
                        },
                      ),
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
