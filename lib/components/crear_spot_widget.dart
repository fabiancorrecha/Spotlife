import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crear_spot_model.dart';
export 'crear_spot_model.dart';

class CrearSpotWidget extends StatefulWidget {
  const CrearSpotWidget({
    super.key,
    required this.ubication,
  });

  final LatLng? ubication;

  @override
  State<CrearSpotWidget> createState() => _CrearSpotWidgetState();
}

class _CrearSpotWidgetState extends State<CrearSpotWidget> {
  late CrearSpotModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearSpotModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Text(
        widget.ubication!.toString(),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              fontSize: 30.0,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
      ),
    );
  }
}
