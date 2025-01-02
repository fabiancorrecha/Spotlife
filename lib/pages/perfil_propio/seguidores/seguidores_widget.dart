import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/tarjeta_lista01/tarjeta_lista01_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'seguidores_model.dart';
export 'seguidores_model.dart';

class SeguidoresWidget extends StatefulWidget {
  const SeguidoresWidget({
    super.key,
    this.usuario,
  });

  final DocumentReference? usuario;

  @override
  State<SeguidoresWidget> createState() => _SeguidoresWidgetState();
}

class _SeguidoresWidgetState extends State<SeguidoresWidget>
    with TickerProviderStateMixin {
  late SeguidoresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasListViewTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeguidoresModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'seguidores'});
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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

        final seguidoresUsersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 110.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (seguidoresUsersRecord.listaSeguidores.isNotEmpty)
                              Builder(
                                builder: (context) {
                                  final seguidores = seguidoresUsersRecord
                                      .listaSeguidores
                                      .map((e) => e)
                                      .toList();
                                  if (seguidores.isEmpty) {
                                    return const ComponenteVacioWidget();
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
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
                                updateCallback: () => safeSetState(() {}),
                                child: const UsuariosRecomendadosWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'usuariosRecomendadosOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 72.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 50.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).icono,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SEGUIDORES_PAGE_chevron_left_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                            Expanded(
                              child: Text(
                                seguidoresUsersRecord.displayName,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 18.0,
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
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
                        child: wrapWithModel(
                          model: _model.navBar1Model,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavBar1Widget(
                            tabActiva: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
