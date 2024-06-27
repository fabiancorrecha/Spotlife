import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
// ignore: unnecessary_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notificacion_post_model.dart';
export 'notificacion_post_model.dart';

class NotificacionPostWidget extends StatefulWidget {
  const NotificacionPostWidget({
    super.key,
    this.actividad,
  });

  final ActividadRecord? actividad;

  @override
  State<NotificacionPostWidget> createState() => _NotificacionPostWidgetState();
}

class _NotificacionPostWidgetState extends State<NotificacionPostWidget> {
  late NotificacionPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacionPostModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.actividad!.creadorActividad!),
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
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NOTIFICACION_POST_CircleImage_v2dji674_O');
                  if (containerUsersRecord.reference == currentUserReference) {
                    logFirebaseEvent('CircleImage_navigate_to');

                    context.goNamed('perfilPropio');
                  } else {
                    logFirebaseEvent('CircleImage_navigate_to');

                    context.pushNamed(
                      'otroPerfil',
                      queryParameters: {
                        'perfilAjeno': serializeParam(
                          containerUsersRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  }
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      valueOrDefault<String>(
                        () {
                          if (widget.actividad!.meGusta) {
                            return '${containerUsersRecord.displayName} le gustó tu post';
                          } else if (widget.actividad!.esSeguir) {
                            return '${containerUsersRecord.displayName}${valueOrDefault<bool>(currentUserDocument?.cuentaPrivada, false) == true ? ' te envio una solicitud de amistad' : ' te empezo a seguir'}';
                          } else if (widget.actividad!.esComentario) {
                            return '${containerUsersRecord.displayName} comentó en tu post.';
                          } else if (widget.actividad!.meGustaComentario) {
                            return 'A ${widget.actividad?.nombreUsuarioCreador} le gustó tu comentario';
                          } else {
                            return 'notificacion';
                          }
                        }(),
                        'notificacion',
                      ),
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
              ),
              if (widget.actividad?.postRelacionado != null)
                StreamBuilder<UserPostsRecord>(
                  stream: UserPostsRecord.getDocument(
                      widget.actividad!.postRelacionado!),
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
                    final imageUserPostsRecord = snapshot.data!;
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'NOTIFICACION_POST_Image_eaj25lc7_ON_TAP');
                        logFirebaseEvent('Image_navigate_to');

                        context.pushNamed(
                          'detallePost',
                          pathParameters: {
                            'post': serializeParam(
                              imageUserPostsRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'post': imageUserPostsRecord,
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          imageUserPostsRecord.postPhotolist.first,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              if (widget.actividad!.esSeguir &&
                  !(currentUserDocument?.listaSeguidos?.toList() ?? [])
                      .contains(containerUsersRecord.reference) &&
                  (valueOrDefault<bool>(
                          currentUserDocument?.cuentaPrivada, false) ==
                      false))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'NOTIFICACION_POST_COMP_SEGUIR_BTN_ON_TAP');
                        if (containerUsersRecord.reference !=
                            currentUserReference) {
                          if (!(currentUserDocument?.listaSeguidos?.toList() ??
                                  [])
                              .contains(containerUsersRecord.reference)) {
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'listaSeguidos': FieldValue.arrayUnion(
                                      [containerUsersRecord.reference]),
                                },
                              ),
                            });
                          } else {
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'listaSeguidos': FieldValue.arrayRemove(
                                      [containerUsersRecord.reference]),
                                },
                              ),
                            });
                          }

                          if ((currentUserDocument?.listaSeguidos?.toList() ??
                                  [])
                              .contains(containerUsersRecord.reference)) {
                            logFirebaseEvent('Button_backend_call');

                            await containerUsersRecord.reference.update({
                              ...mapToFirestore(
                                {
                                  'listaSeguidores': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          } else {
                            logFirebaseEvent('Button_backend_call');

                            await containerUsersRecord.reference.update({
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
                                containerUsersRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        'rtuluwef' /* Seguir */,
                      ),
                      options: FFButtonOptions(
                        width: 100.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                    ),
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.actividad!.esSeguir &&
                      !(currentUserDocument?.listaSeguidos?.toList() ?? [])
                          .contains(containerUsersRecord.reference) &&
                      (valueOrDefault<bool>(
                              currentUserDocument?.cuentaPrivada, false) ==
                          true))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.check_sharp,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'NOTIFICACION_POST_check_sharp_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_backend_call');

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'listaSeguidores': FieldValue.arrayUnion(
                                      [containerUsersRecord.reference]),
                                },
                              ),
                            });
                            logFirebaseEvent('IconButton_backend_call');

                            await containerUsersRecord.reference.update({
                              ...mapToFirestore(
                                {
                                  'listaSeguidos': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                  'ListadeUsuarioenEspera':
                                      FieldValue.arrayRemove(
                                          [currentUserReference]),
                                },
                              ),
                            });
                            logFirebaseEvent('IconButton_backend_call');

                            await widget.actividad!.reference
                                .update(createActividadRecordData(
                              sinLeer: false,
                            ));
                            logFirebaseEvent('IconButton_navigate_to');

                            context.pushNamed('Feed');
                          },
                        ),
                      ),
                    ),
                  if (widget.actividad!.esSeguir &&
                      !(currentUserDocument?.listaSeguidos?.toList() ?? [])
                          .contains(containerUsersRecord.reference) &&
                      (valueOrDefault<bool>(
                              currentUserDocument?.cuentaPrivada, false) ==
                          true))
                    AuthUserStreamWidget(
                      builder: (context) => FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).alternate,
                        icon: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).rojo,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'NOTIFICACION_POST_close_sharp_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_backend_call');

                          await containerUsersRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'ListadeUsuarioenEspera':
                                    FieldValue.arrayRemove(
                                        [currentUserReference]),
                              },
                            ),
                          });
                          logFirebaseEvent('IconButton_backend_call');

                          await widget.actividad!.reference
                              .update(createActividadRecordData(
                            sinLeer: false,
                          ));
                          logFirebaseEvent('IconButton_navigate_to');

                          context.pushNamed('Feed');
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
