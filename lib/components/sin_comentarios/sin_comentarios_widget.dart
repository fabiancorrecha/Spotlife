import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sin_comentarios_model.dart';
export 'sin_comentarios_model.dart';

class SinComentariosWidget extends StatefulWidget {
  const SinComentariosWidget({super.key});

  @override
  State<SinComentariosWidget> createState() => _SinComentariosWidgetState();
}

class _SinComentariosWidgetState extends State<SinComentariosWidget> {
  late SinComentariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinComentariosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.comment_rounded,
          color: Color(0x4195A1AC),
          size: 50.0,
        ),
        Text(
          FFLocalizations.of(context).getText(
            'oz8p0cc4' /* Todavía no hay comentarios. */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                color: const Color(0x5695A1AC),
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
              ),
        ),
      ].divide(const SizedBox(height: 8.0)),
    );
  }
}
