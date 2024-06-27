import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/componente_perfil_privado/componente_perfil_privado_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/components/post_grid_usuario/post_grid_usuario_widget.dart';
import '/components/tarjeta_otro_perfil/tarjeta_otro_perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
// ignore: unnecessary_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otro_perfil_model.dart';
export 'otro_perfil_model.dart';

class OtroPerfilWidget extends StatefulWidget {
  const OtroPerfilWidget({
    super.key,
    this.perfilAjeno,
  });

  final DocumentReference? perfilAjeno;

  @override
  State<OtroPerfilWidget> createState() => _OtroPerfilWidgetState();
}

class _OtroPerfilWidgetState extends State<OtroPerfilWidget> {
  late OtroPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtroPerfilModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'otroPerfil'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.perfilAjeno!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
            ),
          );
        }
        final otroPerfilUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.tarjetaOtroPerfilModel,
                    updateCallback: () => setState(() {}),
                    child: TarjetaOtroPerfilWidget(
                      usuario: widget.perfilAjeno,
                      pageLink: 'a',
                    ),
                  ),
                  Stack(
                    children: [
                      if ((currentUserDocument?.listaBloqueados?.toList() ?? [])
                          .contains(widget.perfilAjeno))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('ButtonEstaBloqueado pressed ...');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'in53itya' /* Bloqueaste este usuario */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 35.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .fondoIcono,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
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
                              ],
                            ),
                          ),
                        ),
                      if (!(currentUserDocument?.listaBloqueados?.toList() ??
                              [])
                          .contains(widget.perfilAjeno))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      if (otroPerfilUsersRecord.cuentaPrivada ==
                                          false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: StreamBuilder<
                                              List<ActividadRecord>>(
                                            stream: queryActividadRecord(
                                              queryBuilder: (actividadRecord) =>
                                                  actividadRecord
                                                      .where(
                                                        'creadorActividad',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      )
                                                      .where(
                                                        'recibeActividad',
                                                        isEqualTo:
                                                            widget.perfilAjeno,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ActividadRecord>
                                                  siguiendoCuentaPublicaActividadRecordList =
                                                  snapshot.data!;
                                              final siguiendoCuentaPublicaActividadRecord =
                                                  siguiendoCuentaPublicaActividadRecordList
                                                          .isNotEmpty
                                                      ? siguiendoCuentaPublicaActividadRecordList
                                                          .first
                                                      : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'OTRO_PERFIL_SiguiendoCuentaPublica_ON_TA');
                                                  if (!(currentUserDocument
                                                              ?.listaSeguidos
                                                              ?.toList() ??
                                                          [])
                                                      .contains(
                                                          widget.perfilAjeno)) {
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPublica_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'listaSeguidos':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget.perfilAjeno
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPublica_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'listaSeguidos':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            widget.perfilAjeno
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  if ((currentUserDocument
                                                              ?.listaSeguidos
                                                              ?.toList() ??
                                                          [])
                                                      .contains(
                                                          widget.perfilAjeno)) {
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPublica_backend_call');

                                                    await widget.perfilAjeno!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'listaSeguidores':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPublica_backend_call');

                                                    await ActividadRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createActividadRecordData(
                                                          creadorActividad:
                                                              currentUserReference,
                                                          recibeActividad:
                                                              widget
                                                                  .perfilAjeno,
                                                          sinLeer: true,
                                                          meGusta: false,
                                                          esComentario: false,
                                                          esSeguir: true,
                                                          nombreUsuarioCreador:
                                                              currentUserDisplayName,
                                                          nombreUsuarioReceptor:
                                                              otroPerfilUsersRecord
                                                                  .displayName,
                                                          fechaCreacion:
                                                              getCurrentTimestamp,
                                                          postRelacionado: null,
                                                          meGustaComentario:
                                                              false,
                                                          imagenUsuario:
                                                              currentUserPhoto,
                                                          imagenPost: null,
                                                        ));
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPublica_trigger_push_noti');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          '${valueOrDefault(currentUserDocument?.userName, '')} te sigue',
                                                      notificationText:
                                                          'Ver mas...',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        widget.perfilAjeno!
                                                      ],
                                                      initialPageName:
                                                          'notificaciones',
                                                      parameterData: {},
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPublica_backend_call');

                                                    await widget.perfilAjeno!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'listaSeguidores':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPublica_backend_call');
                                                    await siguiendoCuentaPublicaActividadRecord!
                                                        .reference
                                                        .delete();
                                                  }

                                                  logFirebaseEvent(
                                                      'SiguiendoCuentaPublica_navigate_to');
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    'otroPerfil',
                                                    queryParameters: {
                                                      'perfilAjeno':
                                                          serializeParam(
                                                        widget.perfilAjeno,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                text: (currentUserDocument
                                                                ?.listaSeguidos
                                                                ?.toList() ??
                                                            [])
                                                        .contains(
                                                            widget.perfilAjeno)
                                                    ? 'Siguiendo'
                                                    : 'Seguir',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 35.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: (currentUserDocument
                                                                  ?.listaSeguidos
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(widget
                                                              .perfilAjeno)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .fondoIcono
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          80.0),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (otroPerfilUsersRecord.cuentaPrivada ==
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: StreamBuilder<
                                              List<ActividadRecord>>(
                                            stream: queryActividadRecord(
                                              queryBuilder: (actividadRecord) =>
                                                  actividadRecord
                                                      .where(
                                                        'creadorActividad',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      )
                                                      .where(
                                                        'recibeActividad',
                                                        isEqualTo:
                                                            widget.perfilAjeno,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ActividadRecord>
                                                  siguiendoCuentaPrivadaActividadRecordList =
                                                  snapshot.data!;
                                              final siguiendoCuentaPrivadaActividadRecord =
                                                  siguiendoCuentaPrivadaActividadRecordList
                                                          .isNotEmpty
                                                      ? siguiendoCuentaPrivadaActividadRecordList
                                                          .first
                                                      : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'OTRO_PERFIL_SiguiendoCuentaPrivada_ON_TA');
                                                  if (!(currentUserDocument
                                                              ?.listadeUsuarioenEspera
                                                              ?.toList() ??
                                                          [])
                                                      .contains(
                                                          widget.perfilAjeno)) {
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPrivada_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'ListadeUsuarioenEspera':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget.perfilAjeno
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPrivada_backend_call');

                                                    var actividadRecordReference =
                                                        ActividadRecord
                                                            .collection
                                                            .doc();
                                                    await actividadRecordReference
                                                        .set(
                                                            createActividadRecordData(
                                                      creadorActividad:
                                                          currentUserReference,
                                                      recibeActividad:
                                                          widget.perfilAjeno,
                                                      sinLeer: true,
                                                      meGusta: false,
                                                      esComentario: false,
                                                      esSeguir: true,
                                                      nombreUsuarioCreador:
                                                          currentUserDisplayName,
                                                      nombreUsuarioReceptor:
                                                          otroPerfilUsersRecord
                                                              .displayName,
                                                      fechaCreacion:
                                                          getCurrentTimestamp,
                                                      postRelacionado: null,
                                                      meGustaComentario: false,
                                                      imagenUsuario:
                                                          currentUserPhoto,
                                                      imagenPost: null,
                                                    ));
                                                    _model.refNotificacion =
                                                        ActividadRecord
                                                            .getDocumentFromData(
                                                                createActividadRecordData(
                                                                  creadorActividad:
                                                                      currentUserReference,
                                                                  recibeActividad:
                                                                      widget
                                                                          .perfilAjeno,
                                                                  sinLeer: true,
                                                                  meGusta:
                                                                      false,
                                                                  esComentario:
                                                                      false,
                                                                  esSeguir:
                                                                      true,
                                                                  nombreUsuarioCreador:
                                                                      currentUserDisplayName,
                                                                  nombreUsuarioReceptor:
                                                                      otroPerfilUsersRecord
                                                                          .displayName,
                                                                  fechaCreacion:
                                                                      getCurrentTimestamp,
                                                                  postRelacionado:
                                                                      null,
                                                                  meGustaComentario:
                                                                      false,
                                                                  imagenUsuario:
                                                                      currentUserPhoto,
                                                                  imagenPost:
                                                                      null,
                                                                ),
                                                                actividadRecordReference);
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPrivada_trigger_push_noti');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          '${valueOrDefault(currentUserDocument?.userName, '')} te sigue',
                                                      notificationText:
                                                          'Ver mas...',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        widget.perfilAjeno!
                                                      ],
                                                      initialPageName:
                                                          'notificaciones',
                                                      parameterData: {},
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPrivada_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'ListadeUsuarioenEspera':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            widget.perfilAjeno
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'SiguiendoCuentaPrivada_backend_call');
                                                    await siguiendoCuentaPrivadaActividadRecord!
                                                        .reference
                                                        .delete();
                                                  }

                                                  logFirebaseEvent(
                                                      'SiguiendoCuentaPrivada_navigate_to');
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    'otroPerfil',
                                                    queryParameters: {
                                                      'perfilAjeno':
                                                          serializeParam(
                                                        widget.perfilAjeno,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  setState(() {});
                                                },
                                                text: () {
                                                  if ((currentUserDocument
                                                              ?.listadeUsuarioenEspera
                                                              ?.toList() ??
                                                          [])
                                                      .contains(
                                                          widget.perfilAjeno)) {
                                                    return 'Pendiente';
                                                  } else if ((currentUserDocument
                                                              ?.listaSeguidos
                                                              ?.toList() ??
                                                          [])
                                                      .contains(
                                                          widget.perfilAjeno)) {
                                                    return 'Siguiendo';
                                                  } else {
                                                    return 'Seguir';
                                                  }
                                                }(),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 35.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: (currentUserDocument
                                                                  ?.listaSeguidos
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(widget
                                                              .perfilAjeno)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .fondoIcono
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          80.0),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'OTRO_PERFIL_ENVIAR_MENSAJE_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          var chatsRecordReference =
                                              ChatsRecord.collection.doc();
                                          await chatsRecordReference.set({
                                            ...createChatsRecordData(
                                              timeStamp: getCurrentTimestamp,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'userIds': functions
                                                    .generateListOfUsers(
                                                        currentUserReference!,
                                                        otroPerfilUsersRecord
                                                            .reference),
                                                'userNames': functions
                                                    .generateListOfNames(
                                                        currentUserDisplayName,
                                                        otroPerfilUsersRecord
                                                            .displayName),
                                              },
                                            ),
                                          });
                                          _model.refChats =
                                              ChatsRecord.getDocumentFromData({
                                            ...createChatsRecordData(
                                              timeStamp: getCurrentTimestamp,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'userIds': functions
                                                    .generateListOfUsers(
                                                        currentUserReference!,
                                                        otroPerfilUsersRecord
                                                            .reference),
                                                'userNames': functions
                                                    .generateListOfNames(
                                                        currentUserDisplayName,
                                                        otroPerfilUsersRecord
                                                            .displayName),
                                              },
                                            ),
                                          }, chatsRecordReference);
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            'ChatPage',
                                            queryParameters: {
                                              'receiveChat': serializeParam(
                                                _model.refChats?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );

                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          Navigator.pop(context);

                                          setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'v4jg68ds' /* Enviar mensaje */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 150.0,
                                          height: 35.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .fondoIcono,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (() {
                    if (otroPerfilUsersRecord.cuentaPrivada == true) {
                      return otroPerfilUsersRecord.listaSeguidores
                          .contains(currentUserReference);
                    } else if (otroPerfilUsersRecord.cuentaPrivada == false) {
                      return (otroPerfilUsersRecord.listaSeguidores
                              .contains(currentUserReference) ||
                          !otroPerfilUsersRecord.listaSeguidores
                              .contains(currentUserReference));
                    } else {
                      return (otroPerfilUsersRecord.listaSeguidores
                              .contains(currentUserReference) ||
                          !otroPerfilUsersRecord.listaSeguidores
                              .contains(currentUserReference));
                    }
                  }())
                    wrapWithModel(
                      model: _model.navBar2Model,
                      updateCallback: () => setState(() {}),
                      child: NavBar2Widget(
                        otroUsuario: widget.perfilAjeno,
                      ),
                    ),
                  if (otroPerfilUsersRecord.cuentaPrivada == true
                      ? otroPerfilUsersRecord.listaSeguidores
                          .contains(currentUserReference)
                      : (otroPerfilUsersRecord.listaSeguidores
                              .contains(currentUserReference) ||
                          !otroPerfilUsersRecord.listaSeguidores
                              .contains(currentUserReference)))
                    Expanded(
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(widget.perfilAjeno!),
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
                          final postGridUsuariosUsersRecord = snapshot.data!;
                          return wrapWithModel(
                            model: _model.postGridUsuariosModel,
                            updateCallback: () => setState(() {}),
                            child: PostGridUsuarioWidget(
                              usuario: widget.perfilAjeno,
                            ),
                          );
                        },
                      ),
                    ),
                  if (otroPerfilUsersRecord.cuentaPrivada == true
                      ? !otroPerfilUsersRecord.listaSeguidores
                          .contains(currentUserReference)
                      : otroPerfilUsersRecord.listaSeguidores
                          .contains(currentUserReference))
                    Expanded(
                      child: wrapWithModel(
                        model: _model.componentePerfilPrivadoModel,
                        updateCallback: () => setState(() {}),
                        child: ComponentePerfilPrivadoWidget(),
                      ),
                    ),
                  wrapWithModel(
                    model: _model.navBar1Model,
                    updateCallback: () => setState(() {}),
                    child: NavBar1Widget(
                      tabActiva: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
