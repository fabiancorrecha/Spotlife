import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tarjeta_lista02_model.dart';
export 'tarjeta_lista02_model.dart';

class TarjetaLista02Widget extends StatefulWidget {
  const TarjetaLista02Widget({
    super.key,
    this.usuario,
    this.isVisible,
  });

  final DocumentReference? usuario;
  final bool? isVisible;

  @override
  State<TarjetaLista02Widget> createState() => _TarjetaLista02WidgetState();
}

class _TarjetaLista02WidgetState extends State<TarjetaLista02Widget> {
  late TarjetaLista02Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TarjetaLista02Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible ?? true,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(widget.usuario!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 12.0,
                  height: 12.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                ),
              );
            }

            final containerUsersRecord = snapshot.data!;

            return Container(
              width: double.infinity,
              height: 42.0,
              decoration: const BoxDecoration(),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('TARJETA_LISTA02_COMP_Row_5744gyn6_ON_TAP');
                  logFirebaseEvent('Row_navigate_to');

                  context.pushNamed(
                    'otroPerfil',
                    queryParameters: {
                      'perfilAjeno': serializeParam(
                        containerUsersRecord.reference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            containerUsersRecord.photoUrl,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  containerUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  containerUsersRecord.userName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'TARJETA_LISTA02_COMP_SEGUIR_BTN_ON_TAP');
                            if (!(currentUserDocument?.listaSeguidos
                                        .toList() ??
                                    [])
                                .contains(widget.usuario)) {
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'listaSeguidos': FieldValue.arrayUnion(
                                        [widget.usuario]),
                                  },
                                ),
                              });
                            } else {
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData());
                            }

                            if ((currentUserDocument?.listaSeguidos.toList() ??
                                    [])
                                .contains(widget.usuario)) {
                              logFirebaseEvent('Button_backend_call');

                              await widget.usuario!.update({
                                ...mapToFirestore(
                                  {
                                    'listaSeguidores': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            } else {
                              logFirebaseEvent('Button_backend_call');

                              await widget.usuario!.update({
                                ...mapToFirestore(
                                  {
                                    'listaSeguidores': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            }

                            logFirebaseEvent('Button_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              'otroPerfil',
                              queryParameters: {
                                'perfilAjeno': serializeParam(
                                  widget.usuario,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: (currentUserDocument?.listaSeguidos.toList() ??
                                      [])
                                  .contains(widget.usuario)
                              ? 'Siguiendo'
                              : 'Seguir',
                          options: FFButtonOptions(
                            width: 93.0,
                            height: 28.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              (currentUserDocument?.listaSeguidos.toList() ??
                                          [])
                                      .contains(widget.usuario)
                                  ? FlutterFlowTheme.of(context).fondoIcono
                                  : FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).fondoIcono,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
