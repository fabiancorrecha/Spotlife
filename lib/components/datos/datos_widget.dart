import '/components/boton_quinto/boton_quinto_widget.dart';
import '/components/condiciones_de_uso/condiciones_de_uso_widget.dart';
import '/components/politicas_de_privacidad/politicas_de_privacidad_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'datos_model.dart';
export 'datos_model.dart';

class DatosWidget extends StatefulWidget {
  const DatosWidget({super.key});

  @override
  State<DatosWidget> createState() => _DatosWidgetState();
}

class _DatosWidgetState extends State<DatosWidget> {
  late DatosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatosModel());

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
                      logFirebaseEvent('DATOS_COMP_Card_4xeo08g3_ON_TAP');
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
                      'p306zv8s' /* Informacion */,
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.botonQuintoModel1,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: 'Politica de datos',
                    accion: () async {
                      logFirebaseEvent(
                          'DATOS_COMP_Container_os4hcewm_CALLBACK');
                      logFirebaseEvent('botonQuinto_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const PoliticasDePrivacidadWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel2,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: 'Condiciones de uso',
                    accion: () async {
                      logFirebaseEvent(
                          'DATOS_COMP_Container_8nfftra8_CALLBACK');
                      logFirebaseEvent('botonQuinto_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const CondicionesDeUsoWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel3,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: 'Reglamento UE',
                    accion: () async {
                      logFirebaseEvent(
                          'DATOS_COMP_Container_sonsw960_CALLBACK');
                      logFirebaseEvent('botonQuinto_launch_u_r_l');
                      await launchURL(
                          'https://eur-lex.europa.eu/legal-content/ES/TXT/HTML/?uri=CELEX:32022R0868');
                    },
                  ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
