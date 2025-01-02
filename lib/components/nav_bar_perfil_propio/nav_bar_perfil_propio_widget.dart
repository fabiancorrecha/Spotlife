import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_bar_perfil_propio_model.dart';
export 'nav_bar_perfil_propio_model.dart';

class NavBarPerfilPropioWidget extends StatefulWidget {
  const NavBarPerfilPropioWidget({
    super.key,
    int? tab,
    this.otroUsuario,
  }) : tab = tab ?? 0;

  final int tab;
  final DocumentReference? otroUsuario;

  @override
  State<NavBarPerfilPropioWidget> createState() =>
      _NavBarPerfilPropioWidgetState();
}

class _NavBarPerfilPropioWidgetState extends State<NavBarPerfilPropioWidget> {
  late NavBarPerfilPropioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarPerfilPropioModel());

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
                  logFirebaseEvent('NAV_BAR_PERFIL_PROPIO_Stack_md37l49z_ON_');
                  if (widget.tab != 0) {
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon_pin_filled_2.png',
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
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
                  logFirebaseEvent('NAV_BAR_PERFIL_PROPIO_Stack_q76ij56l_ON_');
                  if (widget.tab != 1) {
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon_map_filled.png',
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
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
                  logFirebaseEvent('NAV_BAR_PERFIL_PROPIO_Stack_e5xh04b5_ON_');
                  if (widget.tab != 2) {
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
                },
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (widget.tab != 2)
                      Icon(
                        FFIcons.kgrid,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 32.0,
                      ),
                    if (widget.tab == 2)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/coleccion.png',
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
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
                  logFirebaseEvent('NAV_BAR_PERFIL_PROPIO_Stack_pqwewzwu_ON_');
                  if (widget.tab != 2) {
                    logFirebaseEvent('Stack_navigate_to');

                    context.pushNamed(
                      'favoritos',
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
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (widget.tab != 3)
                      Icon(
                        FFIcons.kstarLines,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 32.0,
                      ),
                    if (widget.tab == 3)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon_star_filled.png',
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
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
                  logFirebaseEvent('NAV_BAR_PERFIL_PROPIO_Stack_u21we2cv_ON_');
                  if (widget.tab != 4) {
                    logFirebaseEvent('Stack_navigate_to');

                    context.pushNamed(
                      'PaginaEnContruccion',
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
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (widget.tab != 4)
                      Icon(
                        FFIcons.kiconPoaps,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 32.0,
                      ),
                    if (widget.tab == 4)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/POAPS_Filled.png',
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
                        ),
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
