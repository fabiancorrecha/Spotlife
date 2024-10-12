import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/empty_component/empty_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'usuarios_recomendados_model.dart';
export 'usuarios_recomendados_model.dart';

class UsuariosRecomendadosWidget extends StatefulWidget {
  const UsuariosRecomendadosWidget({super.key});

  @override
  State<UsuariosRecomendadosWidget> createState() =>
      _UsuariosRecomendadosWidgetState();
}

class _UsuariosRecomendadosWidgetState
    extends State<UsuariosRecomendadosWidget> {
  late UsuariosRecomendadosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsuariosRecomendadosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.orderBy('created_time', descending: true),
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
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
            ),
          );
        }
        List<UsersRecord> containerUsersRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();

        return Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 26.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'vbg51sfp' /* Perfiles recomendados */,
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                  ],
                ),
              ),
              AuthUserStreamWidget(
                builder: (context) => Builder(
                  builder: (context) {
                    final usuarios = functions
                        .usuariosRecomendados(
                            containerUsersRecordList
                                .map((e) => e.reference)
                                .toList(),
                            (currentUserDocument?.listaBloqueados.toList() ??
                                    [])
                                .toList(),
                            (currentUserDocument?.listaSeguidos.toList() ?? [])
                                .toList())
                        .toList();
                    if (usuarios.isEmpty) {
                      return const ComponenteVacioWidget();
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: usuarios.length,
                      itemBuilder: (context, usuariosIndex) {
                        final usuariosItem = usuarios[usuariosIndex];
                        return StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(usuariosItem),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const Center(
                                child: SizedBox(
                                  width: 1.0,
                                  height: 1.0,
                                  child: EmptyComponentWidget(),
                                ),
                              );
                            }

                            final containerUsersRecord = snapshot.data!;

                            return Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Visibility(
                                visible: containerUsersRecord != null,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'USUARIOS_RECOMENDADOS_Row_em3b6bxc_ON_TA');
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
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 500),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      containerUsersRecord
                                                          .displayName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
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
                                                      containerUsersRecord
                                                          .userName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
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
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'USUARIOS_RECOMENDADOS_SEGUIR_BTN_ON_TAP');
                                              if (!(currentUserDocument
                                                          ?.listaSeguidos
                                                          .toList() ??
                                                      [])
                                                  .contains(containerUsersRecord
                                                      .reference)) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'listaSeguidos':
                                                          FieldValue
                                                              .arrayUnion([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'listaSeguidos':
                                                          FieldValue
                                                              .arrayRemove([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }

                                              if (containerUsersRecord
                                                  .listaSeguidores
                                                  .contains(
                                                      currentUserReference)) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await containerUsersRecord
                                                    .reference
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
                                                    'Button_backend_call');

                                                await ActividadRecord.collection
                                                    .doc()
                                                    .set(
                                                        createActividadRecordData(
                                                      creadorActividad:
                                                          currentUserReference,
                                                      recibeActividad:
                                                          containerUsersRecord
                                                              .reference,
                                                      sinLeer: true,
                                                      meGusta: false,
                                                      esComentario: false,
                                                      esSeguir: true,
                                                      nombreUsuarioCreador:
                                                          currentUserDisplayName,
                                                      nombreUsuarioReceptor:
                                                          containerUsersRecord
                                                              .displayName,
                                                      fechaCreacion:
                                                          getCurrentTimestamp,
                                                      postRelacionado: null,
                                                      meGustaComentario: false,
                                                      imagenUsuario:
                                                          currentUserPhoto,
                                                      imagenPost: null,
                                                    ));
                                                logFirebaseEvent(
                                                    'Button_trigger_push_notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      '${valueOrDefault(currentUserDocument?.userName, '')} te sigue',
                                                  notificationText:
                                                      'Ver mas...',
                                                  notificationSound: 'default',
                                                  userRefs: [
                                                    containerUsersRecord
                                                        .reference
                                                  ],
                                                  initialPageName:
                                                      'notificaciones',
                                                  parameterData: {},
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await containerUsersRecord
                                                    .reference
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
                                              }
                                            },
                                            text: (currentUserDocument
                                                            ?.listaSeguidos
                                                            .toList() ??
                                                        [])
                                                    .contains(
                                                        containerUsersRecord
                                                            .reference)
                                                ? 'Siguiendo'
                                                : 'Seguir',
                                            options: FFButtonOptions(
                                              width: 93.0,
                                              height: 28.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                (currentUserDocument
                                                                ?.listaSeguidos
                                                                .toList() ??
                                                            [])
                                                        .contains(
                                                            containerUsersRecord
                                                                .reference)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .fondoIcono
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                FlutterFlowTheme.of(context)
                                                    .fondoIcono,
                                              ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      (currentUserDocument
                                                                      ?.listaSeguidos
                                                                      .toList() ??
                                                                  [])
                                                              .contains(
                                                                  containerUsersRecord
                                                                      .reference)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily),
                                                  ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
