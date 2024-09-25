import '/auth/base_auth_user_provider.dart';
import '/components/boton_quinto/boton_quinto_widget.dart';
import '/components/cambiara_unacuenta_profesional_intro/cambiara_unacuenta_profesional_intro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'herramientas_promocion_model.dart';
export 'herramientas_promocion_model.dart';

class HerramientasPromocionWidget extends StatefulWidget {
  const HerramientasPromocionWidget({super.key});

  @override
  State<HerramientasPromocionWidget> createState() =>
      _HerramientasPromocionWidgetState();
}

class _HerramientasPromocionWidgetState
    extends State<HerramientasPromocionWidget> {
  late HerramientasPromocionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HerramientasPromocionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HerramientasPromocion'});
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
          padding: const EdgeInsetsDirectional.fromSTEB(37.0, 54.0, 37.0, 32.0),
          child: SingleChildScrollView(
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
                              'HERRAMIENTAS_PROMOCION_Card_ls5znx3v_ON_');
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
                            'ftvqagho' /* Herramientas
Promocion */
                            ,
                          ),
                          textAlign: TextAlign.center,
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
                        '2t49hy0q' /* Lista Herramientas */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.botonQuintoModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            '4huaujyh' /* Promocion Spot */,
                          ),
                          accion: () async {
                            logFirebaseEvent(
                                'HERRAMIENTAS_PROMOCION_Container_ta1hri4');
                            logFirebaseEvent('botonQuinto_navigate_to');

                            context.pushNamed('miPerfilEditarPerfil');
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            '660zsyws' /* Evento 24h-48h en vivo */,
                          ),
                          accion: () async {},
                        ),
                      ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                ),
                if (!loggedIn)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: wrapWithModel(
                      model: _model.botonQuintoModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'clr5fsyx' /* Reto-Gymkana */,
                        ),
                        accion: () async {},
                      ),
                    ),
                  ),
                wrapWithModel(
                  model: _model.botonQuintoModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'xl35jx67' /* Analisis demografico usuarios */,
                    ),
                    accion: () async {},
                  ),
                ),
                if (!loggedIn)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 30.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7jr2trll' /* Medallas PoAp */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
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
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 30.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kw3p2a38' /*  (prueba de asistencia) */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!loggedIn)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.botonQuintoModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'qe3fu7w9' /* Crear Medalla POAP */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'HERRAMIENTAS_PROMOCION_Container_1meyrh6');
                          logFirebaseEvent('botonQuinto_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
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
                if (!loggedIn)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.botonQuintoModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'anenfxgi' /* Medallas Activas */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'HERRAMIENTAS_PROMOCION_Container_xt5n12r');
                          logFirebaseEvent('botonQuinto_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
