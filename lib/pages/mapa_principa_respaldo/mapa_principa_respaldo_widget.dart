import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mapa_principa_respaldo_model.dart';
export 'mapa_principa_respaldo_model.dart';

class MapaPrincipaRespaldoWidget extends StatefulWidget {
  const MapaPrincipaRespaldoWidget({super.key});

  @override
  State<MapaPrincipaRespaldoWidget> createState() =>
      _MapaPrincipaRespaldoWidgetState();
}

class _MapaPrincipaRespaldoWidgetState
    extends State<MapaPrincipaRespaldoWidget> {
  late MapaPrincipaRespaldoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaPrincipaRespaldoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mapaPrincipaRespaldo'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserPostsRecord>>(
      future: queryUserPostsRecordOnce(
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
        List<UserPostsRecord> mapaPrincipaRespaldoUserPostsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          ),
        );
      },
    );
  }
}
