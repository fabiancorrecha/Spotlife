import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacidad_cuenta_model.dart';
export 'privacidad_cuenta_model.dart';

class PrivacidadCuentaWidget extends StatefulWidget {
  const PrivacidadCuentaWidget({super.key});

  @override
  State<PrivacidadCuentaWidget> createState() => _PrivacidadCuentaWidgetState();
}

class _PrivacidadCuentaWidgetState extends State<PrivacidadCuentaWidget> {
  late PrivacidadCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacidadCuentaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'privacidad_cuenta'});
    _model.switchValue = true;
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(37.0, 0.0, 37.0, 34.0),
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
                              'PRIVACIDAD_CUENTA_Card_tbmfi27j_ON_TAP');
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
                          '6lb7kr0n' /* Privacidad */,
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
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jakfw2n2' /* Privacidad cuenta */,
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
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.botonQuintoModel1,
                                updateCallback: () => setState(() {}),
                                child: BotonQuintoWidget(
                                  texto: FFLocalizations.of(context).getText(
                                    'l3wjec69' /* Cuenta privada */,
                                  ),
                                  accion: () async {},
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.83, 0.53),
                              child: Switch.adaptive(
                                value: _model.switchValue!,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.switchValue = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).accent1,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel2,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            'bhy2b27n' /* Privacidad Colecciones */,
                          ),
                          accion: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.botonQuintoModel3,
                        updateCallback: () => setState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            '21ymigci' /* Privacidad Spots */,
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
                        'epc9midk' /* Conexiones */,
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.botonQuintoModel4,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'sc6f29o3' /* Usuarios bloqueados */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'PRIVACIDAD_CUENTA_Container_ng7n5h9r_CAL');
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
        ),
      ),
    );
  }
}
