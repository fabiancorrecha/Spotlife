import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/components/post_grid_usuario/post_grid_usuario_widget.dart';
import '/components/tarjeta_mi_perfil/tarjeta_mi_perfil_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/perfil_propio.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'perfil_propio_model.dart';
export 'perfil_propio_model.dart';

class PerfilPropioWidget extends StatefulWidget {
  const PerfilPropioWidget({super.key});

  @override
  State<PerfilPropioWidget> createState() => _PerfilPropioWidgetState();
}

class _PerfilPropioWidgetState extends State<PerfilPropioWidget> {
  late PerfilPropioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilPropioModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'perfilPropio'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.tarjetaMiPerfilModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TarjetaMiPerfilWidget(
                          usuario: currentUserReference,
                        ),
                      ).addWalkthrough(
                        containerT7zd4lzn,
                        _model.perfilPropioController,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PERFIL_PROPIO_EDITAR_PERFIL_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed('miPerfilEditarPerfil');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'ut3nex3h' /* Editar perfil */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 150.0,
                                      height: 35.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .fondoIcono,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.navBar2Model,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavBar2Widget(
                          tab: 0,
                        ),
                      ).addWalkthrough(
                        containerBe24rl6p,
                        _model.perfilPropioController,
                      ),
                      Expanded(
                        child: StreamBuilder<List<UserPostsRecord>>(
                          stream: queryUserPostsRecord(
                            queryBuilder: (userPostsRecord) => userPostsRecord
                                .where(
                                  'postUser',
                                  isEqualTo: currentUserReference,
                                )
                                .orderBy('timePosted', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UserPostsRecord>
                                postGridUsuarioUserPostsRecordList =
                                snapshot.data!;

                            return wrapWithModel(
                              model: _model.postGridUsuarioModel,
                              updateCallback: () => safeSetState(() {}),
                              child: PostGridUsuarioWidget(
                                usuario: currentUserReference,
                              ),
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.navBar1Model,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavBar1Widget(
                          tabActiva: 3,
                        ),
                      ).addWalkthrough(
                        containerJ0ammthe,
                        _model.perfilPropioController,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -0.94),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PERFIL_PROPIO_PAGE_Card_u5zy3y2r_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.goNamed('mapaPrincipal');
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
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -0.78),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: const Color(0x00F4F176),
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: const Color(0x00EEEEEE),
                          icon: Icon(
                            Icons.help,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'PERFIL_PROPIO_PAGE_help_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_start_walkthrough');
                            safeSetState(() => _model.perfilPropioController =
                                createPageWalkthrough(context));
                            _model.perfilPropioController
                                ?.show(context: context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.perfilPropioController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
