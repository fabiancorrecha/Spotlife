import '/components/app_bar8/app_bar8_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_imagen/post_imagen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mapa_posr_recomendados_model.dart';
export 'mapa_posr_recomendados_model.dart';

class MapaPosrRecomendadosWidget extends StatefulWidget {
  const MapaPosrRecomendadosWidget({super.key});

  @override
  State<MapaPosrRecomendadosWidget> createState() =>
      _MapaPosrRecomendadosWidgetState();
}

class _MapaPosrRecomendadosWidgetState
    extends State<MapaPosrRecomendadosWidget> {
  late MapaPosrRecomendadosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaPosrRecomendadosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mapaPosrRecomendados'});
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
                model: _model.appBar8Model,
                updateCallback: () => safeSetState(() {}),
                child: const AppBar8Widget(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 572.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.postImagenModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const PostImagenWidget(),
                                ),
                                Divider(
                                  height: 32.0,
                                  thickness: 32.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 572.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.postImagenModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const PostImagenWidget(),
                                ),
                                Divider(
                                  height: 32.0,
                                  thickness: 32.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
          ),
        ),
      ),
    );
  }
}
