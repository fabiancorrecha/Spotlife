import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'boton4_model.dart';
export 'boton4_model.dart';

class Boton4Widget extends StatefulWidget {
  const Boton4Widget({
    super.key,
    this.icono,
    this.texto,
    this.accion,
    this.isLogout,
  });

  final Widget? icono;
  final String? texto;
  final Future Function()? accion;
  final bool? isLogout;

  @override
  State<Boton4Widget> createState() => _Boton4WidgetState();
}

class _Boton4WidgetState extends State<Boton4Widget> {
  late Boton4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Boton4Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('BOTON4_COMP_Container_t494gddu_ON_TAP');
        logFirebaseEvent('Container_execute_callback');
        await widget.accion?.call();
      },
      child: Container(
        height: 54.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xFF333333),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.icono!,
              Text(
                widget.texto!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: valueOrDefault<Color>(
                        widget.isLogout!
                            ? FlutterFlowTheme.of(context).error
                            : FlutterFlowTheme.of(context).primaryText,
                        FlutterFlowTheme.of(context).primaryText,
                      ),
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ].divide(SizedBox(width: 24.0)),
          ),
        ),
      ),
    );
  }
}
