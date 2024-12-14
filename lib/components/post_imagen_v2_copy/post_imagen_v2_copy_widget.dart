import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/favorito_a_coleccion/favorito_a_coleccion_widget.dart';
import '/components/image_user/image_user_widget.dart';
import '/components/menu_post_ajeno/menu_post_ajeno_widget.dart';
import '/components/menu_post_propio/menu_post_propio_widget.dart';
import '/components/ver_comentarios_desde_detalle/ver_comentarios_desde_detalle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'post_imagen_v2_copy_model.dart';
export 'post_imagen_v2_copy_model.dart';

class PostImagenV2CopyWidget extends StatefulWidget {
  const PostImagenV2CopyWidget({
    super.key,
    this.post,
    this.verIconoCompartir,
    bool? verComentarios,
  }) : verComentarios = verComentarios ?? false;

  final List<UserPostsRecord>? post;
  final bool? verIconoCompartir;
  final bool verComentarios;

  @override
  State<PostImagenV2CopyWidget> createState() => _PostImagenV2CopyWidgetState();
}

class _PostImagenV2CopyWidgetState extends State<PostImagenV2CopyWidget> {
  late PostImagenV2CopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostImagenV2CopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POST_IMAGEN_V2_COPY_postImagenV2Copy_ON_');
      logFirebaseEvent('postImagenV2Copy_firestore_query');
      _model.obtenerComentarios1 = await queryPostCommentRecordOnce(
        parent: widget.post?.firstOrNull?.reference,
      );
      logFirebaseEvent('postImagenV2Copy_update_component_state');
      _model.comentariosActuales =
          _model.obtenerComentarios1!.toList().cast<PostCommentRecord>();
      safeSetState(() {});
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
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final listPost = widget.post?.map((e) => e).toList().toList() ?? [];

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(listPost.length, (listPostIndex) {
                final listPostItem = listPost[listPostIndex];
                return StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(listPostItem.postUser!),
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
                      constraints: const BoxConstraints(
                        maxHeight: 572.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Visibility(
                        visible: () {
                          if (listPostItem.esPrivado) {
                            return (listPostItem.postUser ==
                                currentUserReference);
                          } else if (listPostItem.esAmigos) {
                            return ((listPostItem.postUser ==
                                    currentUserReference) ||
                                containerUsersRecord.listaSeguidos
                                    .contains(currentUserReference));
                          } else if (listPostItem.esPublico) {
                            return true;
                          } else {
                            return false;
                          }
                        }(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      if (!listPostItem.esVideo)
                                        Builder(
                                          builder: (context) {
                                            final listaImagenes = listPostItem
                                                .postPhotolist
                                                .toList();

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    listaImagenes.length,
                                                    (listaImagenesIndex) {
                                                  final listaImagenesItem =
                                                      listaImagenes[
                                                          listaImagenesIndex];
                                                  return Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.7,
                                                    decoration: const BoxDecoration(),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'POST_IMAGEN_V2_COPY_Image_ri6weo2j_ON_TA');
                                                        logFirebaseEvent(
                                                            'Image_navigate_to');

                                                        context.pushNamed(
                                                          'detallePost',
                                                          pathParameters: {
                                                            'post':
                                                                serializeParam(
                                                              listPostItem,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'post':
                                                                listPostItem,
                                                          },
                                                        );
                                                      },
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            listaImagenesItem,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      if (listPostItem.esVideo)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowVideoPlayer(
                                            path: listPostItem.video,
                                            videoType: VideoType.network,
                                            width: double.infinity,
                                            height: 570.0,
                                            aspectRatio: 0.72,
                                            autoPlay: false,
                                            looping: true,
                                            showControls: false,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                            lazyLoad: false,
                                          ),
                                        ),
                                      Container(
                                        height: 60.0,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x771A1A1A),
                                              Color(0x001A1A1A)
                                            ],
                                            stops: [0.5, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'POST_IMAGEN_V2_COPY_CircleImage_b2gz3m2k');
                                                  if (containerUsersRecord
                                                          .reference ==
                                                      currentUserReference) {
                                                    logFirebaseEvent(
                                                        'CircleImage_navigate_to');

                                                    context.goNamed(
                                                        'perfilPropio');
                                                  } else {
                                                    logFirebaseEvent(
                                                        'CircleImage_navigate_to');

                                                    context.pushNamed(
                                                      'otroPerfil',
                                                      queryParameters: {
                                                        'perfilAjeno':
                                                            serializeParam(
                                                          containerUsersRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  clipBehavior: Clip.antiAlias,
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
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
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
                                                                  'POST_IMAGEN_V2_COPY_Text_wih7anov_ON_TAP');
                                                              if (containerUsersRecord
                                                                      .reference ==
                                                                  currentUserReference) {
                                                                logFirebaseEvent(
                                                                    'Text_navigate_to');

                                                                context.goNamed(
                                                                    'perfilPropio');
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Text_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'otroPerfil',
                                                                  queryParameters:
                                                                      {
                                                                    'perfilAjeno':
                                                                        serializeParam(
                                                                      containerUsersRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            },
                                                            child: Text(
                                                              containerUsersRecord
                                                                  .displayName,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
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
                                                                    'POST_IMAGEN_V2_COPY_Text_r8hazp3n_ON_TAP');
                                                                if (containerUsersRecord
                                                                        .reference ==
                                                                    currentUserReference) {
                                                                  logFirebaseEvent(
                                                                      'Text_navigate_to');

                                                                  context.goNamed(
                                                                      'perfilPropio');
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Text_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'otroPerfil',
                                                                    queryParameters:
                                                                        {
                                                                      'perfilAjeno':
                                                                          serializeParam(
                                                                        containerUsersRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                }
                                                              },
                                                              child: Text(
                                                                listPostItem
                                                                    .postTitle,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              CollectionsRecord>>(
                                                        stream:
                                                            queryCollectionsRecord(
                                                          queryBuilder:
                                                              (collectionsRecord) =>
                                                                  collectionsRecord
                                                                      .where(
                                                            'createdBy',
                                                            isEqualTo:
                                                                containerUsersRecord
                                                                    .reference,
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
                                                          List<CollectionsRecord>
                                                              rowCollectionsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowCollectionsRecord =
                                                              rowCollectionsRecordList
                                                                      .isNotEmpty
                                                                  ? rowCollectionsRecordList
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
                                                                  'POST_IMAGEN_V2_COPY_Row_s84b26tv_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              context.pushNamed(
                                                                'gridPostFiltradosUbicacion',
                                                                queryParameters:
                                                                    {
                                                                  'postUser':
                                                                      serializeParam(
                                                                    listPostItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'postUser':
                                                                      listPostItem,
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  FFIcons
                                                                      .kpinLines,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .icono,
                                                                  size: 12.0,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      listPostItem.placeInfo.address
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                      ),
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 2.0)),
                                                  ),
                                                ),
                                              ),
                                              if (listPostItem
                                                      .collections.isNotEmpty)
                                                StreamBuilder<
                                                    CollectionsRecord>(
                                                  stream: CollectionsRecord
                                                      .getDocument(listPostItem
                                                          .collections
                                                          .firstOrNull!),
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

                                                    final containerCollectionsRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Visibility(
                                                        visible:
                                                            containerCollectionsRecord !=
                                                                null,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: InkWell(
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
                                                                  'POST_IMAGEN_V2_COPY_IconColeccion_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconColeccion_navigate_to');

                                                              context.pushNamed(
                                                                'miperfilDetalleColeccion',
                                                                queryParameters:
                                                                    {
                                                                  'coleccion':
                                                                      serializeParam(
                                                                    containerCollectionsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'esFavorito':
                                                                      serializeParam(
                                                                    false,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'usuario':
                                                                      serializeParam(
                                                                    containerUsersRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'refColeccion':
                                                                      serializeParam(
                                                                    containerCollectionsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'coleccion':
                                                                      containerCollectionsRecord,
                                                                },
                                                              );
                                                            },
                                                            child: Icon(
                                                              FFIcons.kpageO,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .icono,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'POST_IMAGEN_V2_COPY_Icon_55gkwjs2_ON_TAP');
                                                  if (currentUserReference ==
                                                      containerUsersRecord
                                                          .reference) {
                                                    logFirebaseEvent(
                                                        'Icon_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: SizedBox(
                                                              height: 319.0,
                                                              child:
                                                                  MenuPostPropioWidget(
                                                                post: listPostItem
                                                                    .reference,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Icon_generate_current_page_link');
                                                    _model.currentPageLink =
                                                        await generateCurrentPageLink(
                                                      context,
                                                      isShortLink: false,
                                                    );

                                                    logFirebaseEvent(
                                                        'Icon_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: SizedBox(
                                                              height: 319.0,
                                                              child:
                                                                  MenuPostAjenoWidget(
                                                                post: listPostItem
                                                                    .reference,
                                                                link: _model
                                                                    .currentPageLink,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                },
                                                child: Icon(
                                                  FFIcons.kmenuDots,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .icono,
                                                  size: 35.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            minHeight: 140.0,
                                            maxHeight: 190.0,
                                          ),
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0x00F5F5F5),
                                                Color(0x91000000)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 15.0),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
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
                                                                  'POST_IMAGEN_V2_COPY_RichText_oup58lwp_ON');
                                                              logFirebaseEvent(
                                                                  'RichText_navigate_to');

                                                              context.pushNamed(
                                                                'usuariosMeGusta',
                                                                queryParameters:
                                                                    {
                                                                  'userPost':
                                                                      serializeParam(
                                                                    listPostItem
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: listPostItem
                                                                        .likes
                                                                        .length
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'oriqhn7v' /*  likes */,
                                                                    ),
                                                                    style:
                                                                        const TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
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
                                                                'POST_IMAGEN_V2_COPY_RichText_erw5grz7_ON');
                                                            logFirebaseEvent(
                                                                'RichText_navigate_to');

                                                            context.pushNamed(
                                                              'usuariosMeGusta',
                                                              queryParameters: {
                                                                'userPost':
                                                                    serializeParam(
                                                                  listPostItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .contar
                                                                        ?.toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '9rqvem5w' /*  likes */,
                                                                  ),
                                                                  style:
                                                                      const TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child: Stack(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (_model
                                                                            .verMeGusta)
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                StreamBuilder<List<ActividadRecord>>(
                                                                              stream: queryActividadRecord(
                                                                                queryBuilder: (actividadRecord) => actividadRecord
                                                                                    .where(
                                                                                      'creadorActividad',
                                                                                      isEqualTo: currentUserReference,
                                                                                    )
                                                                                    .where(
                                                                                      'recibeActividad',
                                                                                      isEqualTo: containerUsersRecord.reference,
                                                                                    )
                                                                                    .where(
                                                                                      'meGusta',
                                                                                      isEqualTo: true,
                                                                                    )
                                                                                    .where(
                                                                                      'postRelacionado',
                                                                                      isEqualTo: listPostItem.reference,
                                                                                    ),
                                                                                singleRecord: true,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 24.0,
                                                                                      height: 24.0,
                                                                                      child: SpinKitPumpingHeart(
                                                                                        color: FlutterFlowTheme.of(context).rojo,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<ActividadRecord> iconSIActividadRecordList = snapshot.data!;
                                                                                final iconSIActividadRecord = iconSIActividadRecordList.isNotEmpty ? iconSIActividadRecordList.first : null;

                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('POST_IMAGEN_V2_COPY_COMP_IconSI_ON_TAP');
                                                                                    logFirebaseEvent('IconSI_update_component_state');
                                                                                    _model.contar = _model.contar! + -1;
                                                                                    _model.verMeGusta = false;
                                                                                    safeSetState(() {});
                                                                                    logFirebaseEvent('IconSI_backend_call');

                                                                                    await listPostItem.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'likes': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    logFirebaseEvent('IconSI_backend_call');
                                                                                    await iconSIActividadRecord!.reference.delete();
                                                                                  },
                                                                                  child: Icon(
                                                                                    FFIcons.kheart,
                                                                                    color: FlutterFlowTheme.of(context).rojo,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        if (!_model
                                                                            .verMeGusta)
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('POST_IMAGEN_V2_COPY_COMP_IconNO_ON_TAP');
                                                                                logFirebaseEvent('IconNO_update_component_state');
                                                                                _model.contar = _model.contar! + 1;
                                                                                _model.verMeGusta = true;
                                                                                safeSetState(() {});
                                                                                logFirebaseEvent('IconNO_backend_call');

                                                                                await listPostItem.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'likes': FieldValue.arrayUnion([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                logFirebaseEvent('IconNO_backend_call');

                                                                                var actividadRecordReference = ActividadRecord.collection.doc();
                                                                                await actividadRecordReference.set({
                                                                                  ...createActividadRecordData(
                                                                                    creadorActividad: currentUserReference,
                                                                                    recibeActividad: containerUsersRecord.reference,
                                                                                    sinLeer: true,
                                                                                    meGusta: true,
                                                                                    esComentario: false,
                                                                                    esSeguir: false,
                                                                                    nombreUsuarioCreador: currentUserDisplayName,
                                                                                    nombreUsuarioReceptor: containerUsersRecord.displayName,
                                                                                    fechaCreacion: getCurrentTimestamp,
                                                                                    postRelacionado: listPostItem.reference,
                                                                                    meGustaComentario: false,
                                                                                    imagenUsuario: currentUserPhoto,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'imagenPostList': listPostItem.postPhotolist,
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                _model.nuevaActividad = ActividadRecord.getDocumentFromData({
                                                                                  ...createActividadRecordData(
                                                                                    creadorActividad: currentUserReference,
                                                                                    recibeActividad: containerUsersRecord.reference,
                                                                                    sinLeer: true,
                                                                                    meGusta: true,
                                                                                    esComentario: false,
                                                                                    esSeguir: false,
                                                                                    nombreUsuarioCreador: currentUserDisplayName,
                                                                                    nombreUsuarioReceptor: containerUsersRecord.displayName,
                                                                                    fechaCreacion: getCurrentTimestamp,
                                                                                    postRelacionado: listPostItem.reference,
                                                                                    meGustaComentario: false,
                                                                                    imagenUsuario: currentUserPhoto,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'imagenPostList': listPostItem.postPhotolist,
                                                                                    },
                                                                                  ),
                                                                                }, actividadRecordReference);
                                                                                logFirebaseEvent('IconNO_trigger_push_notification');
                                                                                triggerPushNotification(
                                                                                  notificationTitle: 'A ${valueOrDefault(currentUserDocument?.userName, '')} le gusto tu post',
                                                                                  notificationText: 'Ver mas...',
                                                                                  notificationSound: 'default',
                                                                                  userRefs: [
                                                                                    containerUsersRecord.reference
                                                                                  ],
                                                                                  initialPageName: 'notificaciones',
                                                                                  parameterData: {},
                                                                                );

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                FFIcons.kheartLines,
                                                                                color: FlutterFlowTheme.of(context).icono,
                                                                                size: 24.0,
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
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: InkWell(
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
                                                                        'POST_IMAGEN_V2_COPY_Icon_xtrk26td_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_firestore_query');
                                                                    _model.obtenerComentarios0 =
                                                                        await queryPostCommentRecordOnce(
                                                                      parent: listPostItem
                                                                          .reference,
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Icon_bottom_sheet');
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          const Color(
                                                                              0x00000000),
                                                                      isDismissible:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                SizedBox(
                                                                              height: 419.0,
                                                                              child: VerComentariosDesdeDetalleWidget(
                                                                                post: listPostItem,
                                                                                postCreador: listPostItem.postUser,
                                                                                comentariosActuales: _model.obtenerComentarios0!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(() =>
                                                                            _model.comentariosNuevosComponente =
                                                                                value));

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .comment,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .icono,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (_model
                                                                              .verFavorito)
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('POST_IMAGEN_V2_COPY_favoritoSI_ON_TAP');
                                                                                logFirebaseEvent('favoritoSI_update_component_state');
                                                                                _model.verFavorito = false;
                                                                                safeSetState(() {});
                                                                                logFirebaseEvent('favoritoSI_backend_call');

                                                                                await currentUserReference!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'listaPostFavoritos': FieldValue.arrayRemove([
                                                                                        listPostItem.reference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                logFirebaseEvent('favoritoSI_backend_call');

                                                                                await listPostItem.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'FavoritoUser': FieldValue.arrayRemove([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              onLongPress: () async {
                                                                                logFirebaseEvent('POST_IMAGEN_V2_COPY_favoritoSI_ON_LONG_P');
                                                                                logFirebaseEvent('favoritoSI_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('favoritoSI_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: const Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: SizedBox(
                                                                                          height: 573.0,
                                                                                          child: FavoritoAColeccionWidget(
                                                                                            post: listPostItem.reference,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Icon(
                                                                                FFIcons.kframe168,
                                                                                color: FlutterFlowTheme.of(context).customSeleccion,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          if (!_model
                                                                              .verFavorito)
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('POST_IMAGEN_V2_COPY_favoritoNO_ON_TAP');
                                                                                logFirebaseEvent('favoritoNO_update_component_state');
                                                                                _model.verFavorito = true;
                                                                                safeSetState(() {});
                                                                                logFirebaseEvent('favoritoNO_backend_call');

                                                                                await currentUserReference!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'listaPostFavoritos': FieldValue.arrayUnion([
                                                                                        listPostItem.reference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                logFirebaseEvent('favoritoNO_backend_call');

                                                                                await listPostItem.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'FavoritoUser': FieldValue.arrayUnion([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              onLongPress: () async {
                                                                                logFirebaseEvent('POST_IMAGEN_V2_COPY_favoritoNO_ON_LONG_P');
                                                                                logFirebaseEvent('favoritoNO_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('favoritoNO_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: const Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: SizedBox(
                                                                                          height: 573.0,
                                                                                          child: FavoritoAColeccionWidget(
                                                                                            post: listPostItem.reference,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Icon(
                                                                                FFIcons.kstarLines,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kcompassUnfilled,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .white,
                                                                    size: 24.0,
                                                                  ),
                                                                  showLoadingIndicator:
                                                                      true,
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'POST_IMAGEN_V2_COPY_compassUnfilled_ICN_');
                                                                    logFirebaseEvent(
                                                                        'IconButton_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'mapa_ir_lugar',
                                                                      queryParameters:
                                                                          {
                                                                        'userPost':
                                                                            serializeParam(
                                                                          listPostItem
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (functions.lenghtCaracter(
                                                            listPostItem
                                                                .postDescription)! <=
                                                        40)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 10.0,
                                                              sigmaY: 5.0,
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x21141313),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        containerUsersRecord
                                                                            .displayName,
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                            .verDescripcionHeader ==
                                                                        false)
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listPostItem
                                                                              .postDescription,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (functions.lenghtCaracter(
                                                            listPostItem
                                                                .postDescription)! >=
                                                        41)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 10.0,
                                                              sigmaY: 5.0,
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height:
                                                                  valueOrDefault<
                                                                      double>(
                                                                _model.verDescripcionHeader ==
                                                                        true
                                                                    ? 250.0
                                                                    : 90.0,
                                                                90.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x21141313),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              containerUsersRecord.displayName,
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (_model.verDescripcionHeader ==
                                                                              false)
                                                                            Expanded(
                                                                              child: Text(
                                                                                listPostItem.postDescription.maybeHandleOverflow(
                                                                                  maxChars: 40,
                                                                                  replacement: '…',
                                                                                ),
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          if (_model.verDescripcionHeader ==
                                                                              true)
                                                                            FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.angleUp,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('POST_IMAGEN_V2_COPY_angleUp_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_update_component_state');
                                                                                _model.verDescripcionHeader = false;
                                                                                safeSetState(() {});
                                                                              },
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                            .verDescripcionHeader ==
                                                                        true)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            if (_model.verDescripcionHeader ==
                                                                                true)
                                                                              Expanded(
                                                                                child: Text(
                                                                                  listPostItem.postDescription,
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (_model
                                                                            .verDescripcionHeader ==
                                                                        false)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('POST_IMAGEN_V2_COPY_Container_chpb6g9y_O');
                                                                                  logFirebaseEvent('Container_update_component_state');
                                                                                  _model.verDescripcionHeader = true;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 40.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '5swmtbhn' /* Mas */,
                                                                                    ),
                                                                                    textAlign: TextAlign.end,
                                                                                    maxLines: 2,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w900,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            ImageUserWidget(
                                                              key: Key(
                                                                  'Key3gj_${listPostIndex}_of_${listPost.length}'),
                                                              radioImagen: 20,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'g8thixl7' /* Añade un comentario... */,
                                                                  ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              dateTimeFormat(
                                                                "relative",
                                                                listPostItem
                                                                    .timePosted!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (listPostItem.esVideo)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width: 0.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (listPostItem.postPhotolist.length >=
                                          2)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.84, -0.79),
                                          child: Icon(
                                            FFIcons.kcopy,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            size: 24.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 0.0,
                              child: Divider(
                                height: 8.0,
                                thickness: 0.0,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
