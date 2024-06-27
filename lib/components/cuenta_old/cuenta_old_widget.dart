import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cuenta_old_model.dart';
export 'cuenta_old_model.dart';

class CuentaOldWidget extends StatefulWidget {
  const CuentaOldWidget({super.key});

  @override
  State<CuentaOldWidget> createState() => _CuentaOldWidgetState();
}

class _CuentaOldWidgetState extends State<CuentaOldWidget> {
  late CuentaOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuentaOldModel());

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
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CUENTA_OLD_COMP_Card_ufzdrkwa_ON_TAP');
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
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).icono,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '4diegsa8' /* Cuenta */,
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
                    Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'pjttl1qk' /* Información usuario */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.botonQuintoModel1,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'jpfd7qil' /* Informacion personal */,
                        ),
                        accion: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.botonQuintoModel2,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'e9vqby5k' /* Idioma */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'CUENTA_OLD_Container_en2q9ox5_CALLBACK');
                          logFirebaseEvent('botonQuinto_navigate_to');

                          context.pushNamed('idioma_ajuste');
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.botonQuintoModel3,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'pqw2xtu8' /* Guardar fotos originales */,
                        ),
                        accion: () async {},
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'qs0dbtfg' /* Herramientas cuenta profesiona... */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.botonQuintoModel4,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          's6i1on4c' /* Herramientas promoción */,
                        ),
                        accion: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.botonQuintoModel5,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'k451ictb' /* Solicitar verificación */,
                        ),
                        accion: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.botonQuintoModel6,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          'dngpr9ek' /* Cambiar a cuenta empresa */,
                        ),
                        accion: () async {},
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
