import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/boton1/boton1_widget.dart';
import '/components/mas_opciones/mas_opciones_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'crear_cuenta_telefono_validacion_model.dart';
export 'crear_cuenta_telefono_validacion_model.dart';

class CrearCuentaTelefonoValidacionWidget extends StatefulWidget {
  const CrearCuentaTelefonoValidacionWidget({super.key});

  @override
  State<CrearCuentaTelefonoValidacionWidget> createState() =>
      _CrearCuentaTelefonoValidacionWidgetState();
}

class _CrearCuentaTelefonoValidacionWidgetState
    extends State<CrearCuentaTelefonoValidacionWidget> {
  late CrearCuentaTelefonoValidacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearCuentaTelefonoValidacionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'crearCuentaTelefonoValidacion'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREAR_CUENTA_TELEFONO_VALIDACION_crearCu');
      logFirebaseEvent('crearCuentaTelefonoValidacion_timer');
      _model.timerController.onStartTimer();
      while (_model.confirmacion == 'SinConfirmar') {
        logFirebaseEvent('crearCuentaTelefonoValidacion_wait__dela');
        await Future.delayed(const Duration(milliseconds: 120000));
        logFirebaseEvent('crearCuentaTelefonoValidacion_timer');
        _model.timerController.onResetTimer();

        logFirebaseEvent('crearCuentaTelefonoValidacion_timer');
        _model.timerController.onStartTimer();
      }
    });

    authManager.handlePhoneAuthStateChanges(context);
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'exdvfadm' /* Crear Cuenta */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).displaySmallFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).displaySmallFamily),
                      ),
                ),
              ],
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(37.0, 16.0, 37.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Ingresa el código que enviamos por SMS a ${FFAppState().phoneNumber}:',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 100.0,
                            child: custom_widgets.RoundedWithShadow(
                              width: double.infinity,
                              height: 100.0,
                              codigoPin: (valorDelCodigo) async {
                                logFirebaseEvent(
                                    'CREAR_CUENTA_TELEFONO_VALIDACION_Contain');
                                logFirebaseEvent(
                                    'RoundedWithShadow_update_page_state');
                                _model.codigo = valorDelCodigo;
                                safeSetState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterFlowTimer(
                        initialTime: _model.timerInitialTimeMs,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        updateStateInterval: const Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) safeSetState(() {});
                        },
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w200,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineSmallFamily),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'x2ytelhm' /* ¿No recibiste un SMS? */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CREAR_CUENTA_TELEFONO_VALIDACION_Contain');
                            logFirebaseEvent('Container_auth');
                            final phoneNumberVal = FFAppState().phoneNumber;
                            if (phoneNumberVal.isEmpty ||
                                !phoneNumberVal.startsWith('+')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Phone Number is required and has to start with +.'),
                                ),
                              );
                              return;
                            }
                            await authManager.beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberVal,
                              onCodeSent: (context) async {
                                context.goNamedAuth(
                                  'ingresaTelefonoValidacion',
                                  context.mounted,
                                  ignoreRedirect: true,
                                );
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sv27xsus' /* Enviar de nuevo */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CREAR_CUENTA_TELEFONO_VALIDACION_Text_lc');
                          logFirebaseEvent('Text_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: const Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const SizedBox(
                                      height: 420.0,
                                      child: MasOpcionesWidget(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '7iao7kz6' /* Más opciones */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.boton1Model,
                  updateCallback: () => safeSetState(() {}),
                  child: Boton1Widget(
                    texto: 'Continuar',
                    desabilitado: false,
                    accion: () async {
                      logFirebaseEvent(
                          'CREAR_CUENTA_TELEFONO_VALIDACION_Contain');
                      logFirebaseEvent('boton1_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      final smsCodeVal = _model.codigo;
                      if (smsCodeVal == null || smsCodeVal.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter SMS verification code.'),
                          ),
                        );
                        return;
                      }
                      final phoneVerifiedUser = await authManager.verifySmsCode(
                        context: context,
                        smsCode: smsCodeVal,
                      );
                      if (phoneVerifiedUser == null) {
                        return;
                      }

                      logFirebaseEvent('boton1_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        displayName: FFAppState().userName,
                        createdTime: getCurrentTimestamp,
                        phoneNumber: FFAppState().phoneNumber,
                        userName: FFAppState().userName,
                        isProfileComplete: false,
                        isAccountCreateWithPhone: true,
                        referente: FFAppState().referente,
                        cuentaPrivada: false,
                      ));
                      logFirebaseEvent('boton1_update_app_state');
                      FFAppState().inicioSesion = '';
                      FFAppState().userName = '';
                      FFAppState().update(() {});
                      logFirebaseEvent('boton1_update_app_state');
                      FFAppState().phoneNumber = '';
                      FFAppState().crearCuentaTelefono = true;
                      FFAppState().update(() {});
                      logFirebaseEvent('boton1_update_app_state');
                      FFAppState().temporalContrasena = '';
                      FFAppState().update(() {});
                      logFirebaseEvent('boton1_navigate_to');

                      context.pushNamedAuth('Intereses', context.mounted);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
