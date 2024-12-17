import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/menu_comentario/menu_comentario_widget.dart';
import '/components/sin_comentarios/sin_comentarios_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ver_comentarios_model.dart';
export 'ver_comentarios_model.dart';

class VerComentariosWidget extends StatefulWidget {
  const VerComentariosWidget({
    super.key,
    this.post,
    this.postCreador,
  });

  final UserPostsRecord? post;
  final DocumentReference? postCreador;

  @override
  State<VerComentariosWidget> createState() => _VerComentariosWidgetState();
}

class _VerComentariosWidgetState extends State<VerComentariosWidget>
    with TickerProviderStateMixin {
  late VerComentariosModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerComentariosModel());

    _model.textFieldComentarioTextController ??= TextEditingController();
    _model.textFieldComentarioFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 300.0.ms,
            begin: const Offset(30.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.postCreador!),
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
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: Container(
                  width: 52.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).fondoIcono,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '23jwp3ki' /* Comentarios */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          height: 220.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FutureBuilder<List<PostCommentRecord>>(
                              future: (_model.firestoreRequestCompleter ??=
                                      Completer<List<PostCommentRecord>>()
                                        ..complete(queryPostCommentRecordOnce(
                                          parent: widget.post?.reference,
                                          queryBuilder: (postCommentRecord) =>
                                              postCommentRecord.orderBy(
                                                  'lastEditTime',
                                                  descending: true),
                                        )))
                                  .future,
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
                                List<PostCommentRecord>
                                    listViewComentariosPostCommentRecordList =
                                    snapshot.data!;
                                if (listViewComentariosPostCommentRecordList
                                    .isEmpty) {
                                  return const SinComentariosWidget();
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewComentariosPostCommentRecordList
                                          .length,
                                  itemBuilder:
                                      (context, listViewComentariosIndex) {
                                    final listViewComentariosPostCommentRecord =
                                        listViewComentariosPostCommentRecordList[
                                            listViewComentariosIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewComentariosPostCommentRecord
                                                .userCreator!),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final columnComentarioUsersRecord =
                                              snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onLongPress: () async {
                                              logFirebaseEvent(
                                                  'VER_COMENTARIOS_ColumnComentario_ON_LONG');
                                              logFirebaseEvent(
                                                  'ColumnComentario_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: const Color(0x00000000),
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: SizedBox(
                                                        height: 151.0,
                                                        child:
                                                            MenuComentarioWidget(
                                                          comentario:
                                                              listViewComentariosPostCommentRecord,
                                                          post: widget.post!,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            columnComentarioUsersRecord
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            listViewComentariosPostCommentRecord
                                                                .textComment,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          if (!listViewComentariosPostCommentRecord
                                                              .likesList
                                                              .contains(
                                                                  currentUserReference))
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'VER_COMENTARIOS_COMP_IconNO_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconNO_backend_call');

                                                                await listViewComentariosPostCommentRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'likesList':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                logFirebaseEvent(
                                                                    'IconNO_backend_call');

                                                                await ActividadRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set({
                                                                  ...createActividadRecordData(
                                                                    creadorActividad:
                                                                        currentUserReference,
                                                                    recibeActividad:
                                                                        widget
                                                                            .postCreador,
                                                                    sinLeer:
                                                                        true,
                                                                    meGusta:
                                                                        false,
                                                                    esComentario:
                                                                        false,
                                                                    esSeguir:
                                                                        false,
                                                                    nombreUsuarioCreador:
                                                                        currentUserDisplayName,
                                                                    nombreUsuarioReceptor:
                                                                        containerUsersRecord
                                                                            .displayName,
                                                                    fechaCreacion:
                                                                        getCurrentTimestamp,
                                                                    postRelacionado:
                                                                        widget
                                                                            .post
                                                                            ?.reference,
                                                                    meGustaComentario:
                                                                        true,
                                                                    imagenUsuario:
                                                                        currentUserPhoto,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'imagenPostList': widget
                                                                          .post
                                                                          ?.postPhotolist,
                                                                    },
                                                                  ),
                                                                });
                                                                logFirebaseEvent(
                                                                    'IconNO_refresh_database_request');
                                                                safeSetState(() =>
                                                                    _model.firestoreRequestCompleter =
                                                                        null);
                                                                await _model
                                                                    .waitForFirestoreRequestCompleted();
                                                              },
                                                              child: Icon(
                                                                FFIcons
                                                                    .kheartLines,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .icono,
                                                                size: 10.0,
                                                              ),
                                                            ),
                                                          if (listViewComentariosPostCommentRecord
                                                              .likesList
                                                              .contains(
                                                                  currentUserReference))
                                                            StreamBuilder<
                                                                List<
                                                                    ActividadRecord>>(
                                                              stream:
                                                                  queryActividadRecord(
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
                                                                              widget.postCreador,
                                                                        )
                                                                        .where(
                                                                          'meGustaComentario',
                                                                          isEqualTo:
                                                                              true,
                                                                        )
                                                                        .where(
                                                                          'postRelacionado',
                                                                          isEqualTo: widget
                                                                              .post
                                                                              ?.reference,
                                                                        ),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ActividadRecord>
                                                                    iconSIActividadRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final iconSIActividadRecord =
                                                                    iconSIActividadRecordList
                                                                            .isNotEmpty
                                                                        ? iconSIActividadRecordList
                                                                            .first
                                                                        : null;

                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'VER_COMENTARIOS_COMP_IconSI_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconSI_backend_call');
                                                                    await iconSIActividadRecord!
                                                                        .reference
                                                                        .delete();
                                                                    logFirebaseEvent(
                                                                        'IconSI_backend_call');

                                                                    await listViewComentariosPostCommentRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'likesList':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'IconSI_refresh_database_request');
                                                                    safeSetState(() =>
                                                                        _model.firestoreRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForFirestoreRequestCompleted();
                                                                  },
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kheart,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .rojo,
                                                                    size: 10.0,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          dateTimeFormat(
                                                            "relative",
                                                            listViewComentariosPostCommentRecord
                                                                .lastEditTime!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          listViewComentariosPostCommentRecord
                                                              .likesList.length,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'io827hmk' /*  Likes */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 31.0),
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 30.0,
                                    height: 30.0,
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
                                        currentUserPhoto,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: SizedBox(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model
                                            .textFieldComentarioTextController,
                                        focusNode:
                                            _model.textFieldComentarioFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldComentarioTextController',
                                          const Duration(milliseconds: 0),
                                          () async {
                                            logFirebaseEvent(
                                                'VER_COMENTARIOS_TextFieldComentario_ON_T');
                                            if (functions.returnSpace(_model
                                                .textFieldComentarioTextController
                                                .text)!) {
                                              logFirebaseEvent(
                                                  'TextFieldComentario_update_component_sta');
                                              _model.botonSend = true;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'TextFieldComentario_update_component_sta');
                                              _model.botonSend = false;
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '5v1ingcx' /* Añade un comentario... */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
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
                                        maxLines: 8,
                                        minLines: 1,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textFieldComentarioTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.botonSend == true)
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.send,
                                      color: FlutterFlowTheme.of(context)
                                          .fondoIcono,
                                      size: 24.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VER_COMENTARIOS_COMP_send_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      var postCommentRecordReference =
                                          PostCommentRecord.createDoc(
                                              widget.post!.reference);
                                      await postCommentRecordReference
                                          .set(createPostCommentRecordData(
                                        textComment: _model
                                            .textFieldComentarioTextController
                                            .text,
                                        userCreator: currentUserReference,
                                        post: widget.post?.reference,
                                        dateCreation: getCurrentTimestamp,
                                        lastEditTime: getCurrentTimestamp,
                                      ));
                                      _model.ultimoComentario =
                                          PostCommentRecord.getDocumentFromData(
                                              createPostCommentRecordData(
                                                textComment: _model
                                                    .textFieldComentarioTextController
                                                    .text,
                                                userCreator:
                                                    currentUserReference,
                                                post: widget.post?.reference,
                                                dateCreation:
                                                    getCurrentTimestamp,
                                                lastEditTime:
                                                    getCurrentTimestamp,
                                              ),
                                              postCommentRecordReference);
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      await widget.post!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'numComments':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      var actividadRecordReference =
                                          ActividadRecord.collection.doc();
                                      await actividadRecordReference.set({
                                        ...createActividadRecordData(
                                          creadorActividad:
                                              currentUserReference,
                                          recibeActividad: widget.postCreador,
                                          sinLeer: true,
                                          meGusta: false,
                                          esComentario: true,
                                          esSeguir: false,
                                          nombreUsuarioCreador:
                                              currentUserDisplayName,
                                          nombreUsuarioReceptor:
                                              containerUsersRecord.displayName,
                                          fechaCreacion: getCurrentTimestamp,
                                          postRelacionado:
                                              widget.post?.reference,
                                          meGustaComentario: false,
                                          imagenUsuario: currentUserPhoto,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'imagenPostList':
                                                widget.post?.postPhotolist,
                                          },
                                        ),
                                      });
                                      _model.nuevaActividad =
                                          ActividadRecord.getDocumentFromData({
                                        ...createActividadRecordData(
                                          creadorActividad:
                                              currentUserReference,
                                          recibeActividad: widget.postCreador,
                                          sinLeer: true,
                                          meGusta: false,
                                          esComentario: true,
                                          esSeguir: false,
                                          nombreUsuarioCreador:
                                              currentUserDisplayName,
                                          nombreUsuarioReceptor:
                                              containerUsersRecord.displayName,
                                          fechaCreacion: getCurrentTimestamp,
                                          postRelacionado:
                                              widget.post?.reference,
                                          meGustaComentario: false,
                                          imagenUsuario: currentUserPhoto,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'imagenPostList':
                                                widget.post?.postPhotolist,
                                          },
                                        ),
                                      }, actividadRecordReference);
                                      logFirebaseEvent(
                                          'IconButton_trigger_push_notification');
                                      triggerPushNotification(
                                        notificationTitle:
                                            '${valueOrDefault(currentUserDocument?.userName, '')} comento tu post',
                                        notificationText: _model
                                            .textFieldComentarioTextController
                                            .text,
                                        notificationSound: 'default',
                                        userRefs: [widget.postCreador!],
                                        initialPageName: 'notificaciones',
                                        parameterData: {},
                                      );
                                      logFirebaseEvent(
                                          'IconButton_clear_text_fields_pin_codes');
                                      safeSetState(() {
                                        _model.textFieldComentarioTextController
                                            ?.clear();
                                      });
                                      logFirebaseEvent(
                                          'IconButton_bottom_sheet');
                                      Navigator.pop(context);

                                      safeSetState(() {});
                                    },
                                  ).animateOnPageLoad(animationsMap[
                                      'iconButtonOnPageLoadAnimation']!),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
