import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/menu_comentario/menu_comentario_widget.dart';
import '/components/sin_comentarios/sin_comentarios_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
// ignore: unnecessary_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
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

class _VerComentariosWidgetState extends State<VerComentariosWidget> {
  late VerComentariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerComentariosModel());

    _model.commentFieldTextController ??= TextEditingController();
    _model.commentFieldFocusNode ??= FocusNode();

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
            borderRadius: BorderRadius.only(
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
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
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          height: 220.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                  return SinComentariosWidget();
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                barrierColor: Color(0x00000000),
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
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
                                                  padding: EdgeInsetsDirectional
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
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
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
                                                              EdgeInsetsDirectional
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
                                                                setState(() =>
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
                                                                    setState(() =>
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
                                                  padding: EdgeInsetsDirectional
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
                                                            'relative',
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 31.0),
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).fondoIcono,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.commentFieldTextController,
                                      focusNode: _model.commentFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.commentFieldTextController',
                                        Duration(milliseconds: 300),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'kqo18cr2' /* Enviar comentario... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
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
                                      keyboardType: TextInputType.multiline,
                                      validator: _model
                                          .commentFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: (_model.commentFieldTextController
                                                  .text ==
                                              null ||
                                          _model.commentFieldTextController
                                                  .text ==
                                              '')
                                      ? null
                                      : () async {
                                          logFirebaseEvent(
                                              'VER_COMENTARIOS_COMP_ENVIAR_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          var postCommentRecordReference =
                                              PostCommentRecord.createDoc(
                                                  widget.post!.reference);
                                          await postCommentRecordReference
                                              .set(createPostCommentRecordData(
                                            textComment: _model
                                                .commentFieldTextController
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
                                                        .commentFieldTextController
                                                        .text,
                                                    userCreator:
                                                        currentUserReference,
                                                    post:
                                                        widget.post?.reference,
                                                    dateCreation:
                                                        getCurrentTimestamp,
                                                    lastEditTime:
                                                        getCurrentTimestamp,
                                                  ),
                                                  postCommentRecordReference);
                                          logFirebaseEvent(
                                              'Button_update_component_state');
                                          _model
                                              .addToComentariosDesdeComponente(
                                                  _model.ultimoComentario!);
                                          setState(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          var actividadRecordReference =
                                              ActividadRecord.collection.doc();
                                          await actividadRecordReference.set({
                                            ...createActividadRecordData(
                                              creadorActividad:
                                                  currentUserReference,
                                              recibeActividad:
                                                  widget.postCreador,
                                              sinLeer: true,
                                              meGusta: false,
                                              esComentario: true,
                                              esSeguir: false,
                                              nombreUsuarioCreador:
                                                  currentUserDisplayName,
                                              nombreUsuarioReceptor:
                                                  containerUsersRecord
                                                      .displayName,
                                              fechaCreacion:
                                                  getCurrentTimestamp,
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
                                              ActividadRecord
                                                  .getDocumentFromData({
                                            ...createActividadRecordData(
                                              creadorActividad:
                                                  currentUserReference,
                                              recibeActividad:
                                                  widget.postCreador,
                                              sinLeer: true,
                                              meGusta: false,
                                              esComentario: true,
                                              esSeguir: false,
                                              nombreUsuarioCreador:
                                                  currentUserDisplayName,
                                              nombreUsuarioReceptor:
                                                  containerUsersRecord
                                                      .displayName,
                                              fechaCreacion:
                                                  getCurrentTimestamp,
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
                                              'Button_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle:
                                                '${valueOrDefault(currentUserDocument?.userName, '')} comento tu post',
                                            notificationText: _model
                                                .commentFieldTextController
                                                .text,
                                            notificationSound: 'default',
                                            userRefs: [widget.postCreador!],
                                            initialPageName: 'notificaciones',
                                            parameterData: {},
                                          );
                                          logFirebaseEvent(
                                              'Button_refresh_database_request');
                                          setState(() =>
                                              _model.firestoreRequestCompleter =
                                                  null);
                                          await _model
                                              .waitForFirestoreRequestCompleted();
                                          logFirebaseEvent(
                                              'Button_clear_text_fields_pin_codes');
                                          setState(() {
                                            _model.commentFieldTextController
                                                ?.clear();
                                          });
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          Navigator.pop(
                                              context,
                                              _model
                                                  .comentariosDesdeComponente);

                                          setState(() {});
                                        },
                                  text: FFLocalizations.of(context).getText(
                                    'bg4ft6gr' /* Enviar */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 80.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: _model.commentFieldTextController
                                                          .text ==
                                                      null ||
                                                  _model.commentFieldTextController
                                                          .text ==
                                                      ''
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                    disabledColor:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    hoverElevation: 0.0,
                                  ),
                                ),
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
