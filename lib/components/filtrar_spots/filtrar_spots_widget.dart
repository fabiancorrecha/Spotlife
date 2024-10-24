import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filtrar_spots_model.dart';
export 'filtrar_spots_model.dart';

class FiltrarSpotsWidget extends StatefulWidget {
  const FiltrarSpotsWidget({
    super.key,
    this.post,
  });

  final List<DocumentReference>? post;

  @override
  State<FiltrarSpotsWidget> createState() => _FiltrarSpotsWidgetState();
}

class _FiltrarSpotsWidgetState extends State<FiltrarSpotsWidget> {
  late FiltrarSpotsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltrarSpotsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                  child: Container(
                    width: 52.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).fondoIcono,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'v9vn0pol' /* Ajustes de busqueda */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'FILTRAR_SPOTS_COMP_Row_9t5veyup_ON_TAP');
                        logFirebaseEvent('Row_update_app_state');
                        FFAppState().esVistaPost = false;
                        FFAppState().esVistaAmigos = false;
                        FFAppState().mapaPrincipal = true;
                        FFAppState().Global = false;
                        FFAppState().update(() {});
                        logFirebaseEvent('Row_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('Row_navigate_to');

                        context.goNamed(
                          'mapaPrincipal',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.mapaValue ??=
                                  FFAppState().MapaGlobal,
                              onChanged: (newValue) async {
                                setState(() => _model.mapaValue = newValue!);
                                if (newValue!) {
                                  logFirebaseEvent(
                                      'FILTRAR_SPOTS_COMP_Mapa_ON_TOGGLE_ON');
                                  logFirebaseEvent('Mapa_set_form_field');
                                  setState(() {
                                    _model.mapaValue = true;
                                  });
                                  logFirebaseEvent('Mapa_set_form_field');
                                  setState(() {
                                    _model.spotValue = false;
                                  });
                                  if ((_model.mapaValue == true) &&
                                      (_model.globalValue == true)) {
                                    logFirebaseEvent('Mapa_update_app_state');
                                    FFAppState().MapaGlobal = true;
                                    FFAppState().MapaAmigo = false;
                                    FFAppState().PostGlobal = false;
                                    FFAppState().PostAmigo = false;
                                    FFAppState().update(() {});
                                    return;
                                  } else if ((_model.mapaValue == true) &&
                                      (_model.soloAmigosValue == true)) {
                                    logFirebaseEvent('Mapa_update_app_state');
                                    FFAppState().MapaGlobal = false;
                                    FFAppState().MapaAmigo = true;
                                    FFAppState().PostGlobal = false;
                                    FFAppState().PostAmigo = false;
                                    FFAppState().update(() {});
                                    return;
                                  } else {
                                    return;
                                  }
                                }
                              },
                              side: BorderSide(
                                width: 2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'smbentht' /* Mapa */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              FFIcons.kpinLines,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'FILTRAR_SPOTS_COMP_Row_0z1h89ir_ON_TAP');
                        logFirebaseEvent('Row_update_app_state');
                        FFAppState().esVistaPost = true;
                        FFAppState().mapaPrincipal = false;
                        FFAppState().esVistaAmigos = false;
                        FFAppState().Global = false;
                        FFAppState().update(() {});
                        logFirebaseEvent('Row_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('Row_navigate_to');

                        context.goNamed(
                          'mapaPrincipal',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.spotValue ??=
                                  FFAppState().PostGlobal,
                              onChanged: (newValue) async {
                                setState(() => _model.spotValue = newValue!);
                                if (newValue!) {
                                  logFirebaseEvent(
                                      'FILTRAR_SPOTS_COMP_Spot_ON_TOGGLE_ON');
                                  logFirebaseEvent('Spot_set_form_field');
                                  setState(() {
                                    _model.mapaValue = false;
                                  });
                                  logFirebaseEvent('Spot_set_form_field');
                                  setState(() {
                                    _model.spotValue = true;
                                  });
                                  if ((_model.spotValue == true) &&
                                      (_model.globalValue == true)) {
                                    logFirebaseEvent('Spot_update_app_state');
                                    FFAppState().MapaGlobal = false;
                                    FFAppState().MapaAmigo = false;
                                    FFAppState().PostGlobal = true;
                                    FFAppState().PostAmigo = false;
                                    FFAppState().update(() {});
                                    return;
                                  } else if ((_model.spotValue == true) &&
                                      (_model.soloAmigosValue == true)) {
                                    logFirebaseEvent('Spot_update_app_state');
                                    FFAppState().MapaGlobal = false;
                                    FFAppState().MapaAmigo = false;
                                    FFAppState().PostGlobal = false;
                                    FFAppState().PostAmigo = true;
                                    FFAppState().update(() {});
                                    return;
                                  } else {
                                    return;
                                  }
                                }
                              },
                              side: BorderSide(
                                width: 2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'ldb4fmyg' /* Spots */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              FFIcons.kgrid,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 32.0,
                  thickness: 1.0,
                  indent: 0.0,
                  endIndent: 0.0,
                  color: Color(0x27FAF7FA),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'FILTRAR_SPOTS_COMP_Row_1hirpmb2_ON_TAP');
                        logFirebaseEvent('Row_update_app_state');
                        FFAppState().esVistaAmigos = true;
                        FFAppState().esVistaPost = false;
                        FFAppState().mapaPrincipal = false;
                        FFAppState().Global = false;
                        FFAppState().update(() {});
                        logFirebaseEvent('Row_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('Row_navigate_to');

                        context.goNamed(
                          'mapaPrincipal',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                            child: Checkbox(
                              value: _model.soloAmigosValue ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.soloAmigosValue = newValue!);
                                if (newValue!) {
                                  logFirebaseEvent(
                                      'FILTRAR_SPOTS_SoloAmigos_ON_TOGGLE_ON');
                                  logFirebaseEvent('SoloAmigos_set_form_field');
                                  setState(() {
                                    _model.soloAmigosValue = true;
                                  });
                                  logFirebaseEvent('SoloAmigos_set_form_field');
                                  setState(() {
                                    _model.globalValue = false;
                                  });
                                }
                              },
                              side: BorderSide(
                                width: 2,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'w2lnyvsw' /* Solo Amigos */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              FFIcons.kusers,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'FILTRAR_SPOTS_COMP_Row_t8dqegyg_ON_TAP');
                        logFirebaseEvent('Row_update_app_state');
                        FFAppState().esVistaAmigos = false;
                        FFAppState().esVistaPost = true;
                        FFAppState().mapaPrincipal = false;
                        FFAppState().Global = true;
                        FFAppState().update(() {});
                        logFirebaseEvent('Row_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('Row_navigate_to');

                        context.goNamed(
                          'mapaPrincipal',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                            child: Checkbox(
                              value: _model.globalValue ??= true,
                              onChanged: (newValue) async {
                                setState(() => _model.globalValue = newValue!);
                                if (newValue!) {
                                  logFirebaseEvent(
                                      'FILTRAR_SPOTS_COMP_Global_ON_TOGGLE_ON');
                                  logFirebaseEvent('Global_set_form_field');
                                  setState(() {
                                    _model.soloAmigosValue = false;
                                  });
                                  logFirebaseEvent('Global_set_form_field');
                                  setState(() {
                                    _model.globalValue = true;
                                  });
                                }
                              },
                              side: BorderSide(
                                width: 2,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'pfvt1hhr' /* Global */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.globeEurope,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.boton1Model,
                  updateCallback: () => setState(() {}),
                  child: Boton1Widget(
                    texto: 'Listo',
                    desabilitado: false,
                    accion: () async {
                      logFirebaseEvent(
                          'FILTRAR_SPOTS_Container_k2obmszl_CALLBAC');
                      logFirebaseEvent('boton1_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
