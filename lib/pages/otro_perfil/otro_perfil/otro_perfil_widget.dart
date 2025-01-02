import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/componente_perfil_privado/componente_perfil_privado_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar_perfil_ajeno/nav_bar_perfil_ajeno_widget.dart';
import '/components/post_grid_usuario/post_grid_usuario_widget.dart';
import '/components/tarjeta_otro_perfil/tarjeta_otro_perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.tarjetaOtroPerfilModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TarjetaOtroPerfilWidget(
                          perfilAjeno: widget.perfilAjeno!,
                          pageLink: 'a',
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            if ((currentUserDocument?.listaBloqueados
                                        .toList() ??
                                    [])
                                .contains(widget.perfilAjeno))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print(
                                              'ButtonEstaBloqueado pressed ...');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'in53itya' /* Bloqueaste este usuario */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 250.0,
                                          height: 35.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (!(currentUserDocument?.listaBloqueados
                                        .toList() ??
                                    [])
                                .contains(widget.perfilAjeno))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width: 200.0,
                                          child: Stack(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              if (otroPerfilUsersRecord
                                                      .cuentaPrivada ==
                                                  false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<ActividadRecord>>(
                                                    stream:
                                                        queryActividadRecord(
                                                      queryBuilder:
                                                          (actividadRecord) =>
                                                              actividadRecord
                                                                  .where(
                                                                    'creadorActividad',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  )
                                                                  .where(
                                                                    'recibeActividad',
                                                                    isEqualTo:
                                                                        widget
                                                                            .perfilAjeno,
                                                                  )
                                                                  .where(
                                                                    'esSeguir',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .where(
                                                                    'sinLeer',
                                                                    isEqualTo:
                                                                        true,
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                      .toList() ??
                                                                  [])
                                                              .contains(widget
                                                                  .perfilAjeno)) {
                                                            logFirebaseEvent(
                                                                'SiguiendoCuentaPublica_backend_call');

                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'listaSeguidos':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .perfilAjeno
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
                                                                    widget
                                                                        .perfilAjeno
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          }

                                                          if ((currentUserDocument
                                                                      ?.listaSeguidos
                                                                      .toList() ??
                                                                  [])
                                                              .contains(widget
                                                                  .perfilAjeno)) {
                                                            logFirebaseEvent(
                                                                'SiguiendoCuentaPublica_backend_call');

                                                            await widget
                                                                .perfilAjeno!
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
                                                                widget
                                                                    .perfilAjeno!
                                                              ],
                                                              initialPageName:
                                                                  'notificaciones',
                                                              parameterData: {},
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'SiguiendoCuentaPublica_backend_call');

                                                            await widget
                                                                .perfilAjeno!
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
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'otroPerfil',
                                                            queryParameters: {
                                                              'perfilAjeno':
                                                                  serializeParam(
                                                                widget
                                                                    .perfilAjeno,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        text: (currentUserDocument
                                                                        ?.listaSeguidos
                                                                        .toList() ??
                                                                    [])
                                                                .contains(widget
                                                                    .perfilAjeno)
                                                            ? 'Siguiendo'
                                                            : 'Seguir',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 250.0,
                                                          height: 35.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: (currentUserDocument
                                                                          ?.listaSeguidos
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(widget
                                                                      .perfilAjeno)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .fondoIcono
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          elevation: 2.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      80.0),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if (otroPerfilUsersRecord
                                                      .cuentaPrivada ==
                                                  true)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<ActividadRecord>>(
                                                    stream:
                                                        queryActividadRecord(
                                                      queryBuilder:
                                                          (actividadRecord) =>
                                                              actividadRecord
                                                                  .where(
                                                                    'creadorActividad',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  )
                                                                  .where(
                                                                    'recibeActividad',
                                                                    isEqualTo:
                                                                        widget
                                                                            .perfilAjeno,
                                                                  )
                                                                  .where(
                                                                    'esSeguir',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .where(
                                                                    'sinLeer',
                                                                    isEqualTo:
                                                                        true,
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                      .toList() ??
                                                                  [])
                                                              .contains(widget
                                                                  .perfilAjeno)) {
                                                            logFirebaseEvent(
                                                                'SiguiendoCuentaPrivada_backend_call');

                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'ListadeUsuarioenEspera':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .perfilAjeno
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
                                                                  widget
                                                                      .perfilAjeno,
                                                              sinLeer: true,
                                                              meGusta: false,
                                                              esComentario:
                                                                  false,
                                                              esSeguir: true,
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
                                                              imagenPost: null,
                                                            ));
                                                            _model.refNotificacion =
                                                                ActividadRecord
                                                                    .getDocumentFromData(
                                                                        createActividadRecordData(
                                                                          creadorActividad:
                                                                              currentUserReference,
                                                                          recibeActividad:
                                                                              widget.perfilAjeno,
                                                                          sinLeer:
                                                                              true,
                                                                          meGusta:
                                                                              false,
                                                                          esComentario:
                                                                              false,
                                                                          esSeguir:
                                                                              true,
                                                                          nombreUsuarioCreador:
                                                                              currentUserDisplayName,
                                                                          nombreUsuarioReceptor:
                                                                              otroPerfilUsersRecord.displayName,
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
                                                                widget
                                                                    .perfilAjeno!
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
                                                                    widget
                                                                        .perfilAjeno
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
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'otroPerfil',
                                                            queryParameters: {
                                                              'perfilAjeno':
                                                                  serializeParam(
                                                                widget
                                                                    .perfilAjeno,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        text: () {
                                                          if ((currentUserDocument
                                                                      ?.listadeUsuarioenEspera
                                                                      .toList() ??
                                                                  [])
                                                              .contains(widget
                                                                  .perfilAjeno)) {
                                                            return 'Pendiente';
                                                          } else if ((currentUserDocument
                                                                      ?.listaSeguidos
                                                                      .toList() ??
                                                                  [])
                                                              .contains(widget
                                                                  .perfilAjeno)) {
                                                            return 'Siguiendo';
                                                          } else {
                                                            return 'Seguir';
                                                          }
                                                        }(),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 250.0,
                                                          height: 35.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: (currentUserDocument
                                                                          ?.listaSeguidos
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(widget
                                                                      .perfilAjeno)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .fondoIcono
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          elevation: 2.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      80.0),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (() {
                        if (otroPerfilUsersRecord.cuentaPrivada == true) {
                          return otroPerfilUsersRecord.listaSeguidores
                              .contains(currentUserReference);
                        } else if (otroPerfilUsersRecord.cuentaPrivada ==
                            false) {
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
                          model: _model.navBarPerfilAjenoModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarPerfilAjenoWidget(
                            tab: 0,
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
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 70.0),
                            child: StreamBuilder<UsersRecord>(
                              stream:
                                  UsersRecord.getDocument(widget.perfilAjeno!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 12.0,
                                      height: 12.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final postGridUsuariosUsersRecord =
                                    snapshot.data!;

                                return wrapWithModel(
                                  model: _model.postGridUsuariosModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: PostGridUsuarioWidget(
                                    usuario: widget.perfilAjeno,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      if ((otroPerfilUsersRecord.cuentaPrivada == true) &&
                          !(currentUserDocument?.listaSeguidos.toList() ?? [])
                              .contains(otroPerfilUsersRecord.reference))
                        Expanded(
                          child: AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.componentePerfilPrivadoModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const ComponentePerfilPrivadoWidget(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: wrapWithModel(
                      model: _model.navBar1Model,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBar1Widget(
                        tabActiva: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
