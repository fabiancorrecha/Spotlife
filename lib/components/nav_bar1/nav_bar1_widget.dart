import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'nav_bar1_model.dart';
export 'nav_bar1_model.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({
    super.key,
    this.tabActiva,
  });

  final int? tabActiva;

  @override
  State<NavBar1Widget> createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget> {
  late NavBar1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Necesitamos el parámetro "Tab Activa"con valor 1, 2 o 3 para saber qué icono debe estar activo o en que sección nos encontramos
        Container(
      width: double.infinity,
      height: 72.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(48.0, 0.0, 48.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NAV_BAR1_COMP_Stack_dbv7f8ya_ON_TAP');
                  if (widget.tabActiva != 2) {
                    logFirebaseEvent('Stack_navigate_to');

                    context.pushNamed(
                      'mapaPrincipal',
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
                    if (widget.tabActiva != 2)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 0.0, 0.0),
                        child: Icon(
                          FFIcons.kspotlife,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 35.0,
                        ),
                      ),
                    if (widget.tabActiva == 2)
                      Image.asset(
                        'assets/images/Vector_(2)_(1).png',
                        width: 35.0,
                        height: 35.0,
                        fit: BoxFit.contain,
                      ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('NAV_BAR1_COMP_Stack_y2oxteh1_ON_TAP');
                if (widget.tabActiva != 1) {
                  logFirebaseEvent('Stack_navigate_to');

                  context.pushNamed(
                    'Feed',
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
                children: [
                  if (widget.tabActiva != 1)
                    Icon(
                      FFIcons.kcollection,
                      color: FlutterFlowTheme.of(context).icono,
                      size: 34.0,
                    ),
                  if (widget.tabActiva == 1)
                    Image.asset(
                      'assets/images/coleccion.png',
                      width: 35.0,
                      height: 35.0,
                      fit: BoxFit.contain,
                    ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NAV_BAR1_COMP_Stack_i0e5z6kw_ON_TAP');
                  if (widget.tabActiva != 4) {
                    logFirebaseEvent('Stack_navigate_to');

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
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (widget.tabActiva != 4)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          FFIcons.ksearch,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 36.0,
                        ),
                      ),
                    if (widget.tabActiva == 4)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                        child: Image.asset(
                          'assets/images/search_(2)_2_(1).png',
                          width: 42.0,
                          height: 42.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('NAV_BAR1_COMP_Stack_hjmtqsvg_ON_TAP');
                if (widget.tabActiva != 3) {
                  logFirebaseEvent('Stack_navigate_to');

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
                children: [
                  if (widget.tabActiva == 3)
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).customSeleccion
                          ],
                          stops: const [0.0, 0.8, 1.0],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).secondary
                              ],
                              stops: const [0.0, 1.0],
                              begin: const AlignmentDirectional(0.0, -1.0),
                              end: const AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Visibility(
                            visible: currentUserPhoto != '',
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (widget.tabActiva != 3)
                    AuthUserStreamWidget(
                      builder: (context) => Container(
                        width: 40.0,
                        height: 40.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 500),
                          fadeOutDuration: const Duration(milliseconds: 500),
                          imageUrl: valueOrDefault<String>(
                            currentUserPhoto,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
