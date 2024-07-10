import '/components/boton_quinto/boton_quinto_widget.dart';
import '/components/privacidad_old/privacidad_old_widget.dart';
import '/components/seguridad_old/seguridad_old_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'configuracion_pagina_model.dart';
export 'configuracion_pagina_model.dart';

class ConfiguracionPaginaWidget extends StatefulWidget {
  const ConfiguracionPaginaWidget({super.key});

  @override
  State<ConfiguracionPaginaWidget> createState() =>
      _ConfiguracionPaginaWidgetState();
}

class _ConfiguracionPaginaWidgetState extends State<ConfiguracionPaginaWidget> {
  late ConfiguracionPaginaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfiguracionPaginaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'configuracion_pagina'});
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(37.0, 0.0, 37.0, 34.0),
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
                                'CONFIGURACION_PAGINA_Card_kcaxn8cv_ON_TA');
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
                            'g9degh4s' /* Configuración */,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.botonQuintoModel1,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            '3fvvwy0r' /* Invitar a amigos */,
                          ),
                          accion: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel2,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: 'Notificaciones',
                          accion: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel3,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            'ey0klspn' /* Privacidad */,
                          ),
                          accion: () async {
                            logFirebaseEvent(
                                'CONFIGURACION_PAGINA_Container_nr0d3y4c_');
                            logFirebaseEvent('botonQuinto_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: const Color(0x00000000),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 600.0,
                                        child: PrivacidadOldWidget(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel4,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            'errekog4' /* Seguridad */,
                          ),
                          accion: () async {
                            logFirebaseEvent(
                                'CONFIGURACION_PAGINA_Container_n21j2iva_');
                            logFirebaseEvent('botonQuinto_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SeguridadOldWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel5,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            'wiaylq3u' /* Cuenta */,
                          ),
                          accion: () async {
                            logFirebaseEvent(
                                'CONFIGURACION_PAGINA_Container_ka4ocus8_');
                            logFirebaseEvent('botonQuinto_navigate_to');

                            context.pushNamed('cuenta_ajuste_pagina');
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel6,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            'emnvhxew' /* Ayuda */,
                          ),
                          accion: () async {
                            logFirebaseEvent(
                                'CONFIGURACION_PAGINA_Container_wydgv4ph_');
                            logFirebaseEvent('botonQuinto_launch_u_r_l');
                            await launchURL('https://spotlifeapp.com/');
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel7,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            'k3vkvpuk' /* Información */,
                          ),
                          accion: () async {},
                        ),
                      ),
                    ].divide(const SizedBox(height: 8.0)),
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
