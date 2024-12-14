import '/auth/firebase_auth/auth_util.dart';
import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'invitar_amigos_pagina_model.dart';
export 'invitar_amigos_pagina_model.dart';

class InvitarAmigosPaginaWidget extends StatefulWidget {
  const InvitarAmigosPaginaWidget({super.key});

  @override
  State<InvitarAmigosPaginaWidget> createState() =>
      _InvitarAmigosPaginaWidgetState();
}

class _InvitarAmigosPaginaWidgetState extends State<InvitarAmigosPaginaWidget> {
  late InvitarAmigosPaginaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitarAmigosPaginaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'invitar_amigos_pagina'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(37.0, 54.0, 37.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
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
                              'INVITAR_AMIGOS_PAGINA_Card_qt2alldw_ON_T');
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
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).icono,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'h14cy7xi' /* Invitar a amigos */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displaySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displaySmallFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.botonQuintoModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: BotonQuintoWidget(
                        texto: FFLocalizations.of(context).getText(
                          '4ovqiul6' /* Enlace invitación */,
                        ),
                        accion: () async {
                          logFirebaseEvent(
                              'INVITAR_AMIGOS_PAGINA_Container_m3sp2nid');
                          logFirebaseEvent('botonQuinto_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Enlace copiado!',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              duration: const Duration(milliseconds: 1500),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          );
                          logFirebaseEvent('botonQuinto_copy_to_clipboard');
                          await Clipboard.setData(ClipboardData(
                              text:
                                  'https://spolifeapp-15z0hb.flutterflow.app?userRef=$currentUserUid'));
                        },
                      ),
                    ),
                    Builder(
                      builder: (context) => wrapWithModel(
                        model: _model.botonQuintoModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: BotonQuintoWidget(
                          texto: FFLocalizations.of(context).getText(
                            'kj3teqfz' /* Compartir enlace */,
                          ),
                          accion: () async {
                            logFirebaseEvent(
                                'INVITAR_AMIGOS_PAGINA_Container_38j5tf3n');
                            logFirebaseEvent('botonQuinto_share');
                            await Share.share(
                              'https://spolifeapp-15z0hb.flutterflow.app?userRef=$currentUserUid',
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                            logFirebaseEvent('botonQuinto_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Enlace compartido!',
                                  style: TextStyle(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 1500),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
