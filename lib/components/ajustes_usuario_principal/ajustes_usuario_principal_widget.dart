import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/boton3/boton3_widget.dart';
import '/components/boton4/boton4_widget.dart';
import '/components/configuracion_old/configuracion_old_widget.dart';
import '/components/dar_feedback/dar_feedback_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ajustes_usuario_principal_model.dart';
export 'ajustes_usuario_principal_model.dart';

class AjustesUsuarioPrincipalWidget extends StatefulWidget {
  const AjustesUsuarioPrincipalWidget({super.key});

  @override
  State<AjustesUsuarioPrincipalWidget> createState() =>
      _AjustesUsuarioPrincipalWidgetState();
}

class _AjustesUsuarioPrincipalWidgetState
    extends State<AjustesUsuarioPrincipalWidget> {
  late AjustesUsuarioPrincipalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjustesUsuarioPrincipalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          's3zzy7y2' /* Ajustes */,
                        ),
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
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
                            'AJUSTES_USUARIO_PRINCIPAL_Card_migw1tzf_');
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
                          padding: EdgeInsets.all(10.0),
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model1,
                      updateCallback: () => setState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.ksettings,
                          color: FlutterFlowTheme.of(context).icono,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'zaqmd7y3' /* Configuración */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'AJUSTES_USUARIO_PRINCIPAL_Container_a7q1');
                          logFirebaseEvent('boton3_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x00000000),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model2,
                      updateCallback: () => setState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.kstarLines,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          '8fzq9a4r' /* Mis favoritos */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'AJUSTES_USUARIO_PRINCIPAL_Container_02w3');
                          logFirebaseEvent('boton3_navigate_to');

                          context.pushNamed('ajustes_Favoritos');
                        },
                      ),
                    ),
                  ),
                  if (!loggedIn)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.boton3Model3,
                        updateCallback: () => setState(() {}),
                        child: Boton3Widget(
                          icono: Icon(
                            FFIcons.kusers,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          texto: FFLocalizations.of(context).getText(
                            'j97vszvu' /* Mis mejores amigos */,
                          ),
                          accion: () async {},
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.boton3Model4,
                      updateCallback: () => setState(() {}),
                      child: Boton3Widget(
                        icono: Icon(
                          FFIcons.kimbox,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'b93gtt27' /* Feedback */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'AJUSTES_USUARIO_PRINCIPAL_Container_eqdb');
                          logFirebaseEvent('boton3_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: DarFeedbackWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!loggedIn)
                      wrapWithModel(
                        model: _model.boton4Model1,
                        updateCallback: () => setState(() {}),
                        child: Boton4Widget(
                          icono: Icon(
                            FFIcons.kaddUser,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          texto: FFLocalizations.of(context).getText(
                            'svuonvzz' /* Añadir cuenta */,
                          ),
                          isLogout: false,
                          accion: () async {},
                        ),
                      ),
                    wrapWithModel(
                      model: _model.boton4Model2,
                      updateCallback: () => setState(() {}),
                      child: Boton4Widget(
                        icono: Icon(
                          FFIcons.klogOut,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20.0,
                        ),
                        texto: FFLocalizations.of(context).getText(
                          'kttvk2k7' /* Salir de Cuenta */,
                        ),
                        isLogout: true,
                        accion: () async {
                          logFirebaseEvent(
                              'AJUSTES_USUARIO_PRINCIPAL_Container_m98g');
                          logFirebaseEvent('boton4_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('inicio', context.mounted);
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
