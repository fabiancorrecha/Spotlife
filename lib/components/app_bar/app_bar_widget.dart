import '/auth/firebase_auth/auth_util.dart';
import '/components/tipo_de_post/tipo_de_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      children: [
        Container(
          height: 40.0,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 118.0,
                  height: 47.0,
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    'assets/images/Spotlife_logo_white.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'APP_BAR_COMP_Container_xaebcbie_ON_TAP');
                        logFirebaseEvent('Container_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const SizedBox(
                                  height: 225.0,
                                  child: TipoDePostWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).fondoIcono,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          FFIcons.kadd,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: Stack(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'APP_BAR_COMP_Container_7fjbkssg_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed('notificaciones');
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).fondoIcono,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              FFIcons.kframe166,
                              color: FlutterFlowTheme.of(context).icono,
                              size: 20.0,
                            ),
                          ),
                        ),
                        if ((valueOrDefault(
                                    currentUserDocument?.numeroNotiticaciones,
                                    0) !=
                                null) &&
                            (valueOrDefault(
                                    currentUserDocument?.numeroNotiticaciones,
                                    0) >
                                0))
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  shape: BoxShape.circle,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    valueOrDefault(
                                                currentUserDocument
                                                    ?.numeroNotiticaciones,
                                                0) >
                                            9
                                        ? '+9'
                                        : valueOrDefault(
                                                currentUserDocument
                                                    ?.numeroNotiticaciones,
                                                0)
                                            .toString(),
                                    '0',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 8.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'APP_BAR_COMP_Container_b5w4ibo0_ON_TAP');
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed('TodosLosChats');
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).fondoIcono,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          FFIcons.kmessageSquare,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
