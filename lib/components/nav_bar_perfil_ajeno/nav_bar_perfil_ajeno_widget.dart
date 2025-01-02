import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'nav_bar_perfil_ajeno_model.dart';
export 'nav_bar_perfil_ajeno_model.dart';

class NavBarPerfilAjenoWidget extends StatefulWidget {
  const NavBarPerfilAjenoWidget({
    super.key,
    int? tab,
    this.otroUsuario,
  }) : tab = tab ?? 0;

  final int tab;
  final DocumentReference? otroUsuario;

  @override
  State<NavBarPerfilAjenoWidget> createState() =>
      _NavBarPerfilAjenoWidgetState();
}

class _NavBarPerfilAjenoWidgetState extends State<NavBarPerfilAjenoWidget> {
  late NavBarPerfilAjenoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarPerfilAjenoModel());

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
                  logFirebaseEvent('NAV_BAR_PERFIL_AJENO_Stack_u8q6y74w_ON_T');
                  if (widget.tab != 0) {
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
                  logFirebaseEvent('NAV_BAR_PERFIL_AJENO_Stack_fnut34ln_ON_T');
                  if (widget.tab != 1) {
                    logFirebaseEvent('Stack_firestore_query');
                    _model.readCollection = await queryCollectionsRecordOnce(
                      queryBuilder: (collectionsRecord) =>
                          collectionsRecord.where(
                        'createdBy',
                        isEqualTo: widget.otroUsuario,
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    logFirebaseEvent('Stack_firestore_query');
                    _model.allColecction = await queryCollectionsRecordOnce(
                      queryBuilder: (collectionsRecord) =>
                          collectionsRecord.where(
                        'createdBy',
                        isEqualTo: widget.otroUsuario,
                      ),
                    );
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
                        'userPost': serializeParam(
                          _model.readCollection?.postuUserList,
                          ParamType.DocumentReference,
                          isList: true,
                        ),
                        'colecccion': serializeParam(
                          _model.allColecction,
                          ParamType.Document,
                          isList: true,
                        ),
                        'refColeccion': serializeParam(
                          _model.readCollection?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'colecccion': _model.allColecction,
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  }

                  safeSetState(() {});
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
                  logFirebaseEvent('NAV_BAR_PERFIL_AJENO_Stack_bozqr61w_ON_T');
                  if (widget.tab != 2) {
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
                  logFirebaseEvent('NAV_BAR_PERFIL_AJENO_Stack_9vgi91xd_ON_T');
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
