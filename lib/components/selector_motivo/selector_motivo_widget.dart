import '/components/menu_reportar2/menu_reportar2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'selector_motivo_model.dart';
export 'selector_motivo_model.dart';

class SelectorMotivoWidget extends StatefulWidget {
  const SelectorMotivoWidget({
    super.key,
    this.motivoTexto,
  });

  final String? motivoTexto;

  @override
  State<SelectorMotivoWidget> createState() => _SelectorMotivoWidgetState();
}

class _SelectorMotivoWidgetState extends State<SelectorMotivoWidget> {
  late SelectorMotivoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectorMotivoModel());

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
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('SELECTOR_MOTIVO_COMP_BUTTON_BTN_ON_TAP');
                logFirebaseEvent('Button_update_app_state');
                FFAppState().motivoReporte = widget.motivoTexto!;
                FFAppState().update(() {});
                logFirebaseEvent('Button_bottom_sheet');
                Navigator.pop(context);
                logFirebaseEvent('Button_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: const Color(0x00000000),
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: const SizedBox(
                          height: 560.0,
                          child: MenuReportar2Widget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              text: widget.motivoTexto!,
              options: FFButtonOptions(
                width: 130.0,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).fondoIcono,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 2.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
