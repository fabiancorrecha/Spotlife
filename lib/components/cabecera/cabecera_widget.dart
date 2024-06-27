import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cabecera_model.dart';
export 'cabecera_model.dart';

class CabeceraWidget extends StatefulWidget {
  const CabeceraWidget({
    super.key,
    int? seccion,
  }) : this.seccion = seccion ?? 0;

  final int seccion;

  @override
  State<CabeceraWidget> createState() => _CabeceraWidgetState();
}

class _CabeceraWidgetState extends State<CabeceraWidget> {
  late CabeceraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CabeceraModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('CABECERA_COMP_Card_q4yy1res_ON_TAP');
                    logFirebaseEvent('Card_navigate_back');
                    context.pop();
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
                Expanded(
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'zpm2qs23' /* Mis favoritos */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
                        ),
                  ),
                ),
              ],
            ),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      if (widget.seccion == 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('CABECERA_COMP_IconON_ON_TAP');
                              if (widget.seccion != 0) {
                                logFirebaseEvent('IconON_navigate_to');
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'ajustes_Favoritos',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              }
                            },
                            child: Icon(
                              FFIcons.kcollection,
                              color: FlutterFlowTheme.of(context).icono,
                              size: 32.0,
                            ),
                          ),
                        ),
                      if (widget.seccion != 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('CABECERA_COMP_IconOFF_ON_TAP');
                              if (widget.seccion != 0) {
                                logFirebaseEvent('IconOFF_navigate_to');
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'ajustes_Favoritos',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              }
                            },
                            child: Icon(
                              FFIcons.kgrid,
                              color: FlutterFlowTheme.of(context).icono,
                              size: 32.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Stack(
                    children: [
                      if (widget.seccion != 1)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Icon(
                            FFIcons.kpageO,
                            color: FlutterFlowTheme.of(context).icono,
                            size: 32.0,
                          ),
                        ),
                      if (widget.seccion == 1)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Icon(
                            FFIcons.kpageFill,
                            color: FlutterFlowTheme.of(context).icono,
                            size: 32.0,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
