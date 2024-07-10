import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'actividad_old_model.dart';
export 'actividad_old_model.dart';

class ActividadOldWidget extends StatefulWidget {
  const ActividadOldWidget({super.key});

  @override
  State<ActividadOldWidget> createState() => _ActividadOldWidgetState();
}

class _ActividadOldWidgetState extends State<ActividadOldWidget> {
  late ActividadOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActividadOldModel());

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
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ACTIVIDAD_OLD_COMP_Card_rk4y1a4e_ON_TAP');
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
                          padding: const EdgeInsets.all(5.0),
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
                        'hkitjja7' /* Actividad */,
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.botonQuintoModel1,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: 'Interacciones',
                        accion: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.botonQuintoModel2,
                      updateCallback: () => setState(() {}),
                      child: BotonQuintoWidget(
                        texto: 'Busquedas recientes',
                        accion: () async {},
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
