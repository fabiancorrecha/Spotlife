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
import 'post_grid_usuario_model.dart';
export 'post_grid_usuario_model.dart';

class PostGridUsuarioWidget extends StatefulWidget {
  const PostGridUsuarioWidget({
    super.key,
    this.usuario,
  });

  final DocumentReference? usuario;

  @override
  State<PostGridUsuarioWidget> createState() => _PostGridUsuarioWidgetState();
}

class _PostGridUsuarioWidgetState extends State<PostGridUsuarioWidget>
    with TickerProviderStateMixin {
  late PostGridUsuarioModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostGridUsuarioModel());

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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.usuario!),
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
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: StreamBuilder<List<UserPostsRecord>>(
              stream: queryUserPostsRecord(
                queryBuilder: (userPostsRecord) => userPostsRecord
                    .where(
                      'postUser',
                      isEqualTo: widget.usuario,
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
                List<UserPostsRecord> gridViewUserPostsRecordList =
                    snapshot.data!;

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.72,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewUserPostsRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final gridViewUserPostsRecord =
                        gridViewUserPostsRecordList[gridViewIndex];
                    return StreamBuilder<UserPostsRecord>(
                      stream: UserPostsRecord.getDocument(
                          gridViewUserPostsRecord.reference),
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
                            Builder(
                              builder: (context) {
                                final listaImagenes = gridViewUserPostsRecord
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
                                              'POST_GRID_USUARIO_Container_1gm25dk8_ON_');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            'VistaPostlist',
                                            queryParameters: {
                                              'user': serializeParam(
                                                widget.usuario,
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
                                              'Container_update_app_state');
                                          FFAppState()
                                                  .verCajaComentariosActualizados =
                                              false;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.446,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.323,
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible: !gridViewUserPostsRecord
                                                .esVideo,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'POST_GRID_USUARIO_Image_mgy81b8g_ON_TAP');
                                                logFirebaseEvent(
                                                    'Image_navigate_to');

                                                context.pushNamed(
                                                  'VistaPostlist',
                                                  queryParameters: {
                                                    'user': serializeParam(
                                                      widget.usuario,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
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
                                                    'POST_GRID_USUARIO_Image_mgy81b8g_ON_LONG');
                                                logFirebaseEvent(
                                                    'Image_haptic_feedback');
                                                HapticFeedback.lightImpact();
                                                logFirebaseEvent(
                                                    'Image_expand_image');
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: CachedNetworkImage(
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
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: listaImagenesItem,
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: listaImagenesItem,
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
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
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'imageOnPageLoadAnimation']!),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            if (stackUserPostsRecord.esVideo)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
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
