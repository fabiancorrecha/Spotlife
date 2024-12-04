import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crear_cuenta_options_model.dart';
export 'crear_cuenta_options_model.dart';

class CrearCuentaOptionsWidget extends StatefulWidget {
  const CrearCuentaOptionsWidget({super.key});

  @override
  State<CrearCuentaOptionsWidget> createState() =>
      _CrearCuentaOptionsWidgetState();
}

class _CrearCuentaOptionsWidgetState extends State<CrearCuentaOptionsWidget> {
  late CrearCuentaOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearCuentaOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (FFAppState().inicioSesion != 'correo')
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: SizedBox(
                  width: 316.0,
                  height: 54.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREAR_CUENTA_OPTIONS_CONTINA_CON_CORREO_');
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().inicioSesion = 'correo';
                            FFAppState().update(() {});
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('creaCuentaUserName-Correo');
                          },
                          text: FFLocalizations.of(context).getText(
                            'x52yy6hl' /* Continúa con Correo       */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            elevation: 4.0,
                            borderSide: const BorderSide(
                              color: Color(0xFF333333),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.83, 0.0),
                        child: Image.asset(
                          'assets/images/mail_(1)_1.png',
                          width: 22.0,
                          height: 22.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (FFAppState().inicioSesion == 'correo')
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: SizedBox(
                  width: 316.0,
                  height: 54.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREAR_CUENTA_OPTIONS_CONTINA_CON_TELFONO');
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().inicioSesion = '';
                            FFAppState().update(() {});
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('creaCuentaUserName-telefono');
                          },
                          text: FFLocalizations.of(context).getText(
                            '95d0f406' /* Continúa con Teléfono    */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            elevation: 4.0,
                            borderSide: const BorderSide(
                              color: Color(0xFF333333),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.83, 0.0),
                        child: Image.asset(
                          'assets/images/phone_1_(1).png',
                          width: 22.0,
                          height: 22.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (isiOS)
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: SizedBox(
                  width: 316.0,
                  height: 54.0,
                  child: Stack(
                    children: [
                      isAndroid
                          ? Container()
                          : Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CREAR_CUENTA_OPTIONS_CONTINA_CON_APPLE_B');
                                  logFirebaseEvent('Button_auth');
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInWithApple(context);
                                  if (user == null) {
                                    return;
                                  }
                                  logFirebaseEvent('Button_backend_call');

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    referente: FFAppState().referente,
                                    cuentaPrivada: false,
                                  ));
                                  logFirebaseEvent('Button_backend_call');

                                  await FFAppState().referente!.update({
                                    ...mapToFirestore(
                                      {
                                        'listaReferidos': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamedAuth(
                                      'FechadeNacimiento', context.mounted);
                                },
                                text: FFLocalizations.of(context).getText(
                                  'd8p1tu7k' /* Continúa con Apple         */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  elevation: 4.0,
                                  borderSide: const BorderSide(
                                    color: Color(0xFF333333),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                      Align(
                        alignment: const AlignmentDirectional(-0.83, 0.0),
                        child: Image.asset(
                          'assets/images/apple_(1)_1.png',
                          width: 25.0,
                          height: 22.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: SizedBox(
                width: 316.0,
                height: 54.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CREAR_CUENTA_OPTIONS_CONTINA_CON_GOOGLE_');
                          logFirebaseEvent('Button_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final user =
                              await authManager.signInWithGoogle(context);
                          if (user == null) {
                            return;
                          }
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            referente: FFAppState().referente,
                            cuentaPrivada: false,
                          ));
                          logFirebaseEvent('Button_backend_call');

                          await FFAppState().referente!.update({
                            ...mapToFirestore(
                              {
                                'listaReferidos': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              },
                            ),
                          });
                          logFirebaseEvent('Button_navigate_to');

                          context.goNamedAuth(
                            'FechadeNacimiento',
                            context.mounted,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'j8kwu2qj' /* Continúa con Google      */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: double.infinity,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          elevation: 4.0,
                          borderSide: const BorderSide(
                            color: Color(0xFF333333),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.83, 0.0),
                      child: Container(
                        width: 22.0,
                        height: 22.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
