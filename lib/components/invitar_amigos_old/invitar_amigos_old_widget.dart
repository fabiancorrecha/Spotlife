import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'invitar_amigos_old_model.dart';
export 'invitar_amigos_old_model.dart';

class InvitarAmigosOldWidget extends StatefulWidget {
  const InvitarAmigosOldWidget({super.key});

  @override
  State<InvitarAmigosOldWidget> createState() => _InvitarAmigosOldWidgetState();
}

class _InvitarAmigosOldWidgetState extends State<InvitarAmigosOldWidget> {
  late InvitarAmigosOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitarAmigosOldModel());

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'INVITAR_AMIGOS_OLD_Card_7si2w6h7_ON_TAP');
                      logFirebaseEvent('Card_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).fondoIcono,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '80gvgnws' /* Invitar a amigos */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
                        ),
                  ),
                  Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.botonQuintoModel1,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '7vhgdbm7' /* Enlace invitación */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel2,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '3w91cz9f' /* Compartir via whatsapp */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel3,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      '3oyqfslo' /* Compartir via instagram */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel4,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'pk0dv6rk' /* Compartir via tiktok */,
                    ),
                    accion: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.botonQuintoModel5,
                  updateCallback: () => setState(() {}),
                  child: BotonQuintoWidget(
                    texto: FFLocalizations.of(context).getText(
                      'qvyny7ue' /* Compartir otros */,
                    ),
                    accion: () async {},
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
