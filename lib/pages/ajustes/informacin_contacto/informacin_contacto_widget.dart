import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'informacin_contacto_model.dart';
export 'informacin_contacto_model.dart';

class InformacinContactoWidget extends StatefulWidget {
  const InformacinContactoWidget({super.key});

  @override
  State<InformacinContactoWidget> createState() =>
      _InformacinContactoWidgetState();
}

class _InformacinContactoWidgetState extends State<InformacinContactoWidget> {
  late InformacinContactoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformacinContactoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'informacin_contacto'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 32.0, 16.0, 16.0),
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
                              'INFORMACIN_CONTACTO_Card_l4p49hsa_ON_TAP');
                          logFirebaseEvent('Card_navigate_back');
                          context.safePop();
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
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '671bt6ny' /* Información contacto */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displaySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displaySmallFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.boton5Model1,
                    updateCallback: () => setState(() {}),
                    child: BotonQuintoWidget(
                      texto: FFLocalizations.of(context).getText(
                        'nzo2wh6s' /* Nombre completo */,
                      ),
                      accion: () async {},
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.boton5Model2,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'xe3zjdc9' /* Dirección facturación */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.boton5Model3,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'gl0y9rij' /* Email */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.boton5Model4,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '1vha0bf0' /* Número de teléfono */,
                    ),
                    accion: () async {},
                  ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
