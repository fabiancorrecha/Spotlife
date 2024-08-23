import '/backend/backend.dart';
import '/components/app_bar5/app_bar5_widget.dart';
import '/components/grid_posts_bio/grid_posts_bio_widget.dart';
import '/components/grid_posts_favoritos/grid_posts_favoritos_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'miperfil_detalle_coleccion_model.dart';
export 'miperfil_detalle_coleccion_model.dart';

class MiperfilDetalleColeccionWidget extends StatefulWidget {
  const MiperfilDetalleColeccionWidget({
    super.key,
    this.coleccion,
    this.esFavorito,
  });

  final CollectionsRecord? coleccion;
  final bool? esFavorito;

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
      setState(() {});
      logFirebaseEvent('miperfilDetalleColeccion_update_page_sta');
      _model.postAgregados =
          widget.coleccion!.postuUserList.toList().cast<DocumentReference>();
      setState(() {});
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                model: _model.appBar5Model,
                updateCallback: () => setState(() {}),
                child: AppBar5Widget(
                  titulo: widget.coleccion?.nombre,
                  coleccion: widget.coleccion,
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    if (widget.esFavorito! || (FFAppState().vermapa == false))
                      wrapWithModel(
                        model: _model.gridPostsFavoritosModel,
                        updateCallback: () => setState(() {}),
                        child: GridPostsFavoritosWidget(
                          coleccion: widget.coleccion,
                        ),
                      ),
                    if (widget.esFavorito! || (FFAppState().vermapa == false))
                      wrapWithModel(
                        model: _model.gridPostsBioModel,
                        updateCallback: () => setState(() {}),
                        child: GridPostsBioWidget(
                          coleccion: widget.coleccion?.reference,
                        ),
                      ),
                    if (FFAppState().vermapa == true)
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.MapaPerzonalizadoCopy(
                            width: double.infinity,
                            height: double.infinity,
                            ubicacionInicialLat: functions.obtenerLatLng(
                                currentUserLocationValue!, true),
                            ubicacionInicialLng: functions.obtenerLatLng(
                                currentUserLocationValue!, false),
                            zoom: 16.0,
                            listaPostMarcadores: _model.postAgregados,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => setState(() {}),
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
