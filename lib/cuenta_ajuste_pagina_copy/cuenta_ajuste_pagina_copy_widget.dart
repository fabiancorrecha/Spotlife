import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cuenta_ajuste_pagina_copy_model.dart';
export 'cuenta_ajuste_pagina_copy_model.dart';

class CuentaAjustePaginaCopyWidget extends StatefulWidget {
  const CuentaAjustePaginaCopyWidget({super.key});

  @override
  State<CuentaAjustePaginaCopyWidget> createState() =>
      _CuentaAjustePaginaCopyWidgetState();
}

class _CuentaAjustePaginaCopyWidgetState
    extends State<CuentaAjustePaginaCopyWidget> {
  late CuentaAjustePaginaCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuentaAjustePaginaCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'cuenta_ajuste_paginaCopy'});
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(37.0, 54.0, 37.0, 32.0),
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
                                'CUENTA_AJUSTE_PAGINA_COPY_Card_ckoct83y_');
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
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'd8hdg61r' /* Cuenta */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'e5j78qir' /* Información usuario */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                      ),
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
                          updateCallback: () => safeSetState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              '15yxjtlv' /* Informacion personal */,
                            ),
                            accion: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.botonQuintoModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              'zajjlkyw' /* Guardar fotos originales */,
                            ),
                            accion: () async {},
                          ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '7gbx1oom' /* Herramientas cuenta profesiona... */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.botonQuintoModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              'jlrmz5rm' /* Herramientas promoción */,
                            ),
                            accion: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.botonQuintoModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              '2hln9euu' /* Solicitar verificación */,
                            ),
                            accion: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.botonQuintoModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              '1u55e3k3' /* Cambiar a cuenta empresa */,
                            ),
                            accion: () async {},
                          ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '93rqmt2h' /* Idioma */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FlutterFlowLanguageSelector(
                      width: 319.0,
                      height: 55.0,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      dropdownIconColor: Colors.white,
                      borderRadius: 8.0,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 13.0,
                      ),
                      hideFlags: true,
                      flagSize: 24.0,
                      flagTextGap: 8.0,
                      currentLanguage: FFLocalizations.of(context).languageCode,
                      languages: FFLocalizations.languages(),
                      onChanged: (lang) => setAppLanguage(context, lang),
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
