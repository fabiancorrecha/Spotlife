import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'grid_posts_favoritos_model.dart';
export 'grid_posts_favoritos_model.dart';

class GridPostsFavoritosWidget extends StatefulWidget {
  const GridPostsFavoritosWidget({
    super.key,
    this.coleccion,
  });

  final CollectionsRecord? coleccion;

  @override
  State<GridPostsFavoritosWidget> createState() =>
      _GridPostsFavoritosWidgetState();
}

class _GridPostsFavoritosWidgetState extends State<GridPostsFavoritosWidget>
    with TickerProviderStateMixin {
  late GridPostsFavoritosModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridPostsFavoritosModel());

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Builder(
          builder: (context) {
            final listadoPost =
                widget.coleccion?.postuUserList.toList() ?? [];

            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.72,
              ),
              scrollDirection: Axis.vertical,
              itemCount: listadoPost.length,
              itemBuilder: (context, listadoPostIndex) {
                final listadoPostItem = listadoPost[listadoPostIndex];
                return StreamBuilder<UserPostsRecord>(
                  stream: UserPostsRecord.getDocument(listadoPostItem),
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

                    final stackUserPostsRecord = snapshot.data!;

                    return Stack(
                      children: [
                        if (!stackUserPostsRecord.esVideo)
                          Builder(
                            builder: (context) {
                              final listaImagenes =
                                  stackUserPostsRecord.postPhotolist.toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(listaImagenes.length,
                                      (listaImagenesIndex) {
                                    final listaImagenesItem =
                                        listaImagenes[listaImagenesIndex];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.446,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.32,
                                      decoration: const BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'GRID_POSTS_FAVORITOS_Image_kg9xpbr9_ON_T');
                                          logFirebaseEvent('Image_navigate_to');

                                          context.pushNamed(
                                            'detallePost',
                                            pathParameters: {
                                              'post': serializeParam(
                                                stackUserPostsRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'post': stackUserPostsRecord,
                                            },
                                          );

                                          logFirebaseEvent(
                                              'Image_update_app_state');
                                          FFAppState()
                                                  .verCajaComentariosActualizados =
                                              false;
                                          setState(() {});
                                        },
                                        onLongPress: () async {
                                          logFirebaseEvent(
                                              'GRID_POSTS_FAVORITOS_Image_kg9xpbr9_ON_L');
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
                                                  imageUrl: listaImagenesItem,
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
                                                BorderRadius.circular(20.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 500),
                                              imageUrl: listaImagenesItem,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation']!),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        if (stackUserPostsRecord.esVideo)
                          FlutterFlowVideoPlayer(
                            path: stackUserPostsRecord.video,
                            videoType: VideoType.network,
                            width: 216.0,
                            height: 300.0,
                            autoPlay: true,
                            looping: true,
                            showControls: false,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
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
  }
}
