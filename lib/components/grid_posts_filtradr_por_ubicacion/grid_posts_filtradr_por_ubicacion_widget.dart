import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'grid_posts_filtradr_por_ubicacion_model.dart';
export 'grid_posts_filtradr_por_ubicacion_model.dart';

class GridPostsFiltradrPorUbicacionWidget extends StatefulWidget {
  const GridPostsFiltradrPorUbicacionWidget({
    super.key,
    this.post,
  });

  final UserPostsRecord? post;

  @override
  State<GridPostsFiltradrPorUbicacionWidget> createState() =>
      _GridPostsFiltradrPorUbicacionWidgetState();
}

class _GridPostsFiltradrPorUbicacionWidgetState
    extends State<GridPostsFiltradrPorUbicacionWidget>
    with TickerProviderStateMixin {
  late GridPostsFiltradrPorUbicacionModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridPostsFiltradrPorUbicacionModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
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
    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord
            .where(
              'placeInfo.localizacion',
              isEqualTo: widget.post?.placeInfo.latLng?.toGeoPoint(),
            )
            .orderBy('timePosted', descending: true),
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
        List<UserPostsRecord> containerUserPostsRecordList = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0x000F1316),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Builder(
              builder: (context) {
                final containerVar = containerUserPostsRecordList.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.72,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: containerVar.length,
                  itemBuilder: (context, containerVarIndex) {
                    final containerVarItem = containerVar[containerVarIndex];
                    return StreamBuilder<UserPostsRecord>(
                      stream: UserPostsRecord.getDocument(
                          containerVarItem.reference),
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

                        final stackUserPostsRecord = snapshot.data!;

                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'GRID_POSTS_FILTRADR_POR_UBICACION_Stack_');
                            if (stackUserPostsRecord.postUser ==
                                currentUserReference) {
                              logFirebaseEvent('Stack_navigate_to');

                              context.goNamed('perfilPropio');
                            } else {
                              logFirebaseEvent('Stack_navigate_to');

                              context.pushNamed(
                                'otroPerfil',
                                queryParameters: {
                                  'perfilAjeno': serializeParam(
                                    stackUserPostsRecord.postUser,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                          child: Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  final listaImagenes = stackUserPostsRecord
                                      .postPhotolist
                                      .toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(listaImagenes.length,
                                              (listaImagenesIndex) {
                                        final listaImagenesItem =
                                            listaImagenes[listaImagenesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'GRID_POSTS_FILTRADR_POR_UBICACION_Contai');
                                            if (stackUserPostsRecord.postUser ==
                                                currentUserReference) {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.goNamed('perfilPropio');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'otroPerfil',
                                                queryParameters: {
                                                  'perfilAjeno': serializeParam(
                                                    stackUserPostsRecord
                                                        .postUser,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.449,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.32,
                                            decoration: const BoxDecoration(),
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: Stack(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 0.0),
                                                children: [
                                                  if (!containerVarItem.esVideo)
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onLongPress: () async {
                                                        logFirebaseEvent(
                                                            'GRID_POSTS_FILTRADR_POR_UBICACION_Image_');
                                                        logFirebaseEvent(
                                                            'Image_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Image_expand_image');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
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
                                                                    listaImagenesItem,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  listaImagenesItem,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: listaImagenesItem,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
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
                                                                listaImagenesItem,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'imageOnPageLoadAnimation']!),
                                                  if (stackUserPostsRecord
                                                      .esVideo)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 300.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          child: custom_widgets
                                                              .CustomVideoPlayerMiniture(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            videoPath:
                                                                containerVarItem
                                                                    .video,
                                                            soundOn: Icon(
                                                              Icons.fourteen_mp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            soundOff: Icon(
                                                              Icons
                                                                  .sixteen_mp_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            fullscreen: Icon(
                                                              Icons
                                                                  .thirteen_mp_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            closeScreem: Icon(
                                                              Icons
                                                                  .onetwothree_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            buttonSize: 40.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
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
                                      'GRID_POSTS_FILTRADR_POR_UBICACION_Contai');
                                  if (stackUserPostsRecord.postUser ==
                                      currentUserReference) {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.goNamed('perfilPropio');
                                  } else {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'otroPerfil',
                                      queryParameters: {
                                        'perfilAjeno': serializeParam(
                                          stackUserPostsRecord.postUser,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0x000F1316),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
