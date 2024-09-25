import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar5_model.dart';
export 'app_bar5_model.dart';

class AppBar5Widget extends StatefulWidget {
  const AppBar5Widget({
    super.key,
    String? titulo,
    this.coleccion,
  }) : titulo = titulo ?? 'Lugar de Fotos, Pais';

  final String titulo;
  final CollectionsRecord? coleccion;

  @override
  State<AppBar5Widget> createState() => _AppBar5WidgetState();
}

class _AppBar5WidgetState extends State<AppBar5Widget> {
  late AppBar5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBar5Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 100.0,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('APP_BAR5_COMP_Card_tw39opat_ON_TAP');
                logFirebaseEvent('Card_navigate_back');
                context.safePop();
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).fondoIcono,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).icono,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
          if (widget.coleccion?.imagen != null &&
              widget.coleccion?.imagen != '')
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                widget.coleccion!.imagen,
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      widget.titulo,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('APP_BAR5_COMP_Card_yptgbgzq_ON_TAP');
                if (FFAppState().vermapa) {
                  logFirebaseEvent('Card_update_app_state');
                  FFAppState().vermapa = false;
                  FFAppState().update(() {});
                } else {
                  logFirebaseEvent('Card_update_app_state');
                  FFAppState().vermapa = true;
                  FFAppState().update(() {});
                }
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).fondoIcono,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    FFIcons.kframe169,
                    color: valueOrDefault<Color>(
                      FFAppState().vermapa == true
                          ? FlutterFlowTheme.of(context).primary
                          : const Color(0xFFFAF7FA),
                      const Color(0xFFFAF7FA),
                    ),
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
