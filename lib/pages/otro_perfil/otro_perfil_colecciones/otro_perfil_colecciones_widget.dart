import '/backend/backend.dart';
import '/components/app_bar7_colecciones/app_bar7_colecciones_widget.dart';
import '/components/buscador_colecciones/buscador_colecciones_widget.dart';
import '/components/grid_colecciones/grid_colecciones_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'otro_perfil_colecciones_model.dart';
export 'otro_perfil_colecciones_model.dart';

class OtroPerfilColeccionesWidget extends StatefulWidget {
  const OtroPerfilColeccionesWidget({
    super.key,
    this.usuario,
  });

  final DocumentReference? usuario;

  @override
  State<OtroPerfilColeccionesWidget> createState() =>
      _OtroPerfilColeccionesWidgetState();
}

class _OtroPerfilColeccionesWidgetState
    extends State<OtroPerfilColeccionesWidget> {
  late OtroPerfilColeccionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtroPerfilColeccionesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'otroPerfilColecciones'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        queryBuilder: (collectionsRecord) => collectionsRecord.where(
          'createdBy',
          isEqualTo: widget.usuario,
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
        List<CollectionsRecord> otroPerfilColeccionesCollectionsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.appBar7ColeccionesModel,
                    updateCallback: () => setState(() {}),
                    child: AppBar7ColeccionesWidget(
                      usuario: widget.usuario!,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar2Model,
                    updateCallback: () => setState(() {}),
                    child: NavBar2Widget(
                      tab: 2,
                      otroUsuario: widget.usuario,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.buscadorColeccionesModel,
                    updateCallback: () => setState(() {}),
                    child: BuscadorColeccionesWidget(
                      coleccionesLista:
                          otroPerfilColeccionesCollectionsRecordList,
                      puedeCrearColeccion: false,
                      esColeccionFavorito: false,
                    ),
                  ),
                  Expanded(
                    child: wrapWithModel(
                      model: _model.gridColeccionesModel,
                      updateCallback: () => setState(() {}),
                      child: GridColeccionesWidget(
                        usuario: widget.usuario,
                        esCollecionTipoFavorito: false,
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar1Model,
                    updateCallback: () => setState(() {}),
                    child: const NavBar1Widget(
                      tabActiva: 0,
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
