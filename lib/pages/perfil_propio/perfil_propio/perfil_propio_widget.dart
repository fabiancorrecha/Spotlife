import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar_perfil_propio/nav_bar_perfil_propio_widget.dart';
import '/components/post_grid_usuario/post_grid_usuario_widget.dart';
import '/components/tarjeta_mi_perfil/tarjeta_mi_perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/perfil_propio.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
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
                    wrapWithModel(
                      model: _model.navBarPerfilPropioModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBarPerfilPropioWidget(
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: wrapWithModel(
                        model: _model.navBar1Model,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavBar1Widget(
                          tabActiva: 3,
                        ),
                      ).addWalkthrough(
                        containerJ0ammthe,
                        _model.perfilPropioController,
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
