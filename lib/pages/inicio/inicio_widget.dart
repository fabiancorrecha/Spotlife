import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inicio_model.dart';
export 'inicio_model.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({
    super.key,
    this.ref,
  });

  final DocumentReference? ref;

  @override
  State<InicioWidget> createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  late InicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicioModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'inicio'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('INICIO_PAGE_inicio_ON_INIT_STATE');
      logFirebaseEvent('inicio_update_app_state');
      FFAppState().referente = widget.ref;
      setState(() {});
    });

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/BG_circles_(1)_(1).png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/icono_principal.png',
                width: 176.0,
                height: 201.0,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(37.0, 0.0, 37.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'oqd0m6s8' /* Explora, comparte y vive el mu... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Inter'),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'bfbks61z' /* Descubre lugares, personas y e... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
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
                          logFirebaseEvent(
                              'INICIO_PAGE_Container_gy1sijk8_ON_TAP');
                          logFirebaseEvent('boton1_navigate_to');

                          context.pushNamed('ingresaConTelefono');
                        },
                        child: wrapWithModel(
                          model: _model.boton1Model,
                          updateCallback: () => setState(() {}),
                          child: Boton1Widget(
                            texto: FFLocalizations.of(context).getText(
                              'm60vu3mn' /* Entrar */,
                            ),
                            desabilitado: false,
                            accion: () async {
                              logFirebaseEvent(
                                  'INICIO_PAGE_Container_gy1sijk8_CALLBACK');
                              logFirebaseEvent('boton1_navigate_to');

                              context.pushNamed('ingresaConTelefono');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: FlutterFlowLanguageSelector(
                          width: 150.0,
                          height: 40.0,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          borderColor: Colors.transparent,
                          dropdownIconColor: Colors.white,
                          borderRadius: 8.0,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 13.0,
                          ),
                          hideFlags: false,
                          flagSize: 24.0,
                          flagTextGap: 8.0,
                          currentLanguage:
                              FFLocalizations.of(context).languageCode,
                          languages: FFLocalizations.languages(),
                          onChanged: (lang) => setAppLanguage(context, lang),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              FFLocalizations.of(context).getText(
                                'djay2sms' /* ¿Aún no tienes cuenta? */,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
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
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'INICIO_PAGE_Text_y58i54vk_ON_TAP');
                                  logFirebaseEvent('Text_update_app_state');
                                  FFAppState().inicioSesion = '';
                                  FFAppState().update(() {});
                                  logFirebaseEvent('Text_navigate_to');

                                  context
                                      .pushNamed('creaCuentaUserName-telefono');
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'dgdq9luc' /* Crea tu cuenta */,
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
