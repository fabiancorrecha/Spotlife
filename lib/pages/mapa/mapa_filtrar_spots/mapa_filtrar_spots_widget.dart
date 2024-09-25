import '/components/buscador01/buscador01_widget.dart';
import '/components/content_list02/content_list02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mapa_filtrar_spots_model.dart';
export 'mapa_filtrar_spots_model.dart';

class MapaFiltrarSpotsWidget extends StatefulWidget {
  const MapaFiltrarSpotsWidget({super.key});

  @override
  State<MapaFiltrarSpotsWidget> createState() => _MapaFiltrarSpotsWidgetState();
}

class _MapaFiltrarSpotsWidgetState extends State<MapaFiltrarSpotsWidget> {
  late MapaFiltrarSpotsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaFiltrarSpotsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mapaFiltrarSpots'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: wrapWithModel(
                  model: _model.buscador01Model,
                  updateCallback: () => safeSetState(() {}),
                  child: const Buscador01Widget(
                    dosIconos: false,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    wrapWithModel(
                      model: _model.contentList02Model,
                      updateCallback: () => safeSetState(() {}),
                      child: const ContentList02Widget(),
                    ),
                  ],
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
          ),
        ),
      ),
    );
  }
}
