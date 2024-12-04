import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'boton1_model.dart';
export 'boton1_model.dart';

class Boton1Widget extends StatefulWidget {
  const Boton1Widget({
    super.key,
    this.texto,
    this.accion,
    this.desabilitado,
  });

  final String? texto;
  final Future Function()? accion;
  final bool? desabilitado;

  @override
  State<Boton1Widget> createState() => _Boton1WidgetState();
}

class _Boton1WidgetState extends State<Boton1Widget> {
  late Boton1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Boton1Model());

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
      decoration: const BoxDecoration(),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
        child: Stack(
          children: [
            if (!widget.desabilitado!)
              Container(
                width: 316.0,
                height: 64.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 25.0,
                      color: Color(0x25F4F176),
                      spreadRadius: 14.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            FFButtonWidget(
              onPressed: widget.desabilitado!
                  ? null
                  : () async {
                      logFirebaseEvent('BOTON1_COMP_INICIAR_BTN_ON_TAP');
                      logFirebaseEvent('Button_execute_callback');
                      await widget.accion?.call();
                    },
              text: widget.texto!,
              options: FFButtonOptions(
                width: 316.0,
                height: 64.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: valueOrDefault<Color>(
                        widget.desabilitado!
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                elevation: 2.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(100.0),
                disabledColor: FlutterFlowTheme.of(context).fondoIcono,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
