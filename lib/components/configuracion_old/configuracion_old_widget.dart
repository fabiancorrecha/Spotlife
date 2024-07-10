import '/auth/base_auth_user_provider.dart';
import '/components/boton_quinto/boton_quinto_widget.dart';
import '/components/datos/datos_widget.dart';
import '/components/privacidad_old/privacidad_old_widget.dart';
import '/components/seguridad_old/seguridad_old_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'configuracion_old_model.dart';
export 'configuracion_old_model.dart';

class ConfiguracionOldWidget extends StatefulWidget {
  const ConfiguracionOldWidget({super.key});

  @override
  State<ConfiguracionOldWidget> createState() => _ConfiguracionOldWidgetState();
}

class _ConfiguracionOldWidgetState extends State<ConfiguracionOldWidget> {
  late ConfiguracionOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfiguracionOldModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
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
                          'CONFIGURACION_OLD_Card_q5rhirj8_ON_TAP');
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
                      'xrd67z4v' /* Configuración */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
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
                    texto: 'Invitar a amigos',
                    accion: () async {
                      logFirebaseEvent(
                          'CONFIGURACION_OLD_Container_qmopjh4o_CAL');
                      logFirebaseEvent('botonQuinto_navigate_to');

                      context.pushNamed('invitar_amigos_pagina');
                    },
                  ),
                ),
                if (!loggedIn)
                  wrapWithModel(
                    model: _model.botonQuintoModel2,
                    updateCallback: () => setState(() {}),
                    child: BotonQuintoWidget(
                      texto: 'Notificacionesdd',
                      accion: () async {},
                    ),
                  ),
                wrapWithModel(
                  model: _model.botonQuintoModel3,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: 'Privacidad',
                    accion: () async {
                      logFirebaseEvent(
                          'CONFIGURACION_OLD_Container_enkd9ntf_CAL');
                      logFirebaseEvent('botonQuinto_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: const Color(0x00000000),
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const SizedBox(
                                height: 600.0,
                                child: PrivacidadOldWidget(),
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
                    texto: 'Seguridad',
                    accion: () async {
                      logFirebaseEvent(
                          'CONFIGURACION_OLD_Container_3yu5ld9g_CAL');
                      logFirebaseEvent('botonQuinto_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const SeguridadOldWidget(),
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
                    texto: 'Cuenta',
                    accion: () async {
                      logFirebaseEvent(
                          'CONFIGURACION_OLD_Container_3yp7hd77_CAL');
                      logFirebaseEvent('botonQuinto_navigate_to');

                      context.pushNamed('cuenta_ajuste_pagina');
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel6,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: 'Ayuda',
                    accion: () async {
                      logFirebaseEvent(
                          'CONFIGURACION_OLD_Container_uirewfq6_CAL');
                      logFirebaseEvent('botonQuinto_launch_u_r_l');
                      await launchURL('https://spotlifeapp.com/');
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel7,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: 'Información',
                    accion: () async {
                      logFirebaseEvent(
                          'CONFIGURACION_OLD_Container_5qn6ogea_CAL');
                      logFirebaseEvent('botonQuinto_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const DatosWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
