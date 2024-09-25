import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacidad_old_model.dart';
export 'privacidad_old_model.dart';

class PrivacidadOldWidget extends StatefulWidget {
  const PrivacidadOldWidget({super.key});

  @override
  State<PrivacidadOldWidget> createState() => _PrivacidadOldWidgetState();
}

class _PrivacidadOldWidgetState extends State<PrivacidadOldWidget> {
  late PrivacidadOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacidadOldModel());

    _model.switchValue =
        valueOrDefault<bool>(currentUserDocument?.cuentaPrivada, false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                          'PRIVACIDAD_OLD_COMP_Card_rjmp117x_ON_TAP');
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
                      'gunw8ts6' /* Privacidad */,
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
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ctlxpn5c' /* Privacidad cuenta */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).displaySmallFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).displaySmallFamily),
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: 316.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: const Color(0xFF333333),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'liefqzm1' /* Cuenta privada */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Switch.adaptive(
                                  value: _model.switchValue!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue = newValue);
                                    if (newValue) {
                                      logFirebaseEvent(
                                          'PRIVACIDAD_OLD_Switch_h19z6yiz_ON_TOGGLE');
                                      logFirebaseEvent('Switch_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        cuentaPrivada: true,
                                      ));
                                    } else {
                                      logFirebaseEvent(
                                          'PRIVACIDAD_OLD_Switch_h19z6yiz_ON_TOGGLE');
                                      logFirebaseEvent('Switch_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        cuentaPrivada: false,
                                      ));
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!loggedIn)
                    wrapWithModel(
                      model: _model.botonQuintoModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'skf4b9bj' /* Privacidad Colecciones */,
                        ),
                        accion: () async {},
                      ),
                    ),
                  if (!loggedIn)
                    wrapWithModel(
                      model: _model.botonQuintoModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'tvtdh1md' /* Privacidad Spots */,
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'yoq9487e' /* Conexiones */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).displaySmallFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).displaySmallFamily),
                      ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.botonQuintoModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'h2f223ry' /* Usuarios bloqueados */,
                    ),
                    accion: () async {
                      logFirebaseEvent(
                          'PRIVACIDAD_OLD_Container_5qawsx3r_CALLBA');
                      logFirebaseEvent('botonQuinto_navigate_to');

                      context.pushNamed('cuentasBloqueadas');
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
