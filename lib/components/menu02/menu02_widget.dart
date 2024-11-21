import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu02_model.dart';
export 'menu02_model.dart';

class Menu02Widget extends StatefulWidget {
  const Menu02Widget({
    super.key,
    int? seccion,
  }) : seccion = seccion ?? 0;

  final int seccion;

  @override
  State<Menu02Widget> createState() => _Menu02WidgetState();
}

class _Menu02WidgetState extends State<Menu02Widget> {
  late Menu02Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Menu02Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('MENU02_COMP_LUGARES_BTN_ON_TAP');
                if (widget.seccion != 1) {
                  logFirebaseEvent('Button_navigate_to');
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(
                    'buscarSpots',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                }
              },
              text: FFLocalizations.of(context).getText(
                '07cg8q15' /* Lugares */,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: const Color(0x00F4F176),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: valueOrDefault<Color>(
                        widget.seccion == 1
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).accent4,
                        FlutterFlowTheme.of(context).accent4,
                      ),
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('MENU02_COMP_PERSONAS_BTN_ON_TAP');
                if (widget.seccion != 2) {
                  logFirebaseEvent('Button_navigate_to');
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(
                    'buscarPerfil',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                }
              },
              text: FFLocalizations.of(context).getText(
                'fombtlvv' /* Personas */,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: const Color(0x00F4F176),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: valueOrDefault<Color>(
                        widget.seccion == 2
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).accent4,
                        FlutterFlowTheme.of(context).accent4,
                      ),
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.0,
          indent: 39.0,
          endIndent: 39.0,
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ],
    );
  }
}
