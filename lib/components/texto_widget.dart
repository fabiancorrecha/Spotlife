import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'texto_model.dart';
export 'texto_model.dart';

class TextoWidget extends StatefulWidget {
  const TextoWidget({
    super.key,
    required this.texto,
  });

  final String? texto;

  @override
  State<TextoWidget> createState() => _TextoWidgetState();
}

class _TextoWidgetState extends State<TextoWidget> {
  late TextoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            widget.texto!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: GoogleFonts.asMap().containsKey('Montserrat'),
                ),
          ),
        ),
      ],
    );
  }
}
