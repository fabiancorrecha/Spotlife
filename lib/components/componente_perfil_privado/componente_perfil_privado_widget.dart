import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'componente_perfil_privado_model.dart';
export 'componente_perfil_privado_model.dart';

class ComponentePerfilPrivadoWidget extends StatefulWidget {
  const ComponentePerfilPrivadoWidget({super.key});

  @override
  State<ComponentePerfilPrivadoWidget> createState() =>
      _ComponentePerfilPrivadoWidgetState();
}

class _ComponentePerfilPrivadoWidgetState
    extends State<ComponentePerfilPrivadoWidget> {
  late ComponentePerfilPrivadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentePerfilPrivadoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      decoration: const BoxDecoration(),
      child: Column(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '5zq086n2' /* Esta cuenta es privada */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
