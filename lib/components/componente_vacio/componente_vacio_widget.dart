import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'componente_vacio_model.dart';
export 'componente_vacio_model.dart';

class ComponenteVacioWidget extends StatefulWidget {
  const ComponenteVacioWidget({super.key});

  @override
  State<ComponenteVacioWidget> createState() => _ComponenteVacioWidgetState();
}

class _ComponenteVacioWidgetState extends State<ComponenteVacioWidget> {
  late ComponenteVacioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteVacioModel());

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
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Image.network(
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/ll0xdhzyoat5/icono_principal.png',
            width: 100.0,
            height: 100.0,
            fit: BoxFit.contain,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '5fokfn3p' /* Nada que ver por aqui */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
