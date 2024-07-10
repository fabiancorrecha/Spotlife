import '/components/selector_motivo/selector_motivo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anadir_metodo_pago_model.dart';
export 'anadir_metodo_pago_model.dart';

class AnadirMetodoPagoWidget extends StatefulWidget {
  const AnadirMetodoPagoWidget({
    super.key,
    this.post,
  });

  final DocumentReference? post;

  @override
  State<AnadirMetodoPagoWidget> createState() => _AnadirMetodoPagoWidgetState();
}

class _AnadirMetodoPagoWidgetState extends State<AnadirMetodoPagoWidget> {
  late AnadirMetodoPagoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnadirMetodoPagoModel());

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
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'p9oie00f' /* Añadir metodo de pago */,
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
                      'qboqoxgo' /* Tarjeta de credito o debito */,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.selectorMotivoModel2,
                  updateCallback: () => setState(() {}),
                  child: const SelectorMotivoWidget(
                    motivoTexto: 'Paypal',
                  ),
                ),
                wrapWithModel(
                  model: _model.selectorMotivoModel3,
                  updateCallback: () => setState(() {}),
                  child: const SelectorMotivoWidget(
                    motivoTexto: 'Applepay',
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
