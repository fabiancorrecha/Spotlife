import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chip_pequeno_model.dart';
export 'chip_pequeno_model.dart';

class ChipPequenoWidget extends StatefulWidget {
  const ChipPequenoWidget({
    super.key,
    this.valor,
  });

  final String? valor;

  @override
  State<ChipPequenoWidget> createState() => _ChipPequenoWidgetState();
}

class _ChipPequenoWidgetState extends State<ChipPequenoWidget> {
  late ChipPequenoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChipPequenoModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
      child: Container(
        width: 120.0,
        height: 56.0,
        decoration: BoxDecoration(
          color: FFAppState().listaIntereses.contains(widget.valor)
              ? const Color(0xFFF4F176)
              : const Color(0xFF333333),
          borderRadius: BorderRadius.circular(1000.0),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('CHIP_PEQUENO_COMP_Row_8fn3jl3i_ON_TAP');
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                child: Text(
                  widget.valor!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: valueOrDefault<Color>(
                          FFAppState().listaIntereses.contains(widget.valor)
                              ? FlutterFlowTheme.of(context).primaryBackground
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
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                  if (!FFAppState().listaIntereses.contains(widget.valor))
                    Icon(
                      FFIcons.kadd,
                      color: FlutterFlowTheme.of(context).secondaryText,
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
