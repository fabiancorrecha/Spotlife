import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/menu_post_ajeno/menu_post_ajeno_widget.dart';
import '/components/menu_post_propio/menu_post_propio_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
              'placeInfo.latLng',
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
                final containerVar = functions
                        .filterHiddenPosts(
                            containerUserPostsRecordList.toList(),
                            currentUserReference)
                        ?.toList() ??
                    [];
                if (containerVar.isEmpty) {
                  return const Center(
                    child: SizedBox(
                      width: 200.0,
                      child: ComponenteVacioWidget(),
                    ),
                  );
                }

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

                        return Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((stackUserPostsRecord.postPhotolist.isNotEmpty) ||
                                    ((stackUserPostsRecord.video != '') &&
                                        (stackUserPostsRecord
                                                .postPhotolist.isNotEmpty)) ||
                                    ((stackUserPostsRecord.video == '') &&
                                        (stackUserPostsRecord
                                                .postPhotolist.isNotEmpty)))
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'GRID_POSTS_FILTRADR_POR_UBICACION_Contai');
                                      logFirebaseEvent(
                                          'ContainerImage_navigate_to');

                                      context.pushNamed(
                                        'VistaPostlist',
                                        queryParameters: {
                                          'user': serializeParam(
                                            stackUserPostsRecord.postUser,
                                            ParamType.DocumentReference,
                                          ),
                                          'index': serializeParam(
                                            stackUserPostsRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );

                                      logFirebaseEvent(
                                          'ContainerImage_update_app_state');
                                      FFAppState()
                                              .verCajaComentariosActualizados =
                                          false;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.446,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.323,
                                      decoration: const BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'GRID_POSTS_FILTRADR_POR_UBICACION_Image_');
                                          logFirebaseEvent('Image_navigate_to');

                                          context.pushNamed(
                                            'VistaPostlist',
                                            queryParameters: {
                                              'user': serializeParam(
                                                stackUserPostsRecord.postUser,
                                                ParamType.DocumentReference,
                                              ),
                                              'index': serializeParam(
                                                stackUserPostsRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );

                                          logFirebaseEvent(
                                              'Image_update_app_state');
                                          FFAppState()
                                                  .verCajaComentariosActualizados =
                                              false;
                                          safeSetState(() {});
                                        },
                                        onLongPress: () async {
                                          logFirebaseEvent(
                                              'GRID_POSTS_FILTRADR_POR_UBICACION_Image_');
                                          logFirebaseEvent(
                                              'Image_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent(
                                              'Image_expand_image');
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: CachedNetworkImage(
                                                  fadeInDuration: const Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: const Duration(
                                                      milliseconds: 500),
                                                  imageUrl: containerVarItem
                                                      .postPhotolist
                                                      .firstOrNull!,
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: containerVarItem
                                                    .postPhotolist.firstOrNull!,
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: containerVarItem
                                              .postPhotolist.firstOrNull!,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 500),
                                              imageUrl: containerVarItem
                                                  .postPhotolist.firstOrNull!,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation']!),
                                    ),
                                  ),
                                if ((stackUserPostsRecord.video != '') &&
                                    (stackUserPostsRecord
                                            .postPhotolist.isEmpty))
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.446,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: custom_widgets
                                            .CustomVideoPlayerMiniture(
                                          width: double.infinity,
                                          height: double.infinity,
                                          videoPath: stackUserPostsRecord.video,
                                          soundOn: Icon(
                                            Icons.fourteen_mp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 10.0,
                                          ),
                                          soundOff: Icon(
                                            Icons.sixteen_mp_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 10.0,
                                          ),
                                          fullscreen: Icon(
                                            Icons.thirteen_mp_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 10.0,
                                          ),
                                          closeScreem: Icon(
                                            Icons.onetwothree_outlined,
                                            color: FlutterFlowTheme.of(context)
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
                            if (stackUserPostsRecord.postPhotolist.length >= 2)
                              Align(
                                alignment: const AlignmentDirectional(0.84, -0.79),
                                child: Icon(
                                  FFIcons.kcopy,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(-0.85, -0.87),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.keyboard_control,
                                  color: FlutterFlowTheme.of(context).icono,
                                  size: 24.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'GRID_POSTS_FILTRADR_POR_UBICACION_keyboa');
                                  if (currentUserReference ==
                                      stackUserPostsRecord.postUser) {
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: 196.0,
                                              child: MenuPostPropioWidget(
                                                post: stackUserPostsRecord
                                                    .reference,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: 250.0,
                                              child: MenuPostAjenoWidget(
                                                link: 'hhyhyh',
                                                post: stackUserPostsRecord
                                                    .reference,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                              ),
                            ),
                          ],
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
