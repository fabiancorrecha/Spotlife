import '/backend/backend.dart';
import '/components/app_bar4/app_bar4_widget.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/tarjeta_lista01/tarjeta_lista01_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'seguidores_y_seguidos_model.dart';
export 'seguidores_y_seguidos_model.dart';

class SeguidoresYSeguidosWidget extends StatefulWidget {
  const SeguidoresYSeguidosWidget({
    super.key,
    this.usuario,
  });

  final DocumentReference? usuario;

  @override
  State<SeguidoresYSeguidosWidget> createState() =>
      _SeguidoresYSeguidosWidgetState();
}

class _SeguidoresYSeguidosWidgetState extends State<SeguidoresYSeguidosWidget>
    with TickerProviderStateMixin {
  late SeguidoresYSeguidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasListViewTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeguidoresYSeguidosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'seguidoresYSeguidos'});
    animationsMap.addAll({
      'listViewOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'usuariosRecomendadosOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.usuario!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
            ),
          );
        }
        final seguidoresYSeguidosUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.appBar4Model,
                      updateCallback: () => setState(() {}),
                      child: AppBar4Widget(
                        textValue: seguidoresYSeguidosUsersRecord.displayName,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 32.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEGUIDORES_Y_SEGUIDOS_PAGE_Follow_ON_TAP');
                                    logFirebaseEvent('Follow_update_app_state');
                                    FFAppState().indexTabFollow = '0';
                                    FFAppState().update(() {});
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'f28uqetd' /* Seguidos */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FFAppState().indexTabFollow == '0'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEGUIDORES_Y_SEGUIDOS_Followers_ON_TAP');
                                    logFirebaseEvent(
                                        'Followers_update_app_state');
                                    FFAppState().indexTabFollow = '1';
                                    FFAppState().update(() {});
                                    logFirebaseEvent(
                                        'Followers_widget_animation');
                                    if (animationsMap[
                                            'listViewOnActionTriggerAnimation'] !=
                                        null) {
                                      setState(
                                          () => hasListViewTriggered = true);
                                      SchedulerBinding.instance
                                          .addPostFrameCallback((_) async =>
                                              await animationsMap[
                                                      'listViewOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0));
                                    }
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'pdl9i1w2' /* Seguidores */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FFAppState().indexTabFollow == '1'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().indexTabFollow == '0')
                            Builder(
                              builder: (context) {
                                final usuariosSegudos =
                                    seguidoresYSeguidosUsersRecord.listaSeguidos
                                        .map((e) => e)
                                        .toList();
                                if (usuariosSegudos.isEmpty) {
                                  return ComponenteVacioWidget();
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: usuariosSegudos.length,
                                  itemBuilder: (context, usuariosSegudosIndex) {
                                    final usuariosSegudosItem =
                                        usuariosSegudos[usuariosSegudosIndex];
                                    return TarjetaLista01Widget(
                                      key: Key(
                                          'Key9qi_${usuariosSegudosIndex}_of_${usuariosSegudos.length}'),
                                      mostrarBoton: true,
                                      seguido: usuariosSegudosItem,
                                      textoBtn: 'Siguiendo',
                                    );
                                  },
                                );
                              },
                            ),
                          if (FFAppState().indexTabFollow == '1')
                            Builder(
                              builder: (context) {
                                final seguidores =
                                    seguidoresYSeguidosUsersRecord
                                        .listaSeguidores
                                        .map((e) => e)
                                        .toList();
                                if (seguidores.isEmpty) {
                                  return ComponenteVacioWidget();
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: seguidores.length,
                                  itemBuilder: (context, seguidoresIndex) {
                                    final seguidoresItem =
                                        seguidores[seguidoresIndex];
                                    return TarjetaLista01Widget(
                                      key: Key(
                                          'Key27k_${seguidoresIndex}_of_${seguidores.length}'),
                                      mostrarBoton: false,
                                      seguido: seguidoresItem,
                                      textoBtn: 'Siguiendo',
                                    );
                                  },
                                ).animateOnActionTrigger(
                                    animationsMap[
                                        'listViewOnActionTriggerAnimation']!,
                                    hasBeenTriggered: hasListViewTriggered);
                              },
                            ),
                          if (FFAppState().indexTabFollow == '0')
                            wrapWithModel(
                              model: _model.usuariosRecomendadosModel,
                              updateCallback: () => setState(() {}),
                              child: UsuariosRecomendadosWidget(),
                            ).animateOnPageLoad(animationsMap[
                                'usuariosRecomendadosOnPageLoadAnimation']!),
                        ],
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    wrapWithModel(
                      model: _model.navBar1Model,
                      updateCallback: () => setState(() {}),
                      child: NavBar1Widget(
                        tabActiva: 3,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
