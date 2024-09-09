import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/favorito_a_coleccion/favorito_a_coleccion_widget.dart';
import '/components/image_user/image_user_widget.dart';
import '/components/menu_comentario/menu_comentario_widget.dart';
import '/components/menu_post_ajeno/menu_post_ajeno_widget.dart';
import '/components/menu_post_propio/menu_post_propio_widget.dart';
import '/components/sin_comentarios/sin_comentarios_widget.dart';
import '/components/ver_comentarios_desde_detalle/ver_comentarios_desde_detalle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'post_imagen_v2_model.dart';
export 'post_imagen_v2_model.dart';

class PostImagenV2Widget extends StatefulWidget {
  const PostImagenV2Widget({
    super.key,
    this.post,
    this.verIconoCompartir,
    bool? verComentarios,
  }) : verComentarios = verComentarios ?? false;

  final UserPostsRecord? post;
  final bool? verIconoCompartir;
  final bool verComentarios;

  @override
  State<PostImagenV2Widget> createState() => _PostImagenV2WidgetState();
}

class _PostImagenV2WidgetState extends State<PostImagenV2Widget> {
  late PostImagenV2Model _model;

  bool expandableListenerRegistered = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostImagenV2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POST_IMAGEN_V2_postImagenV2_ON_INIT_STAT');
      logFirebaseEvent('postImagenV2_firestore_query');
      _model.obtenerComentarios1 = await queryPostCommentRecordOnce(
        parent: widget.post?.reference,
      );
      logFirebaseEvent('postImagenV2_update_component_state');
      _model.comentariosActuales =
          _model.obtenerComentarios1!.toList().cast<PostCommentRecord>();
      setState(() {});
    });

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(widget.post!.postUser!),
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
                      if (widget.post!.esPrivado) {
                        return (widget.post?.postUser == currentUserReference);
                      } else if (widget.post!.esAmigos) {
                        return ((widget.post?.postUser ==
                                currentUserReference) ||
                            containerUsersRecord.listaSeguidos
                                .contains(currentUserReference));
                      } else if (widget.post!.esPublico) {
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
                                  if (!widget.post!.esVideo)
                                    Builder(
                                      builder: (context) {
                                        final listaImagenes = widget
                                                .post?.postPhotolist
                                                .toList() ??
                                            [];

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
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
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
                                                        'POST_IMAGEN_V2_Image_tgz2ovgy_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                      'detallePost',
                                                      pathParameters: {
                                                        'post': serializeParam(
                                                          widget.post,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'post': widget.post,
                                                      },
                                                    );
                                                  },
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
                                                    imageUrl: listaImagenesItem,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  if (widget.post?.esVideo ?? true)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: FlutterFlowVideoPlayer(
                                        path: widget.post!.video,
                                        videoType: VideoType.network,
                                        width: double.infinity,
                                        height: 570.0,
                                        aspectRatio: 0.72,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                        lazyLoad: true,
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
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'POST_IMAGEN_V2_CircleImage_aqgk9s1o_ON_T');
                                              if (containerUsersRecord
                                                      .reference ==
                                                  currentUserReference) {
                                                logFirebaseEvent(
                                                    'CircleImage_navigate_to');

                                                context.goNamed('perfilPropio');
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
                                                  containerUsersRecord.photoUrl,
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
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
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
                                                              'POST_IMAGEN_V2_COMP_Text_fbekptvt_ON_TAP');
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
                                                        child: Text(
                                                          containerUsersRecord
                                                              .displayName,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 14.0,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'POST_IMAGEN_V2_COMP_Text_g92652er_ON_TAP');
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

                                                              context.pushNamed(
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
                                                            valueOrDefault<
                                                                String>(
                                                              widget.post
                                                                  ?.postTitle,
                                                              'no tittle',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
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
                                                      ),
                                                    ],
                                                  ),
                                                  StreamBuilder<
                                                      List<CollectionsRecord>>(
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
                                                              'POST_IMAGEN_V2_COMP_Row_bl6ylui8_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Row_navigate_to');

                                                          context.pushNamed(
                                                            'gridPostFiltradosUbicacion',
                                                            queryParameters: {
                                                              'postUser':
                                                                  serializeParam(
                                                                widget.post,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'postUser':
                                                                  widget.post,
                                                            },
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (widget.post
                                                                    ?.placeInfo !=
                                                                null)
                                                              Icon(
                                                                FFIcons
                                                                    .kpinLines,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .icono,
                                                                size: 12.0,
                                                              ),
                                                            if ((widget.post?.placeInfo.name != null && widget.post?.placeInfo.name != '') ||
                                                                (widget.post?.placeInfo
                                                                            .city !=
                                                                        null &&
                                                                    widget
                                                                            .post
                                                                            ?.placeInfo
                                                                            .city !=
                                                                        '') ||
                                                                (widget
                                                                        .post
                                                                        ?.placeInfo
                                                                        .latLng !=
                                                                    null))
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${widget.post?.placeInfo.name} ${widget.post?.placeInfo.city} ${rowCollectionsRecord?.placeInfo.latLng?.toString()}'.maybeHandleOverflow(
                                                                        maxChars:
                                                                            30),
                                                                    maxLines: 1,
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
                                                ].divide(const SizedBox(height: 2.0)),
                                              ),
                                            ),
                                          ),
                                          if (widget.post!.collections.isNotEmpty)
                                            StreamBuilder<CollectionsRecord>(
                                              stream:
                                                  CollectionsRecord.getDocument(
                                                      widget.post!.collections
                                                          .first),
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
                                                  decoration: const BoxDecoration(),
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
                                                              'POST_IMAGEN_V2_COMP_IconColeccion_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconColeccion_navigate_to');

                                                          context.pushNamed(
                                                            'miperfilDetalleColeccion',
                                                            queryParameters: {
                                                              'coleccion':
                                                                  serializeParam(
                                                                containerCollectionsRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'esFavorito':
                                                                  serializeParam(
                                                                false,
                                                                ParamType.bool,
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'POST_IMAGEN_V2_COMP_Icon_pnqlzbvv_ON_TAP');
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
                                                            post: widget.post
                                                                ?.reference,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
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
                                                            post: widget.post
                                                                ?.reference,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .icono,
                                              size: 35.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
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
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 15.0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
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
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      InkWell(
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
                                                              'POST_IMAGEN_V2_RichText_ihg117j5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'RichText_navigate_to');

                                                          context.pushNamed(
                                                            'usuariosMeGusta',
                                                            queryParameters: {
                                                              'userPost':
                                                                  serializeParam(
                                                                widget.post
                                                                    ?.reference,
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
                                                                text:
                                                                    formatNumber(
                                                                  widget
                                                                      .post!
                                                                      .likes
                                                                      .length,
                                                                  formatType:
                                                                      FormatType
                                                                          .compact,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'an86ht95' /*  likes */,
                                                                ),
                                                                style:
                                                                    const TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                      ),
                                                    InkWell(
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
                                                            'POST_IMAGEN_V2_RichText_4js0wica_ON_TAP');
                                                        logFirebaseEvent(
                                                            'RichText_navigate_to');

                                                        context.pushNamed(
                                                          'usuariosMeGusta',
                                                          queryParameters: {
                                                            'userPost':
                                                                serializeParam(
                                                              widget.post
                                                                  ?.reference,
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
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model.contar
                                                                    ?.toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                't8vi189h' /*  likes */,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 8.0, 0.0),
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
                                                            MainAxisSize.max,
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
                                                                      0.0, 0.0),
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (_model
                                                                        .verMeGusta)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<ActividadRecord>>(
                                                                          stream:
                                                                              queryActividadRecord(
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
                                                                                  isEqualTo: widget.post?.reference,
                                                                                ),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<ActividadRecord>
                                                                                iconSIActividadRecordList =
                                                                                snapshot.data!;
                                                                            final iconSIActividadRecord = iconSIActividadRecordList.isNotEmpty
                                                                                ? iconSIActividadRecordList.first
                                                                                : null;

                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('POST_IMAGEN_V2_COMP_IconSI_ON_TAP');
                                                                                logFirebaseEvent('IconSI_update_component_state');
                                                                                _model.contar = _model.contar! + -1;
                                                                                _model.verMeGusta = false;
                                                                                setState(() {});
                                                                                logFirebaseEvent('IconSI_backend_call');

                                                                                await widget.post!.reference.update({
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
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('POST_IMAGEN_V2_COMP_IconNO_ON_TAP');
                                                                            logFirebaseEvent('IconNO_update_component_state');
                                                                            _model.contar =
                                                                                _model.contar! + 1;
                                                                            _model.verMeGusta =
                                                                                true;
                                                                            setState(() {});
                                                                            logFirebaseEvent('IconNO_backend_call');

                                                                            await widget.post!.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'likes': FieldValue.arrayUnion([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            logFirebaseEvent('IconNO_backend_call');

                                                                            var actividadRecordReference =
                                                                                ActividadRecord.collection.doc();
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
                                                                                postRelacionado: widget.post?.reference,
                                                                                meGustaComentario: false,
                                                                                imagenUsuario: currentUserPhoto,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'imagenPostList': widget.post?.postPhotolist,
                                                                                },
                                                                              ),
                                                                            });
                                                                            _model.nuevaActividad =
                                                                                ActividadRecord.getDocumentFromData({
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
                                                                                postRelacionado: widget.post?.reference,
                                                                                meGustaComentario: false,
                                                                                imagenUsuario: currentUserPhoto,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'imagenPostList': widget.post?.postPhotolist,
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

                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.kheartLines,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).icono,
                                                                            size:
                                                                                24.0,
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
                                                                    'POST_IMAGEN_V2_COMP_Icon_n7lozqhf_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_firestore_query');
                                                                _model.obtenerComentarios0 =
                                                                    await queryPostCommentRecordOnce(
                                                                  parent: widget
                                                                      .post
                                                                      ?.reference,
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
                                                                          height:
                                                                              419.0,
                                                                          child:
                                                                              VerComentariosDesdeDetalleWidget(
                                                                            post:
                                                                                widget.post,
                                                                            postCreador:
                                                                                widget.post?.postUser,
                                                                            comentariosActuales:
                                                                                _model.obtenerComentarios0!,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(() =>
                                                                        _model.comentariosNuevosComponente =
                                                                            value));

                                                                setState(() {});
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
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (_model
                                                                      .verFavorito)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'POST_IMAGEN_V2_COMP_favoritoSI_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'favoritoSI_update_component_state');
                                                                        _model.verFavorito =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'favoritoSI_backend_call');

                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'listaPostFavoritos': FieldValue.arrayRemove([
                                                                                widget.post?.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'favoritoSI_backend_call');

                                                                        await widget
                                                                            .post!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'FavoritoUser': FieldValue.arrayRemove([
                                                                                currentUserReference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'POST_IMAGEN_V2_favoritoSI_ON_LONG_PRESS');
                                                                        logFirebaseEvent(
                                                                            'favoritoSI_haptic_feedback');
                                                                        HapticFeedback
                                                                            .lightImpact();
                                                                        logFirebaseEvent(
                                                                            'favoritoSI_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          barrierColor:
                                                                              const Color(0x00000000),
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: SizedBox(
                                                                                  height: 573.0,
                                                                                  child: FavoritoAColeccionWidget(
                                                                                    post: widget.post?.reference,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kframe168,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customSeleccion,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (!_model
                                                                      .verFavorito)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'POST_IMAGEN_V2_COMP_favoritoNO_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'favoritoNO_update_component_state');
                                                                        _model.verFavorito =
                                                                            true;
                                                                        setState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'favoritoNO_backend_call');

                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'listaPostFavoritos': FieldValue.arrayUnion([
                                                                                widget.post?.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'favoritoNO_backend_call');

                                                                        await widget
                                                                            .post!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'FavoritoUser': FieldValue.arrayUnion([
                                                                                currentUserReference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'POST_IMAGEN_V2_favoritoNO_ON_LONG_PRESS');
                                                                        logFirebaseEvent(
                                                                            'favoritoNO_haptic_feedback');
                                                                        HapticFeedback
                                                                            .lightImpact();
                                                                        logFirebaseEvent(
                                                                            'favoritoNO_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          barrierColor:
                                                                              const Color(0x00000000),
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: SizedBox(
                                                                                  height: 573.0,
                                                                                  child: FavoritoAColeccionWidget(
                                                                                    post: widget.post?.reference,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kstarLines,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'POST_IMAGEN_V2_COMP_Icon_qxbcwk6v_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_navigate_to');

                                                                  context.pushNamed(
                                                                      'mapa_ir_lugar');
                                                                },
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kcompassUnfilled,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .icono,
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
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 10.0,
                                                        sigmaY: 5.0,
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0x21141313),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Builder(
                                                                    builder:
                                                                        (_) {
                                                                  if (!expandableListenerRegistered) {
                                                                    expandableListenerRegistered =
                                                                        true;
                                                                    _model
                                                                        .expandableExpandableController
                                                                        .addListener(
                                                                      () async {
                                                                        logFirebaseEvent(
                                                                            'POST_IMAGEN_V2_Expandable_fdne0d8t_ON_TO');
                                                                        if (_model
                                                                            .expandableExpandableController
                                                                            .expanded) {
                                                                          logFirebaseEvent(
                                                                              'Expandable_update_component_state');
                                                                          _model.verDescripcionHeader =
                                                                              true;
                                                                          setState(
                                                                              () {});
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Expandable_update_component_state');
                                                                          _model.verDescripcionHeader =
                                                                              false;
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                    );
                                                                  }
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    color: const Color(
                                                                        0x00FFFFFF),
                                                                    child:
                                                                        ExpandableNotifier(
                                                                      controller:
                                                                          _model
                                                                              .expandableExpandableController,
                                                                      child:
                                                                          ExpandablePanel(
                                                                        header:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Text(
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
                                                                                  if (_model.verDescripcionHeader == false)
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        widget.post!.postDescription.maybeHandleOverflow(
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
                                                                                  if (_model.verDescripcionHeader == true)
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.angleUp,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (_model.verDescripcionHeader ==
                                                                                false)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          't6scz3lx' /* Mas */,
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
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        collapsed:
                                                                            Container(),
                                                                        expanded:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        widget.post!.postDescription,
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        theme:
                                                                            const ExpandableThemeData(
                                                                          tapHeaderToExpand:
                                                                              true,
                                                                          tapBodyToExpand:
                                                                              false,
                                                                          tapBodyToCollapse:
                                                                              false,
                                                                          headerAlignment:
                                                                              ExpandablePanelHeaderAlignment.top,
                                                                          hasIcon:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
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
                                                            .fromSTEB(0.0, 8.0,
                                                                8.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .imageUserModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              const ImageUserWidget(
                                                            radioImagen: 20,
                                                          ),
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
                                                                '15i1ftxt' /* Añade un comentario... */,
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 8.0, 0.0),
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
                                                            widget.post!
                                                                .timePosted!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          maxLines: 2,
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
                                                    ],
                                                  ),
                                                ),
                                                if (widget.post?.esVideo ??
                                                    true)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Container(
                                                      width: 0.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
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
                                  if (widget.post!.postPhotolist.length >= 2)
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (!FFAppState().verCajaComentariosActualizados &&
                widget.verComentarios)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 32.0),
                child: Builder(
                  builder: (context) {
                    final comentarios = _model.comentariosActuales.toList();
                    if (comentarios.isEmpty) {
                      return const SinComentariosWidget();
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: comentarios.length,
                      itemBuilder: (context, comentariosIndex) {
                        final comentariosItem = comentarios[comentariosIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                comentariosItem.userCreator!),
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

                              final columnComentarioUsersRecord =
                                  snapshot.data!;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () async {
                                  logFirebaseEvent(
                                      'POST_IMAGEN_V2_ColumnComentario_ON_LONG_');
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
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: 151.0,
                                            child: MenuComentarioWidget(
                                              comentario: comentariosItem,
                                              post: widget.post!,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                columnComentarioUsersRecord
                                                    .photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                comentariosItem.textComment,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if (!comentariosItem.likesList
                                                  .contains(
                                                      currentUserReference))
                                                InkWell(
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
                                                        'POST_IMAGEN_V2_COMP_IconNO_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconNO_backend_call');

                                                    await comentariosItem
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
                                                  },
                                                  child: Icon(
                                                    FFIcons.kheartLines,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icono,
                                                    size: 10.0,
                                                  ),
                                                ),
                                              if (comentariosItem.likesList
                                                  .contains(
                                                      currentUserReference))
                                                InkWell(
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
                                                        'POST_IMAGEN_V2_COMP_IconSI_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconSI_backend_call');

                                                    await comentariosItem
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
                                                  },
                                                  child: Icon(
                                                    FFIcons.kheart,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .rojo,
                                                    size: 10.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              dateTimeFormat(
                                                "relative",
                                                comentariosItem.dateCreation!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            formatNumber(
                                              comentariosItem.likesList.length,
                                              formatType: FormatType.compact,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'n1bsaw0g' /*  Likes */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
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
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            if (FFAppState().verCajaComentariosActualizados &&
                widget.verComentarios)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 32.0),
                child: Builder(
                  builder: (context) {
                    final comentarios =
                        _model.comentariosNuevosComponente?.toList() ?? [];
                    if (comentarios.isEmpty) {
                      return const SinComentariosWidget();
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: comentarios.length,
                      itemBuilder: (context, comentariosIndex) {
                        final comentariosItem = comentarios[comentariosIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                comentariosItem.userCreator!),
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

                              final columnComentarioUsersRecord =
                                  snapshot.data!;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () async {
                                  logFirebaseEvent(
                                      'POST_IMAGEN_V2_ColumnComentario_ON_LONG_');
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
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: 151.0,
                                            child: MenuComentarioWidget(
                                              comentario: comentariosItem,
                                              post: widget.post!,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                columnComentarioUsersRecord
                                                    .photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                comentariosItem.textComment,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if (!comentariosItem.likesList
                                                  .contains(
                                                      currentUserReference))
                                                InkWell(
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
                                                        'POST_IMAGEN_V2_COMP_IconNO_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconNO_backend_call');

                                                    await comentariosItem
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
                                                  },
                                                  child: Icon(
                                                    FFIcons.kheartLines,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icono,
                                                    size: 10.0,
                                                  ),
                                                ),
                                              if (comentariosItem.likesList
                                                  .contains(
                                                      currentUserReference))
                                                InkWell(
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
                                                        'POST_IMAGEN_V2_COMP_IconSI_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconSI_backend_call');

                                                    await comentariosItem
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
                                                  },
                                                  child: Icon(
                                                    FFIcons.kheart,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .rojo,
                                                    size: 10.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              dateTimeFormat(
                                                "relative",
                                                comentariosItem.dateCreation!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            formatNumber(
                                              comentariosItem.likesList.length,
                                              formatType: FormatType.compact,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'rihj4zru' /*  Likes */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
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
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
