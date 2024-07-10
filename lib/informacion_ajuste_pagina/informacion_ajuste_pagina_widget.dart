import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'informacion_ajuste_pagina_model.dart';
export 'informacion_ajuste_pagina_model.dart';

class InformacionAjustePaginaWidget extends StatefulWidget {
  const InformacionAjustePaginaWidget({super.key});

  @override
  State<InformacionAjustePaginaWidget> createState() =>
      _InformacionAjustePaginaWidgetState();
}

class _InformacionAjustePaginaWidgetState
    extends State<InformacionAjustePaginaWidget> {
  late InformacionAjustePaginaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformacionAjustePaginaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'informacion_ajuste_pagina'});
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
            padding: const EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
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
                                'INFORMACION_AJUSTE_PAGINA_Card_392xkzq6_');
                            logFirebaseEvent('Card_bottom_sheet');
                            Navigator.pop(context);
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).fondoIcono,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
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
                            '4zraujwk' /* Información */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displaySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.botonQuintoModel1,
                          updateCallback: () => setState(() {}),
                          child: BotonQuintoWidget(
                            texto: 'Politica de datos',
                            accion: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.botonQuintoModel2,
                          updateCallback: () => setState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              'gyk6tdi9' /* Condiciones de uso */,
                            ),
                            accion: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.botonQuintoModel3,
                          updateCallback: () => setState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              'ygotn5ym' /* Reglamento UE  */,
                            ),
                            accion: () async {},
                          ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
