import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tarjeta_lista01_model.dart';
export 'tarjeta_lista01_model.dart';

class TarjetaLista01Widget extends StatefulWidget {
  const TarjetaLista01Widget({
    super.key,
    this.mostrarBoton,
    required this.seguido,
    this.textoBtn,
  });

  final bool? mostrarBoton;
  final DocumentReference? seguido;
  final String? textoBtn;

  @override
  State<TarjetaLista01Widget> createState() => _TarjetaLista01WidgetState();
}

class _TarjetaLista01WidgetState extends State<TarjetaLista01Widget> {
  late TarjetaLista01Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TarjetaLista01Model());

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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.seguido!),
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
            height: 66.0,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'TARJETA_LISTA01_COMP_Row_sics4md2_ON_TAP');
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                      ],
                    ),
                  ),
                ),
                if (containerUsersRecord.cuentaPrivada == false)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) =>
                          StreamBuilder<List<ActividadRecord>>(
                        stream: queryActividadRecord(
                          queryBuilder: (actividadRecord) => actividadRecord
                              .where(
                                'creadorActividad',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'recibeActividad',
                                isEqualTo: widget.seguido,
                              )
                              .where(
                                'esSeguir',
                                isEqualTo: true,
                              )
                              .where(
                                'sinLeer',
                                isEqualTo: true,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ActividadRecord>
                              cuentaPublicaActividadRecordList = snapshot.data!;

                          final cuentaPublicaActividadRecord =
                              cuentaPublicaActividadRecordList.isNotEmpty
                                  ? cuentaPublicaActividadRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TARJETA_LISTA01_CuentaPublica_ON_TAP');
                              if (!(currentUserDocument?.listaSeguidos
                                          .toList() ??
                                      [])
                                  .contains(widget.seguido)) {
                                logFirebaseEvent('CuentaPublica_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'listaSeguidos': FieldValue.arrayUnion(
                                          [widget.seguido]),
                                    },
                                  ),
                                });
                              } else {
                                logFirebaseEvent('CuentaPublica_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'listaSeguidos': FieldValue.arrayRemove(
                                          [widget.seguido]),
                                    },
                                  ),
                                });
                              }

                              if ((currentUserDocument?.listaSeguidos
                                          .toList() ??
                                      [])
                                  .contains(widget.seguido)) {
                                logFirebaseEvent('CuentaPublica_backend_call');

                                await widget.seguido!.update({
                                  ...mapToFirestore(
                                    {
                                      'listaSeguidores': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('CuentaPublica_backend_call');

                                await ActividadRecord.collection
                                    .doc()
                                    .set(createActividadRecordData(
                                      creadorActividad: currentUserReference,
                                      recibeActividad: widget.seguido,
                                      sinLeer: true,
                                      meGusta: false,
                                      esComentario: false,
                                      esSeguir: true,
                                      nombreUsuarioCreador:
                                          currentUserDisplayName,
                                      nombreUsuarioReceptor:
                                          containerUsersRecord.displayName,
                                      fechaCreacion: getCurrentTimestamp,
                                      postRelacionado: null,
                                      meGustaComentario: false,
                                      imagenUsuario: currentUserPhoto,
                                      imagenPost: null,
                                    ));
                                logFirebaseEvent(
                                    'CuentaPublica_trigger_push_notification');
                                triggerPushNotification(
                                  notificationTitle:
                                      '${valueOrDefault(currentUserDocument?.userName, '')} te sigue',
                                  notificationText: 'Ver mas...',
                                  notificationSound: 'default',
                                  userRefs: [widget.seguido!],
                                  initialPageName: 'notificaciones',
                                  parameterData: {},
                                );
                              } else {
                                logFirebaseEvent('CuentaPublica_backend_call');

                                await widget.seguido!.update({
                                  ...mapToFirestore(
                                    {
                                      'listaSeguidores': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('CuentaPublica_backend_call');
                                await cuentaPublicaActividadRecord!.reference
                                    .delete();
                              }
                            },
                            text:
                                (currentUserDocument?.listaSeguidos.toList() ??
                                            [])
                                        .contains(widget.seguido)
                                    ? 'Siguiendo'
                                    : 'Seguir',
                            options: FFButtonOptions(
                              width: 93.0,
                              height: 28.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: (currentUserDocument?.listaSeguidos
                                              .toList() ??
                                          [])
                                      .contains(widget.seguido)
                                  ? FlutterFlowTheme.of(context).fondoIcono
                                  : FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (containerUsersRecord.cuentaPrivada == true)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) =>
                          StreamBuilder<List<ActividadRecord>>(
                        stream: queryActividadRecord(
                          queryBuilder: (actividadRecord) => actividadRecord
                              .where(
                                'creadorActividad',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'recibeActividad',
                                isEqualTo: widget.seguido,
                              )
                              .where(
                                'esSeguir',
                                isEqualTo: true,
                              )
                              .where(
                                'sinLeer',
                                isEqualTo: true,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ActividadRecord>
                              cuentaPrivadaActividadRecordList = snapshot.data!;

                          final cuentaPrivadaActividadRecord =
                              cuentaPrivadaActividadRecordList.isNotEmpty
                                  ? cuentaPrivadaActividadRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TARJETA_LISTA01_CuentaPrivada_ON_TAP');
                              if (!(currentUserDocument?.listadeUsuarioenEspera
                                          .toList() ??
                                      [])
                                  .contains(containerUsersRecord.reference)) {
                                logFirebaseEvent('CuentaPrivada_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'ListadeUsuarioenEspera':
                                          FieldValue.arrayUnion(
                                              [containerUsersRecord.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('CuentaPrivada_backend_call');

                                await ActividadRecord.collection
                                    .doc()
                                    .set(createActividadRecordData(
                                      creadorActividad: currentUserReference,
                                      recibeActividad:
                                          containerUsersRecord.reference,
                                      sinLeer: true,
                                      meGusta: false,
                                      esComentario: false,
                                      esSeguir: true,
                                      nombreUsuarioCreador:
                                          currentUserDisplayName,
                                      nombreUsuarioReceptor:
                                          containerUsersRecord.displayName,
                                      fechaCreacion: getCurrentTimestamp,
                                      postRelacionado: null,
                                      meGustaComentario: false,
                                      imagenUsuario: currentUserPhoto,
                                      imagenPost: null,
                                    ));
                                logFirebaseEvent(
                                    'CuentaPrivada_trigger_push_notification');
                                triggerPushNotification(
                                  notificationTitle:
                                      '${valueOrDefault(currentUserDocument?.userName, '')} te sigue',
                                  notificationText: 'Ver mas...',
                                  notificationSound: 'default',
                                  userRefs: [containerUsersRecord.reference],
                                  initialPageName: 'notificaciones',
                                  parameterData: {},
                                );
                              } else {
                                logFirebaseEvent('CuentaPrivada_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'ListadeUsuarioenEspera':
                                          FieldValue.arrayRemove(
                                              [containerUsersRecord.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('CuentaPrivada_backend_call');
                                await cuentaPrivadaActividadRecord!.reference
                                    .delete();
                              }

                              logFirebaseEvent('CuentaPrivada_navigate_to');
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
                            },
                            text: () {
                              if ((currentUserDocument?.listadeUsuarioenEspera
                                          .toList() ??
                                      [])
                                  .contains(containerUsersRecord.reference)) {
                                return 'Pendiente';
                              } else if ((currentUserDocument?.listaSeguidos
                                          .toList() ??
                                      [])
                                  .contains(widget.seguido)) {
                                return 'Siguiendo';
                              } else {
                                return 'Seguir';
                              }
                            }(),
                            options: FFButtonOptions(
                              width: 93.0,
                              height: 28.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: (currentUserDocument?.listaSeguidos
                                              .toList() ??
                                          [])
                                      .contains(widget.seguido)
                                  ? FlutterFlowTheme.of(context).fondoIcono
                                  : FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
