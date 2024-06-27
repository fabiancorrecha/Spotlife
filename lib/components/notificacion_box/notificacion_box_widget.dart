import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notificacion_box_model.dart';
export 'notificacion_box_model.dart';

class NotificacionBoxWidget extends StatefulWidget {
  const NotificacionBoxWidget({
    super.key,
    this.mensaje,
  });

  final String? mensaje;

  @override
  State<NotificacionBoxWidget> createState() => _NotificacionBoxWidgetState();
}

class _NotificacionBoxWidgetState extends State<NotificacionBoxWidget> {
  late NotificacionBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacionBoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('NOTIFICACION_BOX_Container_rhiumjtn_ON_T');
          logFirebaseEvent('Container_bottom_sheet');
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).fondoIcono,
            borderRadius: BorderRadius.circular(80.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.mensaje!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
