import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar7_usuario/app_bar7_usuario_widget.dart';
import '/components/buscador_colecciones/buscador_colecciones_widget.dart';
import '/components/grid_colecciones/grid_colecciones_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'miperfil_coleciones_model.dart';
export 'miperfil_coleciones_model.dart';

class MiperfilColecionesWidget extends StatefulWidget {
  const MiperfilColecionesWidget({super.key});

  @override
  State<MiperfilColecionesWidget> createState() =>
      _MiperfilColecionesWidgetState();
}

class _MiperfilColecionesWidgetState extends State<MiperfilColecionesWidget> {
  late MiperfilColecionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiperfilColecionesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'miperfilColeciones'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CollectionsRecord>>(
      stream: queryCollectionsRecord(
        queryBuilder: (collectionsRecord) => collectionsRecord
            .where(
              'createdBy',
              isEqualTo: currentUserReference,
            )
            .where(
              'coleccionFavoritos',
              isEqualTo: false,
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
        List<CollectionsRecord> miperfilColecionesCollectionsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.appBar7UsuarioModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppBar7UsuarioWidget(
                      usuario: currentUserReference,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar2Model,
                    updateCallback: () => safeSetState(() {}),
                    child: const NavBar2Widget(
                      tab: 2,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.buscadorColeccionesModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BuscadorColeccionesWidget(
                      coleccionesLista: miperfilColecionesCollectionsRecordList,
                      puedeCrearColeccion: true,
                      esColeccionFavorito: false,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      children: [
                        wrapWithModel(
                          model: _model.gridColeccionesModel,
                          updateCallback: () => safeSetState(() {}),
                          child: GridColeccionesWidget(
                            usuario: currentUserReference,
                            esCollecionTipoFavorito: false,
                          ),
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
      },
    );
  }
}
