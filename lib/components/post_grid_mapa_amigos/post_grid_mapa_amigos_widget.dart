import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'post_grid_mapa_amigos_model.dart';
export 'post_grid_mapa_amigos_model.dart';

class PostGridMapaAmigosWidget extends StatefulWidget {
  const PostGridMapaAmigosWidget({super.key});

  @override
  State<PostGridMapaAmigosWidget> createState() =>
      _PostGridMapaAmigosWidgetState();
}

class _PostGridMapaAmigosWidgetState extends State<PostGridMapaAmigosWidget>
    with TickerProviderStateMixin {
  late PostGridMapaAmigosModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostGridMapaAmigosModel());

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
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<UserPostsRecord>>(
        stream: queryUserPostsRecord(
          queryBuilder: (userPostsRecord) => userPostsRecord.whereIn(
              'postUser', (currentUserDocument?.listaSeguidos.toList() ?? [])),
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
            decoration: const BoxDecoration(),
            child:
                // debo agregar el formato videos
                Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Builder(
                builder: (context) {
                  final post = containerUserPostsRecordList
                      .map((e) => e.reference)
                      .toList();
                  if (post.isEmpty) {
                    return const Center(
                      child: ComponenteVacioWidget(),
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
                    itemCount: post.length,
                    itemBuilder: (context, postIndex) {
                      final postItem = post[postIndex];
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: StreamBuilder<UserPostsRecord>(
                          stream: UserPostsRecord.getDocument(postItem),
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

                            return SizedBox(
                              width: double.infinity,
                              height: double.infinity,
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
                                          children: List.generate(
                                              listaImagenes.length,
                                              (listaImagenesIndex) {
                                            final listaImagenesItem =
                                                listaImagenes[
                                                    listaImagenesIndex];
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.434,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.32,
                                              decoration: const BoxDecoration(),
                                              child: Visibility(
                                                visible: !stackUserPostsRecord
                                                        .esVideo &&
                                                    stackUserPostsRecord
                                                        .hasPostPhotolist(),
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
                                                        'POST_GRID_MAPA_AMIGOS_Image_lufeg741_ON_');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                      'detallePost',
                                                      pathParameters: {
                                                        'post': serializeParam(
                                                          stackUserPostsRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'post':
                                                            stackUserPostsRecord,
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'Image_update_app_state');
                                                    FFAppState()
                                                            .verCajaComentariosActualizados =
                                                        false;
                                                    safeSetState(() {});
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          listaImagenesItem,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'imageOnPageLoadAnimation']!),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                  if (stackUserPostsRecord.esVideo &&
                                      stackUserPostsRecord.hasVideo())
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
          );
        },
      ),
    );
  }
}
