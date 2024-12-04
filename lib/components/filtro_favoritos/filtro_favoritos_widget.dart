import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filtro_favoritos_model.dart';
export 'filtro_favoritos_model.dart';

class FiltroFavoritosWidget extends StatefulWidget {
  const FiltroFavoritosWidget({
    super.key,
    this.post,
  });

  final DocumentReference? post;

  @override
  State<FiltroFavoritosWidget> createState() => _FiltroFavoritosWidgetState();
}

class _FiltroFavoritosWidgetState extends State<FiltroFavoritosWidget> {
  late FiltroFavoritosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltroFavoritosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 180.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'cp3qsx2y' /* Filtros favoritos */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mjqh4tix' /* Año de publicación */,
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
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
                      FlutterFlowCheckboxGroup(
                        options: [
                          FFLocalizations.of(context).getText(
                            'ttwfbqeb' /* 2024 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'chxzoxnu' /* 2023 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '4iv8zkol' /* 2022 */,
                          )
                        ],
                        onChanged: (val) => safeSetState(
                            () => _model.checkboxGroupValues1 = val),
                        controller: _model.checkboxGroupValueController1 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: Colors.white,
                        checkboxBorderColor:
                            FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        checkboxBorderRadius: BorderRadius.circular(4.0),
                        initialized: _model.checkboxGroupValues1 != null,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 32.0,
                    thickness: 1.0,
                    indent: 0.0,
                    endIndent: 0.0,
                    color: Color(0x27FAF7FA),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '4qwc4jl6' /* Lugar */,
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
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
                      FlutterFlowCheckboxGroup(
                        options: [
                          FFLocalizations.of(context).getText(
                            'j05rs3n7' /* México */,
                          ),
                          FFLocalizations.of(context).getText(
                            '0wr30vyp' /* Italia */,
                          ),
                          FFLocalizations.of(context).getText(
                            '2mr87c90' /* Irlanda */,
                          ),
                          FFLocalizations.of(context).getText(
                            'wvvy115v' /* Ibiza */,
                          )
                        ],
                        onChanged: (val) => safeSetState(
                            () => _model.checkboxGroupValues2 = val),
                        controller: _model.checkboxGroupValueController2 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: Colors.white,
                        checkboxBorderColor:
                            FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        checkboxBorderRadius: BorderRadius.circular(4.0),
                        initialized: _model.checkboxGroupValues2 != null,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 32.0,
                    thickness: 1.0,
                    indent: 0.0,
                    endIndent: 0.0,
                    color: Color(0x27FAF7FA),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'jymm2y94' /* Privacidad de colección */,
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
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
                      FlutterFlowCheckboxGroup(
                        options: [
                          FFLocalizations.of(context).getText(
                            '4koqa4ds' /* Público */,
                          ),
                          FFLocalizations.of(context).getText(
                            'wwhyokng' /* Mejores amigos */,
                          ),
                          FFLocalizations.of(context).getText(
                            'eppdu8t2' /* Spot secreto (solo yo) */,
                          )
                        ],
                        onChanged: (val) => safeSetState(
                            () => _model.checkboxGroupValues3 = val),
                        controller: _model.checkboxGroupValueController3 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: Colors.white,
                        checkboxBorderColor:
                            FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        checkboxBorderRadius: BorderRadius.circular(4.0),
                        initialized: _model.checkboxGroupValues3 != null,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 32.0,
                    thickness: 1.0,
                    indent: 0.0,
                    endIndent: 0.0,
                    color: Color(0x27FAF7FA),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: wrapWithModel(
                model: _model.boton1Model,
                updateCallback: () => safeSetState(() {}),
                child: Boton1Widget(
                  texto: 'Listo',
                  desabilitado: false,
                  accion: () async {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
