import '/auth/firebase_auth/auth_util.dart';
import '/components/boton3/boton3_widget.dart';
import '/components/boton4/boton4_widget.dart';
import '/components/configuracion_old/configuracion_old_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ajustes_usuario_principal_copy_model.dart';
export 'ajustes_usuario_principal_copy_model.dart';

class AjustesUsuarioPrincipalCopyWidget extends StatefulWidget {
  const AjustesUsuarioPrincipalCopyWidget({super.key});

  @override
  State<AjustesUsuarioPrincipalCopyWidget> createState() =>
      _AjustesUsuarioPrincipalCopyWidgetState();
}

class _AjustesUsuarioPrincipalCopyWidgetState
    extends State<AjustesUsuarioPrincipalCopyWidget> {
  late AjustesUsuarioPrincipalCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjustesUsuarioPrincipalCopyModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          FFIcons.kadd,
                          color: Color(0x00FAF7FA),
                          size: 12.0,
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'jslugmnh' /* Ajustes */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'AJUSTES_USUARIO_PRINCIPAL_COPY_Card_cvsv');
                        logFirebaseEvent('Card_bottom_sheet');
                        Navigator.pop(context);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).fondoIcono,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).icono,
                            size: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model1,
                      updateCallback: () => safeSetState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.ksettings,
                          color: FlutterFlowTheme.of(context).icono,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'zlkdepbg' /* Configuración */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'AJUSTES_USUARIO_PRINCIPAL_COPY_Container');
                          logFirebaseEvent('boton3_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: const Color(0x00000000),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const SizedBox(
                                    height: 600.0,
                                    child: ConfiguracionOldWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model2,
                      updateCallback: () => safeSetState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.ksignal,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'fdtnomtq' /* Actividad */,
                        ),
                        accion: () async {},
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model3,
                      updateCallback: () => safeSetState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.kstarLines,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'itx2v87z' /* Mis favoritos */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'AJUSTES_USUARIO_PRINCIPAL_COPY_Container');
                          logFirebaseEvent('boton3_navigate_to');

                          context.pushNamed('ajustes_Favoritos');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model4,
                      updateCallback: () => safeSetState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.kusers,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'iv6bnvyc' /* Mis mejores amigos */,
                        ),
                        accion: () async {},
                      ),
                    ),
                  ),
                  if ((FFAppState().ocultar == true) &&
                      responsiveVisibility(
                        context: context,
                        tablet: false,
                      ))
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.boton3Model5,
                        updateCallback: () => safeSetState(() {}),
                        child: Boton3Widget(
                          icono: Icon(
                            FFIcons.kcard,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          texto: FFLocalizations.of(context).getText(
                            'u08qk50w' /* Pedidos y pagos */,
                          ),
                          accion: () async {},
                        ),
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model6,
                      updateCallback: () => safeSetState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.kimbox,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'oz6twse4' /* Feedback */,
                        ),
                        accion: () async {},
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.boton4Model1,
                      updateCallback: () => safeSetState(() {}),
                      child: Boton4Widget(
                        icono: Icon(
                          FFIcons.kaddUser,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'txyrveh4' /* Añadir cuenta */,
                        ),
                        isLogout: false,
                        accion: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.boton4Model2,
                      updateCallback: () => safeSetState(() {}),
                      child: Boton4Widget(
                        icono: Icon(
                          FFIcons.klogOut,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20.0,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'nuv3xh98' /* Salir de Cuenta */,
                        ),
                        isLogout: true,
                        accion: () async {
                          logFirebaseEvent(
                              'AJUSTES_USUARIO_PRINCIPAL_COPY_Container');
                          logFirebaseEvent('boton4_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('inicio', context.mounted);
                        },
                      ),
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
