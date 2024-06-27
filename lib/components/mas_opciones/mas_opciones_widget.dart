import '/components/login_options/login_options_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mas_opciones_model.dart';
export 'mas_opciones_model.dart';

class MasOpcionesWidget extends StatefulWidget {
  const MasOpcionesWidget({super.key});

  @override
  State<MasOpcionesWidget> createState() => _MasOpcionesWidgetState();
}

class _MasOpcionesWidgetState extends State<MasOpcionesWidget> {
  late MasOpcionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MasOpcionesModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'tsgxcnq4' /* Ingresa a tu cuenta */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.loginOptionsModel,
                updateCallback: () => setState(() {}),
                child: LoginOptionsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
