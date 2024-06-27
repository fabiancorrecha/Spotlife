import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'notificaciones_ajustes_model.dart';
export 'notificaciones_ajustes_model.dart';

class NotificacionesAjustesWidget extends StatefulWidget {
  const NotificacionesAjustesWidget({super.key});

  @override
  State<NotificacionesAjustesWidget> createState() =>
      _NotificacionesAjustesWidgetState();
}

class _NotificacionesAjustesWidgetState
    extends State<NotificacionesAjustesWidget> {
  late NotificacionesAjustesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacionesAjustesModel());

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
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
                          'NOTIFICACIONES_AJUSTES_Card_h03ydpjl_ON_');
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
                      'viuxomyv' /* Notificaciones */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
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
                    'pegb7wat' /* Notificaciones sociales */,
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.botonQuintoModel1,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'miep204a' /* Enlace invitación */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel2,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '9rmxvw1p' /* Compartir via whatsapp */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel3,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '3q1vqkpu' /* Compartir via instagram */,
                    ),
                    accion: () async {},
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'wsppmory' /* Notificaciones sociales */,
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.botonQuintoModel4,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '7zkjglw1' /* Enlace invitación */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel5,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'mvcoqt25' /* Compartir via whatsapp */,
                    ),
                    accion: () async {},
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
