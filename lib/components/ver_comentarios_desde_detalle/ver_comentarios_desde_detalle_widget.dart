import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/menu_comentario/menu_comentario_widget.dart';
import '/components/sin_comentarios/sin_comentarios_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ver_comentarios_desde_detalle_model.dart';
export 'ver_comentarios_desde_detalle_model.dart';

class VerComentariosDesdeDetalleWidget extends StatefulWidget {
  const VerComentariosDesdeDetalleWidget({
    super.key,
    this.post,
    this.postCreador,
    required this.comentariosActuales,
  });

  final UserPostsRecord? post;
  final DocumentReference? postCreador;
  final List<PostCommentRecord>? comentariosActuales;

  @override
  State<VerComentariosDesdeDetalleWidget> createState() =>
      _VerComentariosDesdeDetalleWidgetState();
}

class _VerComentariosDesdeDetalleWidgetState
    extends State<VerComentariosDesdeDetalleWidget> {
  late VerComentariosDesdeDetalleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerComentariosDesdeDetalleModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VER_COMENTARIOS_DESDE_DETALLE_verComenta');
      logFirebaseEvent('verComentariosDesdeDetalle_update_compon');
      _model.verComentariosDesdeComponente =
          widget.comentariosActuales!.toList().cast<PostCommentRecord>();
      setState(() {});
    });

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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: const Color(0x000F1316),
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: const Color(0x005E6367),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Color(0x00925192),
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Container(
                        width: 52.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).fondoIcono,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'VER_COMENTARIOS_DESDE_DETALLE_close_roun');
                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().verCajaComentariosActualizados = true;
                        setState(() {});
                        logFirebaseEvent('IconButton_refresh_database_request');
                        setState(() => _model.firestoreRequestCompleter = null);
                        await _model.waitForFirestoreRequestCompleted();
                        logFirebaseEvent(
                            'IconButton_clear_text_fields_pin_codes');
                        setState(() {
                          _model.commentFieldTextController?.clear();
                        });
                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(
                            context, _model.verComentariosDesdeComponente);
                      },
                    ),
                  ],
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '231ald43' /* Comentarios */,
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
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onLongPress: () async {
                                          logFirebaseEvent(
                                              'VER_COMENTARIOS_DESDE_DETALLE_ColumnCome');
                                          logFirebaseEvent(
                                              'ColumnComentario_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: const Color(0x00000000),
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SizedBox(
                                                    height: 151.0,
                                                    child: MenuComentarioWidget(
                                                      comentario:
                                                          listViewComentariosPostCommentRecord,
                                                      post: widget.post!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        containerUsersRecord
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VER_COMENTARIOS_DESDE_DETALLE_IconNO_ON_');
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
                                                                sinLeer: true,
                                                                meGusta: false,
                                                                esComentario:
                                                                    false,
                                                                esSeguir: false,
                                                                nombreUsuarioCreador:
                                                                    currentUserDisplayName,
                                                                nombreUsuarioReceptor:
                                                                    containerUsersRecord
                                                                        .displayName,
                                                                fechaCreacion:
                                                                    getCurrentTimestamp,
                                                                postRelacionado:
                                                                    widget.post
                                                                        ?.reference,
                                                                meGustaComentario:
                                                                    true,
                                                                imagenUsuario:
                                                                    currentUserPhoto,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'imagenPostList':
                                                                      widget
                                                                          .post
                                                                          ?.postPhotolist,
                                                                },
                                                              ),
                                                            });
                                                            logFirebaseEvent(
                                                                'IconNO_refresh_database_request');
                                                            setState(() => _model
                                                                    .firestoreRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForFirestoreRequestCompleted();
                                                          },
                                                          child: Icon(
                                                            FFIcons.kheartLines,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                                iconSIActividadRecordList =
                                                                snapshot.data!;

                                                            final iconSIActividadRecord =
                                                                iconSIActividadRecordList
                                                                        .isNotEmpty
                                                                    ? iconSIActividadRecordList
                                                                        .first
                                                                    : null;
                                                            return InkWell(
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
                                                                    'VER_COMENTARIOS_DESDE_DETALLE_IconSI_ON_');
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
                                                                          FieldValue
                                                                              .arrayRemove([
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
                                                                FFIcons.kheart,
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
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'relative',
                                                        listViewComentariosPostCommentRecord
                                                            .lastEditTime!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      formatType:
                                                          FormatType.compact,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '9rf204c4' /*  Likes */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.commentFieldTextController,
                                      focusNode: _model.commentFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.commentFieldTextController',
                                        const Duration(milliseconds: 300),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'yoq8mhi1' /* Enviar comentario... */,
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
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
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
                                              '')
                                      ? null
                                      : () async {
                                          logFirebaseEvent(
                                              'VER_COMENTARIOS_DESDE_DETALLE_ENVIAR_BTN');
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
                                          _model.nuevoComentario =
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
                                              .addToVerComentariosDesdeComponente(
                                                  _model.nuevoComentario!);
                                          setState(() {});
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState()
                                                  .verCajaComentariosActualizados =
                                              true;
                                          setState(() {});
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
                                                  .verComentariosDesdeComponente);

                                          setState(() {});
                                        },
                                  text: FFLocalizations.of(context).getText(
                                    'v81srtsj' /* Enviar */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 80.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                                    borderSide: const BorderSide(
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
