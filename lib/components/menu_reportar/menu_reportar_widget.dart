import '/components/selector_motivo/selector_motivo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'menu_reportar_model.dart';
export 'menu_reportar_model.dart';

class MenuReportarWidget extends StatefulWidget {
  const MenuReportarWidget({
    super.key,
    this.post,
  });

  final DocumentReference? post;

  @override
  State<MenuReportarWidget> createState() => _MenuReportarWidgetState();
}

class _MenuReportarWidgetState extends State<MenuReportarWidget> {
  late MenuReportarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuReportarModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                  child: Container(
                    width: 52.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).fondoIcono,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'g5zguejb' /* Reportar */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'hdukpqoe' /* ¿Por qué estás reportando este... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'o4l1ocvk' /* Tu reporte será anónimo, excep... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: Color(0xFF737373),
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.selectorMotivoModel1,
                  updateCallback: () => setState(() {}),
                  child: SelectorMotivoWidget(
                    motivoTexto: FFLocalizations.of(context).getText(
                      '0tiikwvx' /* Es spam */,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.selectorMotivoModel2,
                  updateCallback: () => setState(() {}),
                  child: SelectorMotivoWidget(
                    motivoTexto: FFLocalizations.of(context).getText(
                      'm5gzyax0' /* Desnudos o actividad sexual */,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.selectorMotivoModel3,
                  updateCallback: () => setState(() {}),
                  child: SelectorMotivoWidget(
                    motivoTexto: FFLocalizations.of(context).getText(
                      'wximtg8h' /* Bullying o acoso */,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.selectorMotivoModel4,
                  updateCallback: () => setState(() {}),
                  child: SelectorMotivoWidget(
                    motivoTexto: FFLocalizations.of(context).getText(
                      'mrmm7hbf' /* Información falsa */,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.selectorMotivoModel5,
                  updateCallback: () => setState(() {}),
                  child: SelectorMotivoWidget(
                    motivoTexto: FFLocalizations.of(context).getText(
                      'qzvakjdd' /* Otro motivo */,
                    ),
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
