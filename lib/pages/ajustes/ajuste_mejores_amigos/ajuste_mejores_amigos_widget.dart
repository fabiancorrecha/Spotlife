import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ajuste_mejores_amigos_model.dart';
export 'ajuste_mejores_amigos_model.dart';

class AjusteMejoresAmigosWidget extends StatefulWidget {
  const AjusteMejoresAmigosWidget({super.key});

  @override
  State<AjusteMejoresAmigosWidget> createState() =>
      _AjusteMejoresAmigosWidgetState();
}

class _AjusteMejoresAmigosWidgetState extends State<AjusteMejoresAmigosWidget> {
  late AjusteMejoresAmigosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjusteMejoresAmigosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AjusteMejoresAmigos'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 32.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'AJUSTE_MEJORES_AMIGOS_Card_gibr186n_ON_T');
                          logFirebaseEvent('Card_navigate_back');
                          context.safePop();
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).fondoIcono,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).icono,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'g9alw0ux' /* Mejores amigos */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                      ),
                      Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.boton5Model1,
                    updateCallback: () => setState(() {}),
                    child: BotonQuintoWidget(
                      texto: FFLocalizations.of(context).getText(
                        'r2zd2yea' /* Todos */,
                      ),
                      accion: () async {},
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.boton5Model2,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'shxzi9x5' /* Visitados */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.boton5Model3,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '8gxj0skj' /* Por visitar */,
                    ),
                    accion: () async {},
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
