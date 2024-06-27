import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cuenta_ajuste_pagina_model.dart';
export 'cuenta_ajuste_pagina_model.dart';

class CuentaAjustePaginaWidget extends StatefulWidget {
  const CuentaAjustePaginaWidget({super.key});

  @override
  State<CuentaAjustePaginaWidget> createState() =>
      _CuentaAjustePaginaWidgetState();
}

class _CuentaAjustePaginaWidgetState extends State<CuentaAjustePaginaWidget> {
  late CuentaAjustePaginaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuentaAjustePaginaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'cuenta_ajuste_pagina'});
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
            padding: EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
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
                                'CUENTA_AJUSTE_PAGINA_Card_anv7x9hu_ON_TA');
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
                            'uvo383mu' /* Cuenta */,
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
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'xuel7xhu' /* Información usuario */,
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.botonQuintoModel1,
                          updateCallback: () => setState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              'p0dybf9s' /* Informacion personal */,
                            ),
                            accion: () async {
                              logFirebaseEvent(
                                  'CUENTA_AJUSTE_PAGINA_Container_ces3nygm_');
                              logFirebaseEvent('botonQuinto_navigate_to');

                              context.pushNamed('miPerfilEditarPerfil');
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.botonQuintoModel2,
                          updateCallback: () => setState(() {}),
                          child: BotonQuintoWidget(
                            texto: FFLocalizations.of(context).getText(
                              'x9679505' /* Guardar fotos originales */,
                            ),
                            accion: () async {},
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'gp0ejsaa' /* Idioma */,
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FlutterFlowLanguageSelector(
                      width: 319.0,
                      height: 55.0,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      dropdownIconColor: Colors.white,
                      borderRadius: 8.0,
                      textStyle: TextStyle(
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
