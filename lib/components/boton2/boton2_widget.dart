import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'boton2_model.dart';
export 'boton2_model.dart';

class Boton2Widget extends StatefulWidget {
  const Boton2Widget({
    super.key,
    this.texto,
    this.accion,
  });

  final String? texto;
  final Future Function()? accion;

  @override
  State<Boton2Widget> createState() => _Boton2WidgetState();
}

class _Boton2WidgetState extends State<Boton2Widget> {
  late Boton2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Boton2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(0.0, 0.0),
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
          child: FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('BOTON2_COMP_INICIAR_BTN_ON_TAP');
              logFirebaseEvent('Button_execute_callback');
              await widget.accion?.call();
            },
            text: widget.texto!,
            options: FFButtonOptions(
              width: 316.0,
              height: 64.0,
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).fondoIcono,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
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
              borderRadius: BorderRadius.circular(8100.0),
            ),
          ),
        ),
      ],
    );
  }
}
