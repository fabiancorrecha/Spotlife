import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 32.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('MENU02_COMP_Icon_xpdkn9j7_ON_TAP');
                      if (widget.seccion != 1) {
                        logFirebaseEvent('Icon_navigate_to');
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
                    child: Icon(
                      FFIcons.kimages,
                      color: valueOrDefault<Color>(
                        widget.seccion == 1
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).accent4,
                        FlutterFlowTheme.of(context).accent4,
                      ),
                      size: 32.0,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('MENU02_COMP_Icon_vx8d4fq1_ON_TAP');
                      if (widget.seccion != 2) {
                        logFirebaseEvent('Icon_navigate_to');
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
                    child: Icon(
                      FFIcons.kframe172,
                      color: valueOrDefault<Color>(
                        widget.seccion == 2
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).accent4,
                        FlutterFlowTheme.of(context).accent4,
                      ),
                      size: 32.0,
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
              Icon(
                FFIcons.kmountains,
                color: valueOrDefault<Color>(
                  widget.seccion == 4
                      ? FlutterFlowTheme.of(context).primaryText
                      : FlutterFlowTheme.of(context).accent4,
                  FlutterFlowTheme.of(context).accent4,
                ),
                size: 32.0,
              ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MENU02_COMP_Icon_qr10nhhd_ON_TAP');
                  if (widget.seccion != 3) {
                    logFirebaseEvent('Icon_navigate_to');

                    context.pushNamed('buscarLugares');
                  }
                },
                child: Icon(
                  FFIcons.kpinLines,
                  color: valueOrDefault<Color>(
                    widget.seccion == 3
                        ? FlutterFlowTheme.of(context).primaryText
                        : FlutterFlowTheme.of(context).accent4,
                    FlutterFlowTheme.of(context).accent4,
                  ),
                  size: 32.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
