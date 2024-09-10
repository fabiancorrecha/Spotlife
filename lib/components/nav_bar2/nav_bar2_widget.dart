import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_bar2_model.dart';
export 'nav_bar2_model.dart';

class NavBar2Widget extends StatefulWidget {
  const NavBar2Widget({
    super.key,
    int? tab,
    this.otroUsuario,
  }) : tab = tab ?? 0;

  final int tab;
  final DocumentReference? otroUsuario;

  @override
  State<NavBar2Widget> createState() => _NavBar2WidgetState();
}

class _NavBar2WidgetState extends State<NavBar2Widget> {
  late NavBar2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 64.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
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
                  logFirebaseEvent('NAV_BAR2_COMP_Stack_md37l49z_ON_TAP');
                  if (widget.tab != 0) {
                    if (widget.otroUsuario != null) {
                      logFirebaseEvent('Stack_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'otroPerfil',
                        queryParameters: {
                          'perfilAjeno': serializeParam(
                            widget.otroUsuario,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      logFirebaseEvent('Stack_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'perfilPropio',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  }
                },
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (widget.tab != 0)
                      Icon(
                        FFIcons.kpinLines,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 32.0,
                      ),
                    if (widget.tab == 0)
                      Icon(
                        FFIcons.kpinFilled,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 32.0,
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
                  logFirebaseEvent('NAV_BAR2_COMP_Stack_q76ij56l_ON_TAP');
                  if (widget.tab != 1) {
                    if (widget.otroUsuario != null) {
                      logFirebaseEvent('Stack_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'otroPerfilMapa',
                        queryParameters: {
                          'usuario': serializeParam(
                            widget.otroUsuario,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      logFirebaseEvent('Stack_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'miperfilMapa',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  }
                },
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (widget.tab != 1)
                      Icon(
                        FFIcons.kframe169,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 29.0,
                      ),
                    if (widget.tab == 1)
                      Icon(
                        FFIcons.kmapFilled,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 29.0,
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
                  logFirebaseEvent('NAV_BAR2_COMP_Stack_e5xh04b5_ON_TAP');
                  if (widget.tab != 2) {
                    if (widget.otroUsuario != null) {
                      logFirebaseEvent('Stack_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'otroPerfilColecciones',
                        queryParameters: {
                          'usuario': serializeParam(
                            widget.otroUsuario,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      logFirebaseEvent('Stack_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'miperfilColeciones',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  }
                },
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (widget.tab != 2)
                      Icon(
                        FFIcons.kpageO,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 32.0,
                      ),
                    if (widget.tab == 2)
                      Icon(
                        FFIcons.kpageFill,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 32.0,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
