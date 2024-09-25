import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'boton7_model.dart';
export 'boton7_model.dart';

class Boton7Widget extends StatefulWidget {
  const Boton7Widget({
    super.key,
    this.action,
  });

  final Future Function()? action;

  @override
  State<Boton7Widget> createState() => _Boton7WidgetState();
}

class _Boton7WidgetState extends State<Boton7Widget> {
  late Boton7Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Boton7Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        logFirebaseEvent('BOTON7_ELIMINAR_COMENTARIO_BTN_ON_TAP');
        logFirebaseEvent('Button_execute_callback');
        await widget.action?.call();
      },
      text: FFLocalizations.of(context).getText(
        '95zwhlhw' /* Eliminar comentario */,
      ),
      options: FFButtonOptions(
        width: double.infinity,
        height: 50.0,
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).fondoIcono,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 16.0,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        elevation: 2.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
