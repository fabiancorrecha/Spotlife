import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chip_grande_model.dart';
export 'chip_grande_model.dart';

class ChipGrandeWidget extends StatefulWidget {
  const ChipGrandeWidget({
    super.key,
    this.valor,
  });

  final String? valor;

  @override
  State<ChipGrandeWidget> createState() => _ChipGrandeWidgetState();
}

class _ChipGrandeWidgetState extends State<ChipGrandeWidget> {
  late ChipGrandeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChipGrandeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
      child: Container(
        width: 200.0,
        height: 56.0,
        decoration: BoxDecoration(
          color: FFAppState().listaIntereses.contains('${widget.valor}')
              ? Color(0xB15C52E2)
              : Color(0xFF333333),
          borderRadius: BorderRadius.circular(1000.0),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('CHIP_GRANDE_COMP_Row_zjfi7zbd_ON_TAP');
            if (FFAppState().listaIntereses.contains(widget.valor)) {
              logFirebaseEvent('Row_update_app_state');
              FFAppState().removeFromListaIntereses(widget.valor!);
              FFAppState().update(() {});
            } else {
              logFirebaseEvent('Row_update_app_state');
              FFAppState().addToListaIntereses(widget.valor!);
              FFAppState().update(() {});
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                child: Text(
                  widget.valor!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: valueOrDefault<Color>(
                          FFAppState().listaIntereses.contains(widget.valor)
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).secondaryText,
                          FlutterFlowTheme.of(context).primaryText,
                        ),
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Stack(
                children: [
                  if (FFAppState().listaIntereses.contains(widget.valor))
                    Icon(
                      Icons.remove_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  if (!FFAppState().listaIntereses.contains(widget.valor))
                    Icon(
                      Icons.add_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
