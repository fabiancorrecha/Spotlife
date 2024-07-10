import '/components/boton_quinto/boton_quinto_widget.dart';
import '/components/cambiara_unacuenta_profesional_intro/cambiara_unacuenta_profesional_intro_widget.dart';
import '/components/configuracion_cuenta/configuracion_cuenta_widget.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
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
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          'mpvymhzi' /* Herramientas cuenta profesiona... */,
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
                    child: wrapWithModel(
                      model: _model.botonQuintoModel3,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'j415er89' /* Herramientas promoción */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'CUENTA_AJUSTE_PAGINA_Container_r2imfndc_');
                          logFirebaseEvent('botonQuinto_navigate_to');

                          context.pushNamed('HerramientasPromocion');
                        },
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.botonQuintoModel4,
                    updateCallback: () => setState(() {}),
                    child: BotonQuintoWidget(
                      texto: FFLocalizations.of(context).getText(
                        'djmcpi98' /* Solicitar verificación */,
                      ),
                      accion: () async {
                        logFirebaseEvent(
                            'CUENTA_AJUSTE_PAGINA_Container_eq4xz41j_');
                        logFirebaseEvent('botonQuinto_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const ConfiguracionCuentaWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.botonQuintoModel5,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'rha6ba9z' /* Cambiar a cuenta Pro/Empresa */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'CUENTA_AJUSTE_PAGINA_Container_6ygqvz57_');
                          logFirebaseEvent('botonQuinto_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child:
                                        const CambiaraUnacuentaProfesionalIntroWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
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
